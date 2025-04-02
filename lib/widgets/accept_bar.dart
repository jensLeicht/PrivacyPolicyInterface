import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pripocog_privacy_policy_interface/components/policy_storage.dart';
import 'package:pripocog_privacy_policy_interface/l10n/app_localizations.dart';
import 'package:pripocog_privacy_policy_interface/main.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/compliant.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/policy.dart';
import 'package:url_launcher/url_launcher.dart';

class AcceptBar extends StatefulWidget {
  const AcceptBar({super.key});

  @override
  State<AcceptBar> createState() => _AcceptBarState();
}

class _AcceptBarState extends State<AcceptBar> {
  void _openFullTextPolicy() async {
    final Uri uri = Uri.parse(PolicyStorage.config.fullTextPolicyUrl ?? "");
    await launchUrl(uri);
  }

  void _toCheckOutRoute() {
    final Rx<Policy> policy = Get.find();
    policy.value.selectedPurposeCategoryIndex = -1;
    policy.value.selectedPurposeIndex = -1;
    policy.refresh();
    MainApp.navigatorKey.currentState!.pushNamed("PolicyCheckout");
  }

  @override
  Widget build(BuildContext context) {
    final Rx<Policy> policy = Get.find();
    var mobile = MediaQuery.of(context).size.width < 780;
    return Obx(() => BottomAppBar(
          height: mobile ? 130 : 80,
          child: Row(children: [
            if (policy.value.compliant == Compliant.compliant)
              const Tooltip(
                message: "Compliant Policy",
                preferBelow: false,
                child: Icon(
                  Icons.check_circle_rounded,
                  color: Colors.green,
                  size: 50,
                ),
              ),
            if (policy.value.compliant == Compliant.notCompliant)
              const Tooltip(
                message: "Compliance Issue Detected",
                preferBelow: false,
                child: Icon(
                  Icons.cancel_rounded,
                  color: Colors.red,
                  size: 50,
                ),
              ),
            if (policy.value.compliant == Compliant.processing)
              const Tooltip(
                message: "Checking Compliance ...",
                preferBelow: false,
                child: Icon(
                  Icons.hourglass_top_outlined,
                  color: Colors.black54,
                  size: 50,
                ),
              ),
            if (mobile)
              Flexible(
                child: Wrap(
                  runSpacing: 10,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                      ),
                    ),
                    OutlinedButton(
                        onPressed: () {
                          policy.value.selectNone();
                          PolicyStorage.checkPolicy();
                          policy.refresh();
                        },
                        child: Text(AppLocalizations.of(context)!
                            .policy_edit_accept_bar_select_none)),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: OutlinedButton(
                          onPressed: () {
                            policy.value.selectNone();
                            policy.value.selectRequired();
                            PolicyStorage.checkPolicy();
                            policy.refresh();
                          },
                          child: Text(AppLocalizations.of(context)!
                              .policy_edit_accept_bar_select_required)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: OutlinedButton(
                          onPressed: () {
                            policy.value.selectAll();
                            PolicyStorage.checkPolicy();
                            policy.refresh();
                          },
                          child: Text(AppLocalizations.of(context)!
                              .policy_edit_accept_bar_select_all)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: FilledButton(
                          onPressed:
                              policy.value.compliant == Compliant.compliant
                                  ? _toCheckOutRoute
                                  : null,
                          child: Text(AppLocalizations.of(context)!
                              .policy_edit_accept_bar_next)),
                    ),
                    TextButton.icon(
                      onPressed: PolicyStorage.config.fullTextPolicyUrl != null
                          ? _openFullTextPolicy
                          : null,
                      icon: const Icon(Icons.open_in_new_outlined),
                      label: Text(AppLocalizations.of(context)!
                          .policy_edit_accept_bar_full_text_policy),
                    ),
                  ],
                ),
              ),
            if (!mobile)
              Flexible(
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                      ),
                    ),
                    OutlinedButton(
                        onPressed: () {
                          policy.value.selectNone();
                          PolicyStorage.checkPolicy();
                          policy.refresh();
                        },
                        child: Text(AppLocalizations.of(context)!
                            .policy_edit_accept_bar_select_none)),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: OutlinedButton(
                          onPressed: () {
                            policy.value.selectNone();
                            policy.value.selectRequired();
                            PolicyStorage.checkPolicy();
                            policy.refresh();
                          },
                          child: Text(AppLocalizations.of(context)!
                              .policy_edit_accept_bar_select_required)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: OutlinedButton(
                          onPressed: () {
                            policy.value.selectAll();
                            PolicyStorage.checkPolicy();
                            policy.refresh();
                          },
                          child: Text(AppLocalizations.of(context)!
                              .policy_edit_accept_bar_select_all)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: FilledButton(
                          onPressed:
                              policy.value.compliant == Compliant.compliant
                                  ? _toCheckOutRoute
                                  : null,
                          child: Text(AppLocalizations.of(context)!
                              .policy_edit_accept_bar_next)),
                    ),
                    const Spacer(),
                    TextButton.icon(
                      onPressed: PolicyStorage.config.fullTextPolicyUrl != null
                          ? _openFullTextPolicy
                          : null,
                      icon: const Icon(Icons.open_in_new_outlined),
                      label: Text(AppLocalizations.of(context)!
                          .policy_edit_accept_bar_full_text_policy),
                    ),
                  ],
                ),
              ),
          ]),
        ));
  }
}
