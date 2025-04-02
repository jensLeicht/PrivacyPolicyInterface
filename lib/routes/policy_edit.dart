import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pripocog_privacy_policy_interface/components/localization.dart';
import 'package:pripocog_privacy_policy_interface/components/policy_storage.dart';
import 'package:pripocog_privacy_policy_interface/l10n/app_localizations.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/policy.dart';
import 'package:pripocog_privacy_policy_interface/models/server/initial_policy_check_response.dart';
import 'package:pripocog_privacy_policy_interface/widgets/accept_bar.dart';
import 'package:pripocog_privacy_policy_interface/widgets/description.dart';
import 'package:pripocog_privacy_policy_interface/widgets/general_information.dart';
import 'package:pripocog_privacy_policy_interface/widgets/glossary.dart';
import 'package:pripocog_privacy_policy_interface/widgets/help.dart';
import 'package:pripocog_privacy_policy_interface/widgets/privacy_matrix.dart';
import 'package:pripocog_privacy_policy_interface/widgets/purpose_details_card.dart';
import 'package:pripocog_privacy_policy_interface/widgets/purposes.dart';
import 'package:pripocog_privacy_policy_interface/widgets/world_map.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vector_graphics/vector_graphics.dart';

class PolicyEdit extends StatefulWidget {
  final InitialPolicyCheckResponse initialPolicyCheckResponse;

  const PolicyEdit({
    super.key,
    required this.initialPolicyCheckResponse,
  });

  @override
  State<PolicyEdit> createState() => _PolicyEditState();
}

class _PolicyEditState extends State<PolicyEdit> {
  String _localLanguage = Localization.fallbackLanguage;

  void _openHomepage() async {
    final Uri uri = Uri.parse(PolicyStorage.config.homepageUrl ?? "");
    await launchUrl(uri);
  }

  void showGlossary() {
    showDialog(
      context: context,
      builder: (_) {
        return const Dialog(child: Glossary());
      },
    );
  }

  void showHelp() {
    showDialog(
      context: context,
      builder: (_) {
        return const Dialog(child: Help());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Rx<Policy> policy = Get.find();
    var mobile = MediaQuery.of(context).size.width < 1200;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image(
            image: AssetImage("assets/${PolicyStorage.config.logoName}"),
          ),
          onPressed:
              PolicyStorage.config.homepageUrl != null ? _openHomepage : null,
        ),
        title: Text(
            "${Localization.getTranslation(policy.value.head)} (${AppLocalizations.of(context)!.policy_edit_header_version} ${policy.value.version ?? AppLocalizations.of(context)!.policy_edit_header_version_not_provided})"),
        actions: [
          if (widget.initialPolicyCheckResponse.result == "compliant")
            IconButton(
              onPressed: showGlossary,
              icon: Tooltip(
                message: AppLocalizations.of(context)!.glossary,
                preferBelow: false,
                child: const VectorGraphic(
                  loader: AssetBytesLoader("assets/material/dictionary.svg"),
                  semanticsLabel: "glossary",
                  height: 32,
                  width: 32,
                ),
              ),
            ),
          IconButton(
            onPressed: showHelp,
            icon: Tooltip(
              message: AppLocalizations.of(context)!.help,
              preferBelow: false,
              child: const Icon(
                Icons.help_outline,
                size: 28,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(Icons.translate),
          ),
          DropdownButton(
            value: _localLanguage,
            items: [
              for (int i = 0; i < policy.value.head!.length; i++)
                DropdownMenuItem(
                  value: policy.value.head![i].lang,
                  child: Text(
                      "${AppLocalizations.of(context)!.languages(policy.value.head![i].lang!)} ${policy.value.lang == policy.value.head![i].lang ? "(${AppLocalizations.of(context)!.policy_edit_header_language_legally_binding})" : ""}"),
                ),
            ],
            onChanged: (language) {
              Localization.setLocale(
                  context, Locale(language ?? Localization.fallbackLanguage));
              setState(() {
                _localLanguage = language ?? Localization.fallbackLanguage;
              });
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          if (mobile)
            SingleChildScrollView(
              child: Wrap(
                children: [
                  if (widget.initialPolicyCheckResponse.result == "compliant")
                    const SingleChildScrollView(
                      child: Column(
                        children: [
                          Description(),
                          GeneralInformation(),
                          PrivacyMatrix(),
                          WorldMap(),
                        ],
                      ),
                    ),
                  if (widget.initialPolicyCheckResponse.result == "compliant")
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Obx(() {
                            if (policy.value.selectedPurposeIndex == -1) {
                              return const Purposes();
                            } else {
                              return const PurposeDetailsCard();
                            }
                          }),
                        ],
                      ),
                    ),
                  if (widget.initialPolicyCheckResponse.result ==
                      "not compliant")
                    const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          VectorGraphic(
                            loader: AssetBytesLoader(
                                "assets/material/warning.svg"),
                            semanticsLabel: "warning",
                            height: 40,
                            width: 40,
                          ),
                          Text(
                            "not compliant",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (widget.initialPolicyCheckResponse.result ==
                      "Internal Server Error")
                    const Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.refresh,
                              color: Colors.orange,
                              size: 120,
                            ),
                            Text(
                              "Internal Server Error",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          if (!mobile)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.initialPolicyCheckResponse.result == "compliant")
                  const Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Description(),
                          GeneralInformation(),
                          PrivacyMatrix(),
                          WorldMap(),
                        ],
                      ),
                    ),
                  ),
                if (widget.initialPolicyCheckResponse.result == "compliant")
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Obx(() {
                            if (policy.value.selectedPurposeIndex == -1) {
                              return const Purposes();
                            } else {
                              return const PurposeDetailsCard();
                            }
                          }),
                        ],
                      ),
                    ),
                  ),
                if (widget.initialPolicyCheckResponse.result == "not compliant")
                  const Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          VectorGraphic(
                            loader: AssetBytesLoader(
                                "assets/material/warning.svg"),
                            semanticsLabel: "warning",
                            height: 40,
                            width: 40,
                          ),
                          Text(
                            "not compliant",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (widget.initialPolicyCheckResponse.result ==
                    "Internal Server Error")
                  const Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.refresh,
                            color: Colors.orange,
                            size: 120,
                          ),
                          Text(
                            "Internal Server Error",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
        ],
      ),
      bottomNavigationBar:
          widget.initialPolicyCheckResponse.result == "compliant"
              ? const AcceptBar()
              : null,
    );
  }
}
