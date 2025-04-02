import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pripocog_privacy_policy_interface/components/localization.dart';
import 'package:pripocog_privacy_policy_interface/components/policy_storage.dart';
import 'package:pripocog_privacy_policy_interface/l10n/app_localizations.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/policy.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/purpose_state.dart';
import 'package:vector_graphics/vector_graphics.dart';

class PurposeCard extends StatefulWidget {
  final int index;
  final int categoryIndex;
  final int superPurpose;

  const PurposeCard(
      {super.key,
      required this.index,
      required this.categoryIndex,
      this.superPurpose = -1});

  @override
  State<PurposeCard> createState() => _PurposeCardState();
}

class _PurposeCardState extends State<PurposeCard> {
  Future<void> _acceptPurpose() async {
    final Rx<Policy> policy = Get.find();
    policy.value.purposeList![widget.index]
        .accept(widget.categoryIndex, widget.superPurpose);
    await PolicyStorage.checkPolicy();
  }

  Future<void> _declinePurpose() async {
    final Rx<Policy> policy = Get.find();
    policy.value.purposeList![widget.index]
        .decline(widget.categoryIndex, widget.superPurpose);
    await PolicyStorage.checkPolicy();
  }

  @override
  Widget build(BuildContext context) {
    final Rx<Policy> policy = Get.find();
    return Obx(() => Card(
          color: Colors.white,
          shape: policy.value.purposeList![widget.index].error.isNotEmpty
              ? RoundedRectangleBorder(
                  side: const BorderSide(
                      color: Colors.red,
                      width: 3,
                      strokeAlign: BorderSide.strokeAlignInside),
                  borderRadius: BorderRadius.circular(12))
              : null,
          child: ListTile(
            title: Row(
              children: [
                Text(Localization.getTranslation(
                    policy.value.purposeList![widget.index].head)),
                if (policy.value.purposeList![widget.index].error.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Tooltip(
                      message: policy.value.purposeList![widget.index].error
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
                        height: 30,
                        width: 30,
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
                Switch(
                  activeTrackColor:
                      policy.value.purposeList![widget.index].state ==
                              PurposeState.accept
                          ? Colors.green.shade700
                          : Colors.orange,
                  value: policy
                          .value.purposeList![widget.index].pointOfAcceptance !=
                      "",
                  hoverColor: Colors.transparent,
                  activeColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  overlayColor: null,
                  onChanged: (value) =>
                      value ? _acceptPurpose() : _declinePurpose(),
                ),
              ],
            ),
            trailing: const Icon(Icons.chevron_right_outlined),
            shape: const Border(),
            onTap: () {
              policy.value.selectedPurposeCategoryIndex = widget.categoryIndex;
              policy.value.selectedPurposeIndex = widget.index;
              policy.value.superPurpose = widget.superPurpose;
              policy.refresh();
            },
          ),
        ));
  }
}
