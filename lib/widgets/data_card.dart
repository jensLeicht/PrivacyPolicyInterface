import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pripocog_privacy_policy_interface/components/localization.dart';
import 'package:pripocog_privacy_policy_interface/components/policy_storage.dart';
import 'package:pripocog_privacy_policy_interface/l10n/app_localizations.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/policy.dart';
import 'package:vector_graphics/vector_graphics.dart';

class DataCard extends StatelessWidget {
  final int index;
  final int superPurpose;

  const DataCard({super.key, required this.index, this.superPurpose = -1});

  Future<void> _acceptData(
      int selectedPurposeCategoryIndex, int selectedPurposeIndex) async {
    final Rx<Policy> policy = Get.find();
    policy.value.purposeList![selectedPurposeIndex]
        .acceptData(selectedPurposeCategoryIndex, index, superPurpose);
    await PolicyStorage.checkPolicy();
  }

  Future<void> _declineData(
      int selectedPurposeCategoryIndex, int selectedPurposeIndex) async {
    final Rx<Policy> policy = Get.find();
    policy.value.purposeList![selectedPurposeIndex]
        .declineData(selectedPurposeCategoryIndex, index, superPurpose);
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
                  .dataList![index].error.isNotEmpty
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
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(Localization.getTranslation(policy
                      .value
                      .purposeList![selectedPurposeIndex]
                      .dataList![index]
                      .head)),
                ),
                for (int i = 0;
                    i <
                        policy.value.purposeList![selectedPurposeIndex]
                            .dataList![index].dataCategoryList!.length;
                    i++)
                  Padding(
                    padding: const EdgeInsets.only(left: 4, right: 4),
                    child: Tooltip(
                      message: Localization.getTranslation(policy
                          .value
                          .purposeList![selectedPurposeIndex]
                          .dataList![index]
                          .dataCategoryList![i]
                          .head),
                      preferBelow: false,
                      child: VectorGraphic(
                        loader: AssetBytesLoader(
                            "assets/DaPIS/data_categories/${policy.value.purposeList![selectedPurposeIndex].dataList![index].dataCategoryList![i].name}.svg"),
                        semanticsLabel: policy
                            .value
                            .purposeList![selectedPurposeIndex]
                            .dataList![index]
                            .dataCategoryList![i]
                            .name,
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ),
                if (policy.value.purposeList![selectedPurposeIndex]
                    .dataList![index].error.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Tooltip(
                      message: policy.value.purposeList![selectedPurposeIndex]
                          .dataList![index].error
                          .map((error) =>
                              AppLocalizations.of(context)!.errors(error))
                          .toList()
                          .join(" "),
                      preferBelow: false,
                      child: const VectorGraphic(
                        loader: AssetBytesLoader("assetsmaterial/warning.svg"),
                        semanticsLabel: "warning",
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ),
                const Spacer(),
                if (policy.value.purposeList![selectedPurposeIndex]
                    .dataList![index].anonymizationMethod!.name!.isNotEmpty)
                  Tooltip(
                    message: AppLocalizations.of(context)!.data_anonymized,
                    preferBelow: false,
                    child: const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: VectorGraphic(
                        loader: AssetBytesLoader(
                            "assets/DaPIS/purpose_details/anonymization.svg"),
                        semanticsLabel: "Anonymization",
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ),
                Tooltip(
                  message: AppLocalizations.of(context)!.privacy_groups(policy
                          .value
                          .purposeList![selectedPurposeIndex]
                          .dataList![index]
                          .privacyGroup ??
                      ""),
                  preferBelow: false,
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: (policy.value.purposeList![selectedPurposeIndex]
                                    .dataList![index].required ??
                                false)
                            ? 10
                            : 50),
                    child: VectorGraphic(
                      loader: AssetBytesLoader(
                          "assets/DaPIS/data_sensitivity/${policy.value.purposeList![selectedPurposeIndex].dataList![index].privacyGroup}.svg"),
                      semanticsLabel: policy
                          .value
                          .purposeList![selectedPurposeIndex]
                          .dataList![index]
                          .privacyGroup,
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
                if (policy.value.purposeList![selectedPurposeIndex]
                        .dataList![index].required ??
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
                      .dataList![index].pointOfAcceptance !=
                  "",
              onChanged: (value) => value!
                  ? _acceptData(
                      selectedPurposeCategoryIndex, selectedPurposeIndex)
                  : _declineData(
                      selectedPurposeCategoryIndex, selectedPurposeIndex),
              activeColor: Colors.green.shade700,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              overlayColor: null,
            ),
            childrenPadding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 8),
            maintainState: true,
            initiallyExpanded: policy.value.purposeList![selectedPurposeIndex]
                .dataList![index].expanded,
            onExpansionChanged: (value) => policy
                .value
                .purposeList![selectedPurposeIndex]
                .dataList![index]
                .expanded = value,
            shape: const Border(),
            children: [
              Row(
                children: [
                  Tooltip(
                    message: AppLocalizations.of(context)!.data_description,
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
              Text(Localization.getTranslation(policy.value
                  .purposeList![selectedPurposeIndex].dataList![index].desc)),
            ],
          ),
        ));
  }
}
