import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pripocog_privacy_policy_interface/components/policy_storage.dart';
import 'package:pripocog_privacy_policy_interface/l10n/app_localizations.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/compliant.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/policy.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/purpose_category_state.dart';
import 'package:pripocog_privacy_policy_interface/widgets/purpose_card.dart';
import 'package:vector_graphics/vector_graphics.dart';

class PurposeCategoryCard extends StatefulWidget {
  final int index;
  final ExpansionTileController controller = ExpansionTileController();

  PurposeCategoryCard({
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
  State<PurposeCategoryCard> createState() => _PurposeCategoryCardState();
}

class _PurposeCategoryCardState extends State<PurposeCategoryCard> {
  Future<void> _acceptPurposeCategory() async {
    final Rx<Policy> policy = Get.find();
    policy.value.purposeCategories[widget.index].accept(widget.index);
    await PolicyStorage.checkPolicy();
  }

  Future<void> _declinePurposeCategory() async {
    final Rx<Policy> policy = Get.find();
    policy.value.purposeCategories[widget.index].decline(widget.index);
    await PolicyStorage.checkPolicy();
  }

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
              if (policy.value.purposeCategories[widget.index].error.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Tooltip(
                    message: policy.value.purposeCategories[widget.index].error
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
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Obx(() => Text(
                    "(${policy.value.purposeCategories[widget.index].numberOfAcceptedPurposes}/${policy.value.purposeCategories[widget.index].subPurposeIndices.length})")),
              ),
              Switch(
                activeTrackColor:
                    policy.value.purposeCategories[widget.index].state ==
                            PurposeCategoryState.acceptAll
                        ? Colors.green.shade700
                        : Colors.orange,
                hoverColor: Colors.transparent,
                activeColor: Colors.transparent,
                focusColor: Colors.transparent,
                overlayColor: null,
                value: policy.value.purposeCategories[widget.index].state ==
                        PurposeCategoryState.acceptAll ||
                    policy.value.purposeCategories[widget.index].state ==
                        PurposeCategoryState.acceptSome,
                onChanged: (value) => value
                    ? _acceptPurposeCategory()
                    : _declinePurposeCategory(),
              ),
              Obx(() {
                if (policy.value.purposeCategories[widget.index].compliant ==
                    Compliant.compliant) {
                  return const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.check_circle_rounded,
                      color: Colors.green,
                      size: 35,
                    ),
                  );
                }
                if (policy.value.purposeCategories[widget.index].compliant ==
                    Compliant.notCompliant) {
                  return const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.cancel_rounded,
                      color: Colors.red,
                      size: 35,
                    ),
                  );
                }
                if (policy.value.purposeCategories[widget.index].compliant ==
                    Compliant.processing) {
                  return const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.hourglass_top,
                      color: Colors.black54,
                      size: 35,
                    ),
                  );
                }
                return Container();
              }),
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
              PurposeCard(
                  index: policy.value.purposeCategories[widget.index]
                      .subPurposeIndices[i],
                  categoryIndex: widget.index),
          ],
        ));
  }
}
