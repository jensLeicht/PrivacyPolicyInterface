import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pripocog_privacy_policy_interface/components/localization.dart';
import 'package:pripocog_privacy_policy_interface/l10n/app_localizations.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/policy.dart';
import 'package:vector_graphics/vector_graphics.dart';

class PurposeCardCheckout extends StatefulWidget {
  final int index;
  final int categoryIndex;
  final int superPurpose;

  const PurposeCardCheckout(
      {super.key,
      required this.index,
      required this.categoryIndex,
      this.superPurpose = -1});

  @override
  State<PurposeCardCheckout> createState() => _PurposeCardCheckoutState();
}

class _PurposeCardCheckoutState extends State<PurposeCardCheckout> {
  @override
  Widget build(BuildContext context) {
    final Rx<Policy> policy = Get.find();
    return Obx(() => Card(
          color: Colors.white,
          child: ListTile(
            title: Row(
              children: [
                Text(Localization.getTranslation(
                    policy.value.purposeList![widget.index].head)),
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
              ],
            ),
            trailing: const Icon(Icons.chevron_right_outlined),
            shape: const Border(),
          ),
        ));
  }
}
