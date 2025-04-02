import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pripocog_privacy_policy_interface/components/localization.dart';
import 'package:pripocog_privacy_policy_interface/components/policy_storage.dart';
import 'package:pripocog_privacy_policy_interface/l10n/app_localizations.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/policy.dart';
import 'package:vector_graphics/vector_graphics.dart';

class DataRecipientCard extends StatelessWidget {
  final int index;
  final int superPurpose;

  const DataRecipientCard(
      {super.key, required this.index, this.superPurpose = -1});

  Future<void> _acceptDataRecipient(
      int selectedPurposeCategoryIndex, int selectedPurposeIndex) async {
    final Rx<Policy> policy = Get.find();
    policy.value.purposeList![selectedPurposeIndex]
        .acceptDataRecipient(selectedPurposeCategoryIndex, index, superPurpose);
    await PolicyStorage.checkPolicy();
  }

  Future<void> _declineDataRecipient(
      int selectedPurposeCategoryIndex, int selectedPurposeIndex) async {
    final Rx<Policy> policy = Get.find();
    policy.value.purposeList![selectedPurposeIndex].declineDataRecipient(
        selectedPurposeCategoryIndex, index, superPurpose);
    await PolicyStorage.checkPolicy();
  }

  @override
  Widget build(BuildContext context) {
    final Rx<Policy> policy = Get.find();
    final int selectedPurposeCategoryIndex =
        policy.value.selectedPurposeCategoryIndex;
    final int selectedPurposeIndex = policy.value.selectedPurposeIndex;
    return Obx(() => Card(
          color: Colors.white,
          shape: policy.value.purposeList![selectedPurposeIndex]
                  .dataRecipientList![index].error.isNotEmpty
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
                Text(Localization.getTranslation(policy
                    .value
                    .purposeList![selectedPurposeIndex]
                    .dataRecipientList![index]
                    .head)),
// Country
                if (policy.value.purposeList![selectedPurposeIndex]
                    .dataRecipientList![index].country!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Tooltip(
                      message: AppLocalizations.of(context)!.countries(policy
                          .value
                          .purposeList![selectedPurposeIndex]
                          .dataRecipientList![index]
                          .country!
                          .replaceAll("*", "_")),
                      preferBelow: false,
                      child: VectorGraphic(
                        loader: AssetBytesLoader(
                            "assets/flags/${policy.value.purposeList![selectedPurposeIndex].dataRecipientList![index].country!.toLowerCase().replaceAll("*", "_")}.svg"),
                        height: 30,
                      ),
                    ),
                  ),
// Type
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Tooltip(
                    message: AppLocalizations.of(context)!.entity_types(policy
                            .value
                            .purposeList![selectedPurposeIndex]
                            .dataRecipientList![index]
                            .classification
                            ?.replaceAll(" ", "") ??
                        ""),
                    preferBelow: false,
                    child: VectorGraphic(
                      loader: AssetBytesLoader(
                          "assets/DaPIS/entity_types/${policy.value.purposeList![selectedPurposeIndex].dataRecipientList![index].classification?.replaceAll(" ", "")}.svg"),
                      semanticsLabel: AppLocalizations.of(context)!
                          .entity_types(policy
                                  .value
                                  .purposeList![selectedPurposeIndex]
                                  .dataRecipientList![index]
                                  .classification
                                  ?.replaceAll(" ", "") ??
                              ""),
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
                if (policy.value.purposeList![selectedPurposeIndex]
                    .dataRecipientList![index].error.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Tooltip(
                      message: policy.value.purposeList![selectedPurposeIndex]
                          .dataRecipientList![index].error
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
                if (policy.value.purposeList![selectedPurposeIndex]
                        .dataRecipientList![index].required ??
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
              ],
            ),
            leading: Checkbox(
              value: policy.value.purposeList![selectedPurposeIndex]
                      .dataRecipientList![index].pointOfAcceptance !=
                  "",
              onChanged: (value) => value!
                  ? _acceptDataRecipient(
                      selectedPurposeCategoryIndex, selectedPurposeIndex)
                  : _declineDataRecipient(
                      selectedPurposeCategoryIndex, selectedPurposeIndex),
              activeColor: Colors.green.shade700,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              overlayColor: null,
            ),
// Content
            childrenPadding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 8),
            initiallyExpanded: policy.value.purposeList![selectedPurposeIndex]
                .dataRecipientList![index].expanded,
            onExpansionChanged: (value) => policy
                .value
                .purposeList![selectedPurposeIndex]
                .dataRecipientList![index]
                .expanded = value,
            maintainState: true,
            shape: const Border(),
            children: [
// Desciption
              Row(
                children: [
                  Tooltip(
                    message: AppLocalizations.of(context)!
                        .policy_edit_description_title,
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
              Text(Localization.getTranslation(policy
                  .value
                  .purposeList![selectedPurposeIndex]
                  .dataRecipientList![index]
                  .desc)),
// Safeguards
              if (policy.value.purposeList![selectedPurposeIndex]
                      .dataRecipientList![index].safeguardList!.isNotEmpty &&
                  policy
                      .value
                      .purposeList![selectedPurposeIndex]
                      .dataRecipientList![index]
                      .safeguardList![0]
                      .head!
                      .isNotEmpty)
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: Tooltip(
                        message: AppLocalizations.of(context)!.entity_types(
                            policy.value.purposeList![selectedPurposeIndex]
                                    .dataRecipientList![index].classification
                                    ?.replaceAll(" ", "") ??
                                ""),
                        preferBelow: false,
                        child: const VectorGraphic(
                          loader: AssetBytesLoader(
                              "assets/DaPIS/purpose_details/safeguards.svg"),
                          semanticsLabel: "Safeguards",
                          height: 32,
                          width: 32,
                        ),
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.data_recipient_safeguards,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              if (policy.value.purposeList![selectedPurposeIndex]
                      .dataRecipientList![index].safeguardList!.isNotEmpty &&
                  policy
                      .value
                      .purposeList![selectedPurposeIndex]
                      .dataRecipientList![index]
                      .safeguardList![0]
                      .head!
                      .isNotEmpty)
                for (int i = 0;
                    i <
                        policy.value.purposeList![selectedPurposeIndex]
                            .dataRecipientList![index].safeguardList!.length;
                    i++)
                  Column(
                    children: [
                      Text(
                        Localization.getTranslation(policy
                            .value
                            .purposeList![selectedPurposeIndex]
                            .dataRecipientList![index]
                            .safeguardList![i]
                            .head),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(Localization.getTranslation(policy
                          .value
                          .purposeList![selectedPurposeIndex]
                          .dataRecipientList![index]
                          .safeguardList![i]
                          .desc)),
                    ],
                  ),
            ],
          ),
        ));
  }
}
