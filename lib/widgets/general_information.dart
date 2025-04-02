import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pripocog_privacy_policy_interface/l10n/app_localizations.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/policy.dart';
import 'package:pripocog_privacy_policy_interface/widgets/data_controller_card.dart';
import 'package:pripocog_privacy_policy_interface/widgets/data_protection_officer_card.dart';
import 'package:pripocog_privacy_policy_interface/widgets/data_subject_right_card.dart';
import 'package:pripocog_privacy_policy_interface/widgets/supervisory_authority_card.dart';
import 'package:vector_graphics/vector_graphics.dart';

class GeneralInformation extends StatefulWidget {
  const GeneralInformation({super.key});

  @override
  State<GeneralInformation> createState() => _GeneralInformationState();
}

class _GeneralInformationState extends State<GeneralInformation> {
  @override
  Widget build(BuildContext context) {
    final Rx<Policy> policy = Get.find();
    return Card(
      child: ExpansionTile(
        leading: Tooltip(
          message: AppLocalizations.of(context)!
              .policy_edit_general_information_title,
          preferBelow: false,
          child: const VectorGraphic(
            loader: AssetBytesLoader("assets/svg/general_information.svg"),
            semanticsLabel: "General Information",
            height: 30,
            width: 30,
          ),
        ),
        title: Text(
          AppLocalizations.of(context)!.policy_edit_general_information_title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: const Border(),
        childrenPadding: const EdgeInsets.all(20),
        initiallyExpanded: false,
        maintainState: true,
        children: [
          Text(
            "${AppLocalizations.of(context)!.policy_edit_general_information_data_controllers_title}:",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          for (int i = 0; i < policy.value.controllerList!.length; i++)
            DataControllerCard(index: i),
          Text(
            "${AppLocalizations.of(context)!.policy_edit_general_information_data_protection_officers_title}:",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          for (int i = 0;
              i < policy.value.dataProtectionOfficerList!.length;
              i++)
            DataProtectionOfficerCard(index: i),
          Text(
            "${AppLocalizations.of(context)!.policy_edit_general_information_data_subject_rights_title}:",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          for (int i = 0; i < policy.value.dataSubjectRightList!.length; i++)
            DataSubjectRightCard(index: i),
          Text(
            "${AppLocalizations.of(context)!.policy_edit_general_information_supervisory_authority_title}:",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          if (policy.value.lodgeComplaint != null)
            const SupervisoryAuthorityCard(),
        ],
      ),
    );
  }
}
