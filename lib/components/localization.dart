import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pripocog_privacy_policy_interface/components/policy_storage.dart';
import 'package:pripocog_privacy_policy_interface/main.dart';
import 'package:pripocog_privacy_policy_interface/models/translation.dart';

class Localization {
  static Locale _locale = Locale(fallbackLanguage);
  static String fallbackLanguage = PolicyStorage.policy.value.lang ?? "en";

  static Locale getLocale() {
    return _locale;
  }

  static void setLocale(BuildContext context, Locale newLocale) {
    _locale = newLocale;
    MainApp.setLocale(context, newLocale);
  }

  static String getTranslation(List<Translation>? translations) {
    if (translations == null || translations.isEmpty) {
      return "Tranlation not found!";
    }
    Translation? translation = translations
        .firstWhereOrNull((element) => element.lang == _locale.languageCode);
    if (translation != null) {
      return translation.value!;
    }
    translation = translations
        .firstWhereOrNull((element) => element.lang == fallbackLanguage);
    if (translation != null) {
      return translation.value!;
    }
    return "Tranlation not found!";
  }
}
