import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pripocog_privacy_policy_interface/components/localization.dart';
import 'package:pripocog_privacy_policy_interface/l10n/app_localizations.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/policy.dart';
import 'package:vector_graphics/vector_graphics.dart';

class DataControllerCard extends StatelessWidget {
  final int index;

  const DataControllerCard({
    super.key,
    required this.index,
  });

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
                  .policy_edit_general_information_data_controller,
              preferBelow: false,
              child: const VectorGraphic(
                loader: AssetBytesLoader("assets/DaPIS/roles/DataController.svg"),
                semanticsLabel: "Data Controller",
                height: 40,
                width: 40,
              ),
            ),
            Text(
                "${policy.value.controllerList![index].firstName} ${policy.value.controllerList![index].lastName}"),
            Text(policy.value.controllerList![index].email!),
            Text(policy.value.controllerList![index].phoneNumber!),
            Text(policy.value.controllerList![index].address!),
            Text(Localization.getTranslation(
                policy.value.controllerList![index].desc)),
          ],
        ),
      ),
    );
  }
}
