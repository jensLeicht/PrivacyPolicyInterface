import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pripocog_privacy_policy_interface/components/localization.dart';
import 'package:pripocog_privacy_policy_interface/components/policy_storage.dart';
import 'package:pripocog_privacy_policy_interface/l10n/app_localizations.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/policy.dart';
import 'package:pripocog_privacy_policy_interface/widgets/checkout_bar.dart';
import 'package:pripocog_privacy_policy_interface/widgets/description.dart';
import 'package:pripocog_privacy_policy_interface/widgets/general_information.dart';
import 'package:pripocog_privacy_policy_interface/widgets/purpose_details_card_checkout.dart';
import 'package:pripocog_privacy_policy_interface/widgets/purposes_checkout.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vector_graphics/vector_graphics.dart';

class PolicyCheckout extends StatefulWidget {
  const PolicyCheckout({super.key});

  @override
  State<PolicyCheckout> createState() => _PolicyCheckoutState();
}

class _PolicyCheckoutState extends State<PolicyCheckout> {
  String _localLanguage = Localization.fallbackLanguage;

  List<PurposeDetailsCardCheckout> purposeCategories = [];

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

  void _openHomepage() async {
    final Uri uri = Uri.parse(PolicyStorage.config.homepageUrl ?? "");
    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    final Rx<Policy> policy = Get.find();
    purposeCategories = [];
    var mobile = MediaQuery.of(context).size.width < 1200;
    for (int i = 0; i < policy.value.purposeList!.length; i++) {
      if (policy.value.purposeList![i].pointOfAcceptance != "") {
        purposeCategories.add(PurposeDetailsCardCheckout(index: i));
      }
    }
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
          const Icon(Icons.translate),
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
                  const SingleChildScrollView(
                    child: Column(
                      children: [
                        PurposesCheckout(),
                        Description(),
                        GeneralInformation(),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Tooltip(
                              message: AppLocalizations.of(context)!
                                  .policy_checkout_purpose_details,
                              preferBelow: false,
                              child: const VectorGraphic(
                                loader: AssetBytesLoader(
                                    "assets/DaPIS/processing_purposes/processing_purposes.svg"),
                                semanticsLabel: "Processing Purposes",
                                height: 40,
                                width: 40,
                              ),
                            ),
                            Text(
                              AppLocalizations.of(context)!
                                  .policy_checkout_purpose_details,
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
                                  loader: AssetBytesLoader(
                                      "assets/material/expand_all.svg"),
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
                              message:
                                  AppLocalizations.of(context)!.collapse_all,
                              preferBelow: false,
                              child: IconButton(
                                icon: const VectorGraphic(
                                  loader: AssetBytesLoader(
                                      "assets/material/collapse_all.svg"),
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
                      SingleChildScrollView(
                          child: Column(
                        children: [
                          for (int i = 0; i < purposeCategories.length; i++)
                            purposeCategories[i]
                        ],
                      )),
                    ],
                  ),
                ],
              ),
            ),
          if (!mobile)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        PurposesCheckout(),
                        Description(),
                        GeneralInformation(),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Tooltip(
                              message: AppLocalizations.of(context)!
                                  .policy_checkout_purpose_details,
                              preferBelow: false,
                              child: const VectorGraphic(
                                loader: AssetBytesLoader(
                                    "assets/DaPIS/processing_purposes/processing_purposes.svg"),
                                semanticsLabel: "Processing Purposes",
                                height: 40,
                                width: 40,
                              ),
                            ),
                            Text(
                              AppLocalizations.of(context)!
                                  .policy_checkout_purpose_details,
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
                                  loader: AssetBytesLoader(
                                      "assets/material/expand_all.svg"),
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
                              message:
                                  AppLocalizations.of(context)!.collapse_all,
                              preferBelow: false,
                              child: IconButton(
                                icon: const VectorGraphic(
                                  loader: AssetBytesLoader(
                                      "assets/material/collapse_all.svg"),
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
                      Expanded(
                        child: SingleChildScrollView(
                            child: Column(
                          children: [
                            for (int i = 0; i < purposeCategories.length; i++)
                              purposeCategories[i]
                          ],
                        )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
      bottomNavigationBar: const CheckoutBar(),
    );
  }
}
