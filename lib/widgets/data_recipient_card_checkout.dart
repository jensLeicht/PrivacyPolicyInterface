import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pripocog_privacy_policy_interface/components/localization.dart';
import 'package:pripocog_privacy_policy_interface/l10n/app_localizations.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/policy.dart';
import 'package:vector_graphics/vector_graphics.dart';
class DataRecipientCardCheckout extends StatelessWidget {
  final int index;
  final int superPurpose;

  const DataRecipientCardCheckout({
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
                Text(Localization.getTranslation(policy
                    .value
                    .purposeList![superPurpose]
                    .dataRecipientList![index]
                    .head)),
// Country
                if (policy.value.purposeList![superPurpose]
                    .dataRecipientList![index].country!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Tooltip(
                      message: AppLocalizations.of(context)!.countries(policy
                          .value
                          .purposeList![superPurpose]
                          .dataRecipientList![index]
                          .country!
                          .replaceAll("*", "_")),
                      preferBelow: false,
                      child: VectorGraphic(
                        loader: AssetBytesLoader(
                            "assets/flags/${policy.value.purposeList![superPurpose].dataRecipientList![index].country!.toLowerCase().replaceAll("*", "_")}.svg"),
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
                            .purposeList![superPurpose]
                            .dataRecipientList![index]
                            .classification
                            ?.replaceAll(" ", "") ??
                        ""),
                    preferBelow: false,
                    child: VectorGraphic(
                      loader: AssetBytesLoader(
                          "assets/DaPIS/entity_types/${policy.value.purposeList![superPurpose].dataRecipientList![index].classification?.replaceAll(" ", "")}.svg"),
                      semanticsLabel: AppLocalizations.of(context)!
                          .entity_types(policy.value.purposeList![superPurpose]
                                  .dataRecipientList![index].classification
                                  ?.replaceAll(" ", "") ??
                              ""),
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
                const Spacer(),
                if (policy.value.purposeList![superPurpose]
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
// Content
            childrenPadding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 8),
            initiallyExpanded: policy.value.purposeList![superPurpose]
                .dataRecipientList![index].expanded,
            onExpansionChanged: (value) => policy
                .value
                .purposeList![superPurpose]
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
              Text(Localization.getTranslation(policy.value
                  .purposeList![superPurpose].dataRecipientList![index].desc)),
// Safeguards
              if (policy.value.purposeList![superPurpose]
                      .dataRecipientList![index].safeguardList!.isNotEmpty &&
                  policy
                      .value
                      .purposeList![superPurpose]
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
                            policy.value.purposeList![superPurpose]
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
              if (policy.value.purposeList![superPurpose]
                      .dataRecipientList![index].safeguardList!.isNotEmpty &&
                  policy
                      .value
                      .purposeList![superPurpose]
                      .dataRecipientList![index]
                      .safeguardList![0]
                      .head!
                      .isNotEmpty)
                for (int i = 0;
                    i <
                        policy.value.purposeList![superPurpose]
                            .dataRecipientList![index].safeguardList!.length;
                    i++)
                  Column(
                    children: [
                      Text(
                        Localization.getTranslation(policy
                            .value
                            .purposeList![superPurpose]
                            .dataRecipientList![index]
                            .safeguardList![i]
                            .head),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(Localization.getTranslation(policy
                          .value
                          .purposeList![superPurpose]
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
