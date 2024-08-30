import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart' as intl;

class AppLocalizations {
  Locale locale;
  Map<String, String>? _localizedStrings;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  // Static member to have a simple access to the delegate from the MaterialApp
  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  Future<bool> load() async {
    try {
      // Load the language JSON file from the "lang" folder
      String jsonString = await rootBundle
          .loadString('assets/lang/${locale.languageCode}.json');
      Map<String, dynamic> jsonMap = json.decode(jsonString);

      _localizedStrings = jsonMap.map((key, value) {
        return MapEntry(key, value.toString());
      });

      return true;
    } catch (e) {
      print("error is $e");
      return true;
    }
  }

  // This method will be called from every widget which needs a localized text
  String translate(String key) {
    if (_localizedStrings != null && _localizedStrings!.containsKey(key)) {
      return _localizedStrings?[key] ?? "";
    } else {
      return key;
    }
  }

  bool isDirectionRTL(BuildContext context) {
    return intl.Bidi.isRtlLanguage(
        Localizations.localeOf(context).languageCode);
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return ['ar', 'en'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

String tr(BuildContext context, String key) {
  return AppLocalizations.of(context)!.translate(key);
}
