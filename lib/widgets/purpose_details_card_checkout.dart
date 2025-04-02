import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pripocog_privacy_policy_interface/components/localization.dart';
import 'package:pripocog_privacy_policy_interface/l10n/app_localizations.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/policy.dart';
import 'package:pripocog_privacy_policy_interface/widgets/data_card_checkout.dart';
import 'package:pripocog_privacy_policy_interface/widgets/data_recipient_card_checkout.dart';
import 'package:vector_graphics/vector_graphics.dart';

class PurposeDetailsCardCheckout extends StatefulWidget {
  final int index;
  final ExpansionTileController controller = ExpansionTileController();

  PurposeDetailsCardCheckout({
    super.key,
    required this.index,
  });

  void expand() {
    controller.expand();
  }

  void collapse() {
    controller.collapse();
  }

  @override
  State<PurposeDetailsCardCheckout> createState() =>
      _PurposeDetailsCardCheckoutState();
}

class _PurposeDetailsCardCheckoutState
    extends State<PurposeDetailsCardCheckout> {
  String _calculateRetention(String value, BuildContext context) {
    int seconds = int.parse(value);
    int years = (seconds / 31556926).floor();
    seconds -= years * 31556926;
    int months = (seconds / 2629743).floor();
    seconds -= months * 2629743;
    int days = (seconds / 86400).floor();
    String res = "";
    if (years > 0) {
      res += "$years ${AppLocalizations.of(context)!.years} ";
    }
    if (months > 0) {
      res += "$months ${AppLocalizations.of(context)!.months} ";
    }
    if (days > 0) {
      res += "$days ${AppLocalizations.of(context)!.days} ";
    }
    return res != ""
        ? res + AppLocalizations.of(context)!.retention_after_purpose
        : res;
  }

  @override
  Widget build(BuildContext context) {
    final Rx<Policy> policy = Get.find();
    final int purposeCategoryIndex =
        policy.value.purposeIndexToCategoryIndex[widget.index]!;
    return Obx(() => Card(
          child: ExpansionTile(
            controller: widget.controller,
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Tooltip(
                    message: AppLocalizations.of(context)!.policy_edit_purposes(
                        policy.value.purposeCategories[purposeCategoryIndex]
                            .name),
                    preferBelow: false,
                    child: VectorGraphic(
                      loader: AssetBytesLoader(
                          "assets/DaPIS/purpose_categories/${policy.value.purposeCategories[purposeCategoryIndex].name}.svg"),
                      semanticsLabel: policy
                          .value.purposeCategories[purposeCategoryIndex].name,
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
                Text(
                  Localization.getTranslation(
                      policy.value.purposeList![widget.index].head),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                if (policy.value.purposeList![widget.index]
                    .automatedDecisionMakingList!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Tooltip(
                      message: AppLocalizations.of(context)!
                          .purpose_card_automated_decision_making,
                      preferBelow: false,
                      child: const VectorGraphic(
                        loader: AssetBytesLoader(
                            "assets/DaPIS/purpose_details/automated_decision_making.svg"),
                        semanticsLabel: "Automated Decision Making",
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ),
                if (policy.value.purposeList![widget.index].required ?? false)
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Tooltip(
                      message:
                          AppLocalizations.of(context)!.purpose_card_required,
                      preferBelow: false,
                      child: const VectorGraphic(
                        loader: AssetBytesLoader("assets/material/lock.svg"),
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ),
              ],
            ),
// Content
            childrenPadding: const EdgeInsets.all(20),
            initiallyExpanded: true,
            maintainState: true,
            shape: const Border(),
            children: [
// Description - Purpose
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Tooltip(
                    message:
                        AppLocalizations.of(context)!.purpose_card_description,
                    preferBelow: false,
                    child: const VectorGraphic(
                      loader: AssetBytesLoader("assets/material/info.svg"),
                      semanticsLabel: "Description",
                      height: 30,
                      width: 30,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Card(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(Localization.getTranslation(
                            policy.value.purposeList![widget.index].desc)),
                      ),
                      const Divider(
                        color: Colors.transparent,
                        height: 0,
                      ),
                    ],
                  ),
                ),
              ),
// Retention
              if (policy.value.purposeList![widget.index].retention!.type != "")
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Tooltip(
                      message:
                          AppLocalizations.of(context)!.purpose_card_retention,
                      preferBelow: false,
                      child: const VectorGraphic(
                        loader:
                            AssetBytesLoader("assets/DaPIS/retention/retention.svg"),
                        semanticsLabel: "Retention",
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ],
                ),
              if (policy.value.purposeList![widget.index].retention!.type != "")
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Tooltip(
                            message: AppLocalizations.of(context)!.retention_types(
                                "${policy.value.purposeList![widget.index].retention!.type}"),
                            preferBelow: false,
                            child: VectorGraphic(
                              loader: AssetBytesLoader(
                                  "assets/DaPIS/retention/${policy.value.purposeList![widget.index].retention!.type}.svg"),
                              semanticsLabel: policy.value
                                  .purposeList![widget.index].retention!.type,
                              height: 40,
                              width: 40,
                            ),
                          ),
                          if (policy.value.purposeList![widget.index].retention!
                                      .type ==
                                  "afterPurpose" &&
                              policy.value.purposeList![widget.index].retention!
                                      .pointInTime !=
                                  "0")
                            Text(_calculateRetention(
                                policy.value.purposeList![widget.index]
                                    .retention!.pointInTime!,
                                context)),
                          if (policy.value.purposeList![widget.index].retention!
                                  .type ==
                              "fixedDate")
                            Text(
                                "${AppLocalizations.of(context)!.retention_fixed_Date} ${AppLocalizations.of(context)!.date(DateTime.parse(policy.value.purposeList![widget.index].retention!.pointInTime!))}"),
                          const Divider(
                            color: Colors.black,
                          ),
                          Text(Localization.getTranslation(policy.value
                              .purposeList![widget.index].retention!.desc)),
                        ],
                      ),
                    ),
                  ),
                ),
// Data
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Tooltip(
                      message: AppLocalizations.of(context)!.purpose_card_data,
                      preferBelow: false,
                      child: const VectorGraphic(
                        loader: AssetBytesLoader(
                            "assets/DaPIS/purpose_details/personal_data.svg"),
                        semanticsLabel: "Data",
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ),
                  Text(
                    "(${policy.value.purposeList![widget.index].numberOfAcceptedData}/${policy.value.purposeList![widget.index].dataList!.length})",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              for (int i = 0;
                  i < policy.value.purposeList![widget.index].dataList!.length;
                  i++)
                if (policy.value.purposeList![widget.index].dataList![i]
                        .pointOfAcceptance !=
                    "")
                  DataCardCheckout(index: i, superPurpose: widget.index),
// Data Recipients
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Tooltip(
                        message: AppLocalizations.of(context)!
                            .purpose_card_data_recipients,
                        preferBelow: false,
                        child: const VectorGraphic(
                          loader: AssetBytesLoader(
                              "assets/DaPIS/roles/DataRecipient.svg"),
                          semanticsLabel: "Data Recipient",
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ),
                    Text(
                      "(${policy.value.purposeList![widget.index].numberOfAcceptedDataRecipients}/${policy.value.purposeList![widget.index].dataRecipientList!.length})",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              for (int i = 0;
                  i <
                      policy.value.purposeList![widget.index].dataRecipientList!
                          .length;
                  i++)
                if (policy.value.purposeList![widget.index]
                        .dataRecipientList![i].pointOfAcceptance !=
                    "")
                  DataRecipientCardCheckout(
                      index: i, superPurpose: widget.index),
// Legal Bases
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Tooltip(
                        message: AppLocalizations.of(context)!
                            .purpose_card_legal_bases,
                        preferBelow: false,
                        child: const VectorGraphic(
                          loader: AssetBytesLoader(
                              "assets/DaPIS/legal_bases/legalBases.svg"),
                          semanticsLabel: "Legal Bases",
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      for (int i = 0;
                          i <
                              policy.value.purposeList![widget.index]
                                  .legalBasisList!.length;
                          i++)
                        Column(
                          children: [
                            const Divider(
                              color: Colors.transparent,
                              height: 0,
                            ),
                            Tooltip(
                              message: AppLocalizations.of(context)!
                                  .legal_bases(policy
                                          .value
                                          .purposeList![widget.index]
                                          .legalBasisList![i]
                                          .lbCategory ??
                                      ""),
                              preferBelow: false,
                              child: VectorGraphic(
                                loader: AssetBytesLoader(
                                    "assets/DaPIS/legal_bases/${policy.value.purposeList![widget.index].legalBasisList![i].lbCategory}.svg"),
                                semanticsLabel: AppLocalizations.of(context)!
                                    .legal_bases(policy
                                            .value
                                            .purposeList![widget.index]
                                            .legalBasisList![i]
                                            .lbCategory ??
                                        ""),
                                height: 40,
                                width: 40,
                              ),
                            ),
                            Text(Localization.getTranslation(policy
                                .value
                                .purposeList![widget.index]
                                .legalBasisList![i]
                                .desc)),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
// Automated Decision Making
              if (policy.value.purposeList![widget.index]
                  .automatedDecisionMakingList!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Tooltip(
                          message: AppLocalizations.of(context)!
                              .purpose_card_automated_decision_making,
                          preferBelow: false,
                          child: const VectorGraphic(
                            loader: AssetBytesLoader(
                                "assets/DaPIS/purpose_details/automated_decision_making.svg"),
                            semanticsLabel: "Automated Decision Making",
                            height: 40,
                            width: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              if (policy.value.purposeList![widget.index]
                  .automatedDecisionMakingList!.isNotEmpty)
                for (int i = 0;
                    i <
                        policy.value.purposeList![widget.index]
                            .automatedDecisionMakingList!.length;
                    i++)
                  Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Divider(
                            color: Colors.transparent,
                            height: 0,
                          ),
                          Text(
                            Localization.getTranslation(policy
                                .value
                                .purposeList![widget.index]
                                .automatedDecisionMakingList![i]
                                .head),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(Localization.getTranslation(policy
                              .value
                              .purposeList![widget.index]
                              .automatedDecisionMakingList![i]
                              .desc)),
                          if (i + 1 <
                              policy.value.purposeList![widget.index]
                                  .automatedDecisionMakingList!.length)
                            const Divider(
                              color: Colors.black,
                            ),
                        ],
                      ),
                    ),
                  ),
// More Details
              if (policy.value.purposeList![widget.index].privacyModelList!
                      .isNotEmpty ||
                  policy.value.purposeList![widget.index]
                      .pseudonymizationMethodList!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Tooltip(
                        message: AppLocalizations.of(context)!
                            .purpose_card_more_details,
                        preferBelow: false,
                        child: const VectorGraphic(
                          loader: AssetBytesLoader("assets/material/more_horiz.svg"),
                          semanticsLabel: "More Details",
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              if (policy.value.purposeList![widget.index].privacyModelList!
                      .isNotEmpty ||
                  policy.value.purposeList![widget.index]
                      .pseudonymizationMethodList!.isNotEmpty)
                Card(
                  color: Colors.white,
                  child: ExpansionTile(
                    title: Row(
                      children: [
                        Text(policy.value.purposeList![widget.index]
                                .privacyModelList!.isNotEmpty
                            ? policy.value.purposeList![widget.index]
                                    .pseudonymizationMethodList!.isNotEmpty
                                ? AppLocalizations.of(context)!
                                    .purpose_card_privacy_models_and_pseudonymization
                                : AppLocalizations.of(context)!
                                    .purpose_card_privacy_models
                            : AppLocalizations.of(context)!
                                .purpose_card_pseudonymization),
                      ],
                    ),
                    childrenPadding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 8),
                    initiallyExpanded: false,
                    maintainState: true,
                    shape: const Border(),
                    children: [
                      for (int i = 0;
                          i <
                              policy.value.purposeList![widget.index]
                                  .privacyModelList!.length;
                          i++)
                        Column(children: [
                          Text(
                            Localization.getTranslation(policy
                                .value
                                .purposeList![widget.index]
                                .privacyModelList![i]
                                .head),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(Localization.getTranslation(policy
                              .value
                              .purposeList![widget.index]
                              .privacyModelList![i]
                              .desc)),
                          if (i + 1 <
                                  policy.value.purposeList![widget.index]
                                      .privacyModelList!.length ||
                              policy.value.purposeList![widget.index]
                                  .pseudonymizationMethodList!.isNotEmpty)
                            const Divider(
                              color: Colors.black,
                            ),
                        ]),
                      for (int i = 0;
                          i <
                              policy.value.purposeList![widget.index]
                                  .pseudonymizationMethodList!.length;
                          i++)
                        Column(children: [
                          Text(
                            Localization.getTranslation(policy
                                .value
                                .purposeList![widget.index]
                                .pseudonymizationMethodList![i]
                                .head),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(Localization.getTranslation(policy
                              .value
                              .purposeList![widget.index]
                              .pseudonymizationMethodList![i]
                              .desc)),
                          if (i + 1 <
                              policy.value.purposeList![widget.index]
                                  .pseudonymizationMethodList!.length)
                            const Divider(
                              color: Colors.black,
                            ),
                        ]),
                    ],
                  ),
                ),
            ],
          ),
        ));
  }
}
