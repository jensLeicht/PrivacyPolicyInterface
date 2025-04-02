import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pripocog_privacy_policy_interface/components/localization.dart';
import 'package:pripocog_privacy_policy_interface/l10n/app_localizations.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/policy.dart';
import 'package:vector_graphics/vector_graphics.dart';

class DataCardCheckout extends StatelessWidget {
  final int index;
  final int superPurpose;

  const DataCardCheckout({
    super.key,
    required this.index,
    required this.superPurpose,
  });

  @override
  Widget build(BuildContext context) {
    final Rx<Policy> policy = Get.find();
    return Obx(() => Card(
          color: Colors.white,
          child: ExpansionTile(
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(Localization.getTranslation(policy
                      .value.purposeList![superPurpose].dataList![index].head)),
                ),
                for (int i = 0;
                    i <
                        policy.value.purposeList![superPurpose].dataList![index]
                            .dataCategoryList!.length;
                    i++)
                  Padding(
                    padding: const EdgeInsets.only(left: 4, right: 4),
                    child: Tooltip(
                      message: Localization.getTranslation(policy
                          .value
                          .purposeList![superPurpose]
                          .dataList![index]
                          .dataCategoryList![i]
                          .head),
                      preferBelow: false,
                      child: VectorGraphic(
                        loader: AssetBytesLoader(
                            "assets/DaPIS/data_categories/${policy.value.purposeList![superPurpose].dataList![index].dataCategoryList![i].name}.svg"),
                        semanticsLabel: policy.value.purposeList![superPurpose]
                            .dataList![index].dataCategoryList![i].name,
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ),
                const Spacer(),
                if (policy.value.purposeList![superPurpose].dataList![index]
                    .anonymizationMethod!.name!.isNotEmpty)
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
                          .purposeList![superPurpose]
                          .dataList![index]
                          .privacyGroup ??
                      ""),
                  preferBelow: false,
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: (policy.value.purposeList![superPurpose]
                                    .dataList![index].required ??
                                false)
                            ? 10
                            : 50),
                    child: VectorGraphic(
                      loader: AssetBytesLoader(
                          "assets/DaPIS/data_sensitivity/${policy.value.purposeList![superPurpose].dataList![index].privacyGroup}.svg"),
                      semanticsLabel: policy.value.purposeList![superPurpose]
                          .dataList![index].privacyGroup,
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
                if (policy.value.purposeList![superPurpose].dataList![index]
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
              ],
            ),
            childrenPadding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 8),
            maintainState: true,
            initiallyExpanded: policy
                .value.purposeList![superPurpose].dataList![index].expanded,
            onExpansionChanged: (value) => policy.value
                .purposeList![superPurpose].dataList![index].expanded = value,
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
              Text(Localization.getTranslation(policy
                  .value.purposeList![superPurpose].dataList![index].desc)),
            ],
          ),
        ));
  }
}
