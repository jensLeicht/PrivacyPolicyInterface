import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pripocog_privacy_policy_interface/l10n/app_localizations.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/policy.dart';
import 'package:pripocog_privacy_policy_interface/widgets/purpose_card_checkout.dart';
import 'package:vector_graphics/vector_graphics.dart';

class PurposeCategoryCardCheckout extends StatefulWidget {
  final int index;
  final ExpansionTileController controller = ExpansionTileController();

  PurposeCategoryCardCheckout({
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
  State<PurposeCategoryCardCheckout> createState() =>
      _PurposeCategoryCardCheckoutState();
}

class _PurposeCategoryCardCheckoutState
    extends State<PurposeCategoryCardCheckout> {
  @override
  Widget build(BuildContext context) {
    final Rx<Policy> policy = Get.find();
    return Obx(() => ExpansionTile(
          controller: widget.controller,
          leading: Tooltip(
            message: AppLocalizations.of(context)!.policy_edit_purposes(
                policy.value.purposeCategories[widget.index].name),
            preferBelow: false,
            child: VectorGraphic(
              loader: AssetBytesLoader(
                  "assets/DaPIS/purpose_categories/${policy.value.purposeCategories[widget.index].name}.svg"),
              semanticsLabel: policy.value.purposeCategories[widget.index].name,
              height: 40,
              width: 40,
            ),
          ),
          title: Row(
            children: [
              Text(AppLocalizations.of(context)!.policy_edit_purposes(
                  policy.value.purposeCategories[widget.index].name)),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Obx(() => Text(
                    "(${policy.value.purposeCategories[widget.index].numberOfAcceptedPurposes})")),
              ),
            ],
          ),
          shape: const Border(),
          childrenPadding: const EdgeInsets.only(left: 20, right: 20),
          initiallyExpanded:
              policy.value.purposeCategories[widget.index].expanded,
          maintainState: true,
          onExpansionChanged: (value) =>
              policy.value.purposeCategories[widget.index].expanded = value,
          children: [
            for (int i = 0;
                i <
                    policy.value.purposeCategories[widget.index]
                        .subPurposeIndices.length;
                i++)
              if (policy
                      .value
                      .purposeList![policy.value.purposeCategories[widget.index]
                          .subPurposeIndices[i]]
                      .pointOfAcceptance !=
                  "")
                PurposeCardCheckout(
                    index: policy.value.purposeCategories[widget.index]
                        .subPurposeIndices[i],
                    categoryIndex: widget.index),
          ],
        ));
  }
}
