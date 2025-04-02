import 'package:flutter/material.dart';
import 'package:pripocog_privacy_policy_interface/components/localization.dart';
import 'package:pripocog_privacy_policy_interface/components/policy_storage.dart';
import 'package:pripocog_privacy_policy_interface/l10n/app_localizations.dart';
import 'package:pripocog_privacy_policy_interface/models/server/initial_policy_check_response.dart';
import 'package:pripocog_privacy_policy_interface/routes/policy_checkout.dart';
import 'package:pripocog_privacy_policy_interface/routes/policy_edit.dart';
import 'package:pripocog_privacy_policy_interface/themes/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PolicyStorage.loadConfig();
  InitialPolicyCheckResponse initialPolicyCheckResponse =
      await PolicyStorage.loadPolicy();
  MainApp mainApp =
      MainApp(initialPolicyCheckResponse: initialPolicyCheckResponse);
  runApp(mainApp);
}

class MainApp extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  final InitialPolicyCheckResponse initialPolicyCheckResponse;

  const MainApp({
    super.key,
    required this.initialPolicyCheckResponse,
  });

  @override
  State<MainApp> createState() => _MainAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MainAppState? state = context.findAncestorStateOfType<_MainAppState>();
    state?.setLocale(newLocale);
  }
}

class _MainAppState extends State<MainApp> {
  Locale _locale = Locale(Localization.fallbackLanguage);

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "PolicyEdit",
      locale: _locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      navigatorKey: MainApp.navigatorKey,
      routes: {
        "PolicyEdit": (context) => PolicyEdit(
            initialPolicyCheckResponse: widget.initialPolicyCheckResponse),
        "PolicyCheckout": (context) => const PolicyCheckout(),
      },
      supportedLocales: AppLocalizations.supportedLocales,
      theme: lightTheme,
    );
  }
}
