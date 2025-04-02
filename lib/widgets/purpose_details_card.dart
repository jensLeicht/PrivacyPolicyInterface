import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pripocog_privacy_policy_interface/components/localization.dart';
import 'package:pripocog_privacy_policy_interface/components/policy_storage.dart';
import 'package:pripocog_privacy_policy_interface/l10n/app_localizations.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/policy.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/purpose_state.dart';
import 'package:pripocog_privacy_policy_interface/widgets/data_card.dart';
import 'package:pripocog_privacy_policy_interface/widgets/data_recipient_card.dart';
import 'package:pripocog_privacy_policy_interface/widgets/purpose_card.dart';
import 'package:vector_graphics/vector_graphics.dart';

class PurposeDetailsCard extends StatefulWidget {
  const PurposeDetailsCard({super.key});

  @override
  State<PurposeDetailsCard> createState() => _PurposeDetailsCardState();
}

class _PurposeDetailsCardState extends State<PurposeDetailsCard> {
  Future<void> _acceptPurpose(int selectedPurposeCategoryIndex,
      int selectedPurposeIndex, int superPurpose) async {
    final Rx<Policy> policy = Get.find();
    policy.value.purposeList![selectedPurposeIndex]
        .accept(selectedPurposeCategoryIndex, superPurpose);
    await PolicyStorage.checkPolicy();
  }

  Future<void> _declinePurpose(int selectedPurposeCategoryIndex,
      int selectedPurposeIndex, int superPurpose) async {
    final Rx<Policy> policy = Get.find();
    policy.value.purposeList![selectedPurposeIndex]
        .decline(selectedPurposeCategoryIndex, superPurpose);
    await PolicyStorage.checkPolicy();
  }

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
    return Obx(() => Card(
          shape: policy.value.purposeList![policy.value.selectedPurposeIndex]
                  .error.isNotEmpty
              ? RoundedRectangleBorder(
                  side: const BorderSide(
                      color: Colors.red,
                      width: 3,
                      strokeAlign: BorderSide.strokeAlignInside),
                  borderRadius: BorderRadius.circular(12))
              : null,
          child: ExpansionTile(
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Tooltip(
                    message: AppLocalizations.of(context)!.policy_edit_purposes(
                        policy
                            .value
                            .purposeCategories[
                                policy.value.selectedPurposeCategoryIndex]
                            .name),
                    preferBelow: false,
                    child: VectorGraphic(
                      loader: AssetBytesLoader(
                          "assets/DaPIS/purpose_categories/${policy.value.purposeCategories[policy.value.selectedPurposeCategoryIndex].name}.svg"),
                      semanticsLabel: policy
                          .value
                          .purposeCategories[
                              policy.value.selectedPurposeCategoryIndex]
                          .name,
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
                Text(
                  Localization.getTranslation(policy.value
                      .purposeList![policy.value.selectedPurposeIndex].head),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (policy.value.purposeList![policy.value.selectedPurposeIndex]
                    .error.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Tooltip(
                      message: policy.value
                          .purposeList![policy.value.selectedPurposeIndex].error
                          .map((error) =>
                              AppLocalizations.of(context)!.errors(error))
                          .toList()
                          .join(" "),
                      preferBelow: false,
                      child: const VectorGraphic(
                        loader: AssetBytesLoader("assets/material/warning.svg"),
                        semanticsLabel: "warning",
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ),
                const Spacer(),
                if (policy.value.purposeList![policy.value.selectedPurposeIndex]
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
                if (policy.value.purposeList![policy.value.selectedPurposeIndex]
                        .required ??
                    false)
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
                Switch(
                  activeTrackColor: policy
                              .value
                              .purposeList![policy.value.selectedPurposeIndex]
                              .state ==
                          PurposeState.accept
                      ? Colors.green.shade700
                      : Colors.orange,
                  hoverColor: Colors.transparent,
                  activeColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  overlayColor: null,
                  value: policy
                          .value
                          .purposeList![policy.value.selectedPurposeIndex]
                          .pointOfAcceptance !=
                      "",
                  onChanged: (value) => value
                      ? _acceptPurpose(
                          policy.value.selectedPurposeCategoryIndex,
                          policy.value.selectedPurposeIndex,
                          policy.value.superPurpose)
                      : _declinePurpose(
                          policy.value.selectedPurposeCategoryIndex,
                          policy.value.selectedPurposeIndex,
                          policy.value.superPurpose),
                ),
              ],
            ),
// Content
            childrenPadding: const EdgeInsets.all(20),
            initiallyExpanded: true,
            maintainState: true,
            shape: const Border(),
            leading: IconButton(
              onPressed: () {
                if (policy.value.superPurpose < 0) {
                  policy.value.selectedPurposeCategoryIndex = -1;
                  policy.value.selectedPurposeIndex = -1;
                } else {
                  policy.value.selectedPurposeIndex = policy.value.superPurpose;
                  policy.value.superPurpose = policy.value.purposeIndex[policy
                          .value.purposeList!
                          .firstWhereOrNull((element) => element
                              .subPurposeIndices
                              .contains(policy.value.superPurpose))
                          ?.name] ??
                      -1;
                }
                policy.refresh();
              },
              icon: const Icon(Icons.arrow_back_outlined),
            ),
            children: [
              if (policy.value.purposeList![policy.value.selectedPurposeIndex]
                  .error.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Card(
                    color: Colors.red,
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              for (int i = 0;
                                  i <
                                      policy
                                          .value
                                          .purposeList![
                                              policy.value.selectedPurposeIndex]
                                          .error
                                          .length;
                                  ++i)
                                Text(
                                  AppLocalizations.of(context)!.errors(
                                      "${policy.value.purposeList![policy.value.selectedPurposeIndex].error[i]}Below"),
                                  style: const TextStyle(color: Colors.white),
                                ),
                            ])),
                        const Divider(
                          color: Colors.transparent,
                          height: 0,
                        ),
                      ],
                    ),
                  ),
                ),
// Description - Purpose
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Tooltip(
                      message: AppLocalizations.of(context)!
                          .purpose_card_description,
                      preferBelow: false,
                      child: const VectorGraphic(
                        loader: AssetBytesLoader("assets/material/info.svg"),
                        semanticsLabel: "Description",
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Text(
                      AppLocalizations.of(context)!.purpose_card_description,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
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
                        child: Text(Localization.getTranslation(policy
                            .value
                            .purposeList![policy.value.selectedPurposeIndex]
                            .desc)),
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
              if (policy.value.purposeList![policy.value.selectedPurposeIndex]
                      .retention!.type !=
                  "")
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Tooltip(
                        message: AppLocalizations.of(context)!
                            .purpose_card_retention,
                        preferBelow: false,
                        child: const VectorGraphic(
                          loader: AssetBytesLoader(
                              "assets/DaPIS/retention/retention.svg"),
                          semanticsLabel: "Retention",
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Text(
                        AppLocalizations.of(context)!.purpose_card_retention,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              if (policy.value.purposeList![policy.value.selectedPurposeIndex]
                      .retention!.type !=
                  "")
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
                                "${policy.value.purposeList![policy.value.selectedPurposeIndex].retention!.type}"),
                            preferBelow: false,
                            child: VectorGraphic(
                              loader: AssetBytesLoader(
                                  "assets/DaPIS/retention/${policy.value.purposeList![policy.value.selectedPurposeIndex].retention!.type}.svg"),
                              semanticsLabel: policy
                                  .value
                                  .purposeList![
                                      policy.value.selectedPurposeIndex]
                                  .retention!
                                  .type,
                              height: 40,
                              width: 40,
                            ),
                          ),
                          if (policy
                                      .value
                                      .purposeList![
                                          policy.value.selectedPurposeIndex]
                                      .retention!
                                      .type ==
                                  "afterPurpose" &&
                              policy
                                      .value
                                      .purposeList![
                                          policy.value.selectedPurposeIndex]
                                      .retention!
                                      .pointInTime !=
                                  "0")
                            Text(_calculateRetention(
                                policy
                                    .value
                                    .purposeList![
                                        policy.value.selectedPurposeIndex]
                                    .retention!
                                    .pointInTime!,
                                context)),
                          if (policy
                                  .value
                                  .purposeList![
                                      policy.value.selectedPurposeIndex]
                                  .retention!
                                  .type ==
                              "fixedDate")
                            Text(
                                "${AppLocalizations.of(context)!.retention_fixed_Date} ${AppLocalizations.of(context)!.date(DateTime.parse(policy.value.purposeList![policy.value.selectedPurposeIndex].retention!.pointInTime!))}"),
                          const Divider(
                            color: Colors.black,
                          ),
                          Text(Localization.getTranslation(policy
                              .value
                              .purposeList![policy.value.selectedPurposeIndex]
                              .retention!
                              .desc)),
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
                    padding: const EdgeInsets.only(right: 10),
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
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Text(
                      AppLocalizations.of(context)!.purpose_card_data,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "(${policy.value.purposeList![policy.value.selectedPurposeIndex].numberOfAcceptedData}/${policy.value.purposeList![policy.value.selectedPurposeIndex].dataList!.length})",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              for (int i = 0;
                  i <
                      policy
                          .value
                          .purposeList![policy.value.selectedPurposeIndex]
                          .dataList!
                          .length;
                  i++)
                DataCard(index: i, superPurpose: policy.value.superPurpose),
// Data Recipients
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
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
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Text(
                        AppLocalizations.of(context)!
                            .purpose_card_data_recipients,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "(${policy.value.purposeList![policy.value.selectedPurposeIndex].numberOfAcceptedDataRecipients}/${policy.value.purposeList![policy.value.selectedPurposeIndex].dataRecipientList!.length})",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              for (int i = 0;
                  i <
                      policy
                          .value
                          .purposeList![policy.value.selectedPurposeIndex]
                          .dataRecipientList!
                          .length;
                  i++)
                DataRecipientCard(
                    index: i, superPurpose: policy.value.superPurpose),
// Legal Bases
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
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
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Text(
                        AppLocalizations.of(context)!.purpose_card_legal_bases,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
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
                              policy
                                  .value
                                  .purposeList![
                                      policy.value.selectedPurposeIndex]
                                  .legalBasisList!
                                  .length;
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
                                          .purposeList![
                                              policy.value.selectedPurposeIndex]
                                          .legalBasisList![i]
                                          .lbCategory ??
                                      ""),
                              preferBelow: false,
                              child: VectorGraphic(
                                loader: AssetBytesLoader(
                                    "assets/DaPIS/legal_bases/${policy.value.purposeList![policy.value.selectedPurposeIndex].legalBasisList![i].lbCategory}.svg"),
                                semanticsLabel: AppLocalizations.of(context)!
                                    .legal_bases(policy
                                            .value
                                            .purposeList![policy
                                                .value.selectedPurposeIndex]
                                            .legalBasisList![i]
                                            .lbCategory ??
                                        ""),
                                height: 40,
                                width: 40,
                              ),
                            ),
                            Text(Localization.getTranslation(policy
                                .value
                                .purposeList![policy.value.selectedPurposeIndex]
                                .legalBasisList![i]
                                .desc)),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
// Automated Decision Making
              if (policy.value.purposeList![policy.value.selectedPurposeIndex]
                  .automatedDecisionMakingList!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Text(
                          AppLocalizations.of(context)!
                              .purpose_card_automated_decision_making,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              if (policy.value.purposeList![policy.value.selectedPurposeIndex]
                  .automatedDecisionMakingList!.isNotEmpty)
                for (int i = 0;
                    i <
                        policy
                            .value
                            .purposeList![policy.value.selectedPurposeIndex]
                            .automatedDecisionMakingList!
                            .length;
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
                                .purposeList![policy.value.selectedPurposeIndex]
                                .automatedDecisionMakingList![i]
                                .head),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(Localization.getTranslation(policy
                              .value
                              .purposeList![policy.value.selectedPurposeIndex]
                              .automatedDecisionMakingList![i]
                              .desc)),
                          if (i + 1 <
                              policy
                                  .value
                                  .purposeList![
                                      policy.value.selectedPurposeIndex]
                                  .automatedDecisionMakingList!
                                  .length)
                            const Divider(
                              color: Colors.black,
                            ),
                        ],
                      ),
                    ),
                  ),
// Sub-Purposes
              if (policy.value.purposeList![policy.value.selectedPurposeIndex]
                  .subPurposeIndices.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Tooltip(
                          message: AppLocalizations.of(context)!
                              .purpose_card_sub_purposes,
                          preferBelow: false,
                          child: const VectorGraphic(
                            loader: AssetBytesLoader(
                                "assets/material/account_tree.svg"),
                            semanticsLabel: "Sub-Purposes",
                            height: 40,
                            width: 40,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Text(
                          AppLocalizations.of(context)!
                              .purpose_card_sub_purposes,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Obx(() => Text(
                          "(${policy.value.purposeList![policy.value.selectedPurposeIndex].numberOfAcceptedSubPurposes}/${policy.value.purposeList![policy.value.selectedPurposeIndex].subPurposeIndices.length})",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ))),
                    ],
                  ),
                ),
              for (int i = 0;
                  i <
                      policy
                          .value
                          .purposeList![policy.value.selectedPurposeIndex]
                          .subPurposeIndices
                          .length;
                  ++i)
                PurposeCard(
                    index: policy
                        .value
                        .purposeList![policy.value.selectedPurposeIndex]
                        .subPurposeIndices[i],
                    categoryIndex: policy.value.selectedPurposeCategoryIndex,
                    superPurpose: policy.value.selectedPurposeIndex),
// More Details
              if (policy.value.purposeList![policy.value.selectedPurposeIndex]
                      .privacyModelList!.isNotEmpty ||
                  policy.value.purposeList![policy.value.selectedPurposeIndex]
                      .pseudonymizationMethodList!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Tooltip(
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
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Text(
                          AppLocalizations.of(context)!
                              .purpose_card_more_details,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              if (policy.value.purposeList![policy.value.selectedPurposeIndex]
                      .privacyModelList!.isNotEmpty ||
                  policy.value.purposeList![policy.value.selectedPurposeIndex]
                      .pseudonymizationMethodList!.isNotEmpty)
                Card(
                  color: Colors.white,
                  child: ExpansionTile(
                    title: Row(
                      children: [
                        Text(policy
                                .value
                                .purposeList![policy.value.selectedPurposeIndex]
                                .privacyModelList!
                                .isNotEmpty
                            ? policy
                                    .value
                                    .purposeList![
                                        policy.value.selectedPurposeIndex]
                                    .pseudonymizationMethodList!
                                    .isNotEmpty
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
                              policy
                                  .value
                                  .purposeList![
                                      policy.value.selectedPurposeIndex]
                                  .privacyModelList!
                                  .length;
                          i++)
                        Column(children: [
                          Text(
                            Localization.getTranslation(policy
                                .value
                                .purposeList![policy.value.selectedPurposeIndex]
                                .privacyModelList![i]
                                .head),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(Localization.getTranslation(policy
                              .value
                              .purposeList![policy.value.selectedPurposeIndex]
                              .privacyModelList![i]
                              .desc)),
                          if (i + 1 <
                                  policy
                                      .value
                                      .purposeList![
                                          policy.value.selectedPurposeIndex]
                                      .privacyModelList!
                                      .length ||
                              policy
                                  .value
                                  .purposeList![
                                      policy.value.selectedPurposeIndex]
                                  .pseudonymizationMethodList!
                                  .isNotEmpty)
                            const Divider(
                              color: Colors.black,
                            ),
                        ]),
                      for (int i = 0;
                          i <
                              policy
                                  .value
                                  .purposeList![
                                      policy.value.selectedPurposeIndex]
                                  .pseudonymizationMethodList!
                                  .length;
                          i++)
                        Column(children: [
                          Text(
                            Localization.getTranslation(policy
                                .value
                                .purposeList![policy.value.selectedPurposeIndex]
                                .pseudonymizationMethodList![i]
                                .head),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(Localization.getTranslation(policy
                              .value
                              .purposeList![policy.value.selectedPurposeIndex]
                              .pseudonymizationMethodList![i]
                              .desc)),
                          if (i + 1 <
                              policy
                                  .value
                                  .purposeList![
                                      policy.value.selectedPurposeIndex]
                                  .pseudonymizationMethodList!
                                  .length)
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
