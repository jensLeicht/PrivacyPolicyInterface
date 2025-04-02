import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pripocog_privacy_policy_interface/l10n/app_localizations.dart';
import 'package:pripocog_privacy_policy_interface/main.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/policy.dart';

class CheckoutBar extends StatefulWidget {
  const CheckoutBar({super.key});

  @override
  State<CheckoutBar> createState() => _CheckoutBarState();
}

class _CheckoutBarState extends State<CheckoutBar> {
  void _backRoute() {
    final Rx<Policy> policy = Get.find();
    policy.value.selectedPurposeCategoryIndex = -1;
    policy.value.selectedPurposeIndex = -1;
    policy.refresh();
    MainApp.navigatorKey.currentState!.pop();
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        children: [
          OutlinedButton(
              onPressed: () => _backRoute(),
              child: Text(
                  AppLocalizations.of(context)!.policy_edit_checkout_bar_back)),
        ],
      ),
    );
  }
}
