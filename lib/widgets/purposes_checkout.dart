import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pripocog_privacy_policy_interface/l10n/app_localizations.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/policy.dart';
import 'package:pripocog_privacy_policy_interface/widgets/purpose_category_card_checkout.dart';
import 'package:vector_graphics/vector_graphics.dart';

class PurposesCheckout extends StatefulWidget {
  const PurposesCheckout({super.key});

  @override
  State<PurposesCheckout> createState() => _PurposesCheckoutState();
}

class _PurposesCheckoutState extends State<PurposesCheckout> {
  List<PurposeCategoryCardCheckout> purposeCategories = [];

  Future<void> _expandAll() async {
    for (int i = 0; i < purposeCategories.length; i++) {
      purposeCategories[i].expand();
    }
  }

  Future<void> _collapseAll() async {
    for (int i = 0; i < purposeCategories.length; i++) {
      purposeCategories[i].collapse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Rx<Policy> policy = Get.find();
    purposeCategories = [];
    for (int i = 0; i < policy.value.purposeCategories.length; i++) {
      if (policy.value.purposeCategories[i].numberOfAcceptedPurposes > 0) {
        purposeCategories.add(PurposeCategoryCardCheckout(index: i));
      }
    }
    return Card(
        child: Column(
      children: [
        ListTile(
          leading: Tooltip(
            message: AppLocalizations.of(context)!.policy_edit_purposes_title,
            preferBelow: false,
            child: const VectorGraphic(
              loader: AssetBytesLoader("assets/DaPIS/processing_purposes/processing_purposes.svg"),
              semanticsLabel: "Processing Purposes",
              height: 40,
              width: 40,
            ),
          ),
          title: Row(
            children: [
              Text(
                AppLocalizations.of(context)!.policy_edit_purposes_title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Tooltip(
                message: AppLocalizations.of(context)!.expand_all,
                preferBelow: false,
                child: IconButton(
                  icon: const VectorGraphic(
                    loader: AssetBytesLoader("assets/material/expand_all.svg"),
                    semanticsLabel: "Expand All",
                    height: 20,
                    width: 20,
                  ),
                  onPressed: () {
                    _expandAll();
                  },
                ),
              ),
              Tooltip(
                message: AppLocalizations.of(context)!.collapse_all,
                preferBelow: false,
                child: IconButton(
                  icon: const VectorGraphic(
                    loader:
                        AssetBytesLoader("assets/material/collapse_all.svg"),
                    semanticsLabel: "Collapse All",
                    height: 20,
                    width: 20,
                  ),
                  onPressed: () {
                    _collapseAll();
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              for (int i = 0; i < purposeCategories.length; i++)
                purposeCategories[i]
            ],
          ),
        ),
      ],
    ));
  }
}
