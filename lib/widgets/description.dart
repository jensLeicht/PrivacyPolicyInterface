import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pripocog_privacy_policy_interface/components/localization.dart';
import 'package:pripocog_privacy_policy_interface/l10n/app_localizations.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/policy.dart';
import 'package:vector_graphics/vector_graphics.dart';

class Description extends StatefulWidget {
  const Description({super.key});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    final Rx<Policy> policy = Get.find();
    return Card(
      child: ExpansionTile(
        leading: Tooltip(
          message: AppLocalizations.of(context)!.policy_edit_description_title,
          preferBelow: false,
          child: const VectorGraphic(
            loader: AssetBytesLoader("assets/material/info.svg"),
            semanticsLabel: "Description",
            height: 30,
            width: 30,
          ),
        ),
        title: Text(
          AppLocalizations.of(context)!.policy_edit_description_title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        childrenPadding: const EdgeInsets.all(20),
        shape: const Border(),
        initiallyExpanded: true,
        maintainState: true,
        children: [
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
                  Text(Localization.getTranslation(policy.value.desc)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
