import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pripocog_privacy_policy_interface/components/localization.dart';
import 'package:pripocog_privacy_policy_interface/l10n/app_localizations.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/policy.dart';
import 'package:vector_graphics/vector_graphics.dart';

class SupervisoryAuthorityCard extends StatelessWidget {
  const SupervisoryAuthorityCard({super.key});

  @override
  Widget build(BuildContext context) {
    final Rx<Policy> policy = Get.find();
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Divider(
              color: Colors.transparent,
              height: 0,
            ),
            Tooltip(
              message: AppLocalizations.of(context)!
                  .policy_edit_general_information_supervisory_authority_title,
              preferBelow: false,
              child: const VectorGraphic(
                loader: AssetBytesLoader(
                    "assets/DaPIS/roles/DataProtectionAuthority.svg"),
                semanticsLabel: "Data Protection Authority",
                height: 40,
                width: 40,
              ),
            ),
            Text(
                Localization.getTranslation(policy.value.lodgeComplaint!.head)),
            Text(
                Localization.getTranslation(policy.value.lodgeComplaint!.desc)),
          ],
        ),
      ),
    );
  }
}
