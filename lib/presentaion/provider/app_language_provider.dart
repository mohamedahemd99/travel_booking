import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helpers/preferences/pref_manager.dart';

class AppLanguageProvider extends ChangeNotifier {
  static AppLanguageProvider of(BuildContext context, {bool isListen = true}) {
    return Provider.of<AppLanguageProvider>(context, listen: isListen);
  }

  Locale _appLocale = Locale(Platform.localeName.split("_").first);

  Locale get appLocal => _appLocale;

  bool get isArabic => _appLocale == const Locale('ar');

  fetchLocale() {
    debugPrint("Fetching the current local");
    _appLocale = Locale(PrefManager.getLang());
    // _appLocale = Locale(Platform.localeName.split("_").first);
    return Null;
  }

  void changeLanguage(Locale type) {
    debugPrint("Language changed  to: ${type.languageCode}");
    if (_appLocale == type) {
      return;
    }
    if (type == const Locale("ar")) {
      _appLocale = const Locale("ar");
      PrefManager.setLang('ar');
    } else {
      _appLocale = const Locale("en");
      PrefManager.setLang('en');
    }

    notifyListeners();
  }

  static bool isSysLtl(String sysLng) {
    if (sysLng == 'en') {
      return true;
    }
    return false;
  }

  void toggleAppLanguage(BuildContext context) {
    debugPrint("Start toggling the app language");
    final appLanguage = context.read<AppLanguageProvider>();
    if (appLanguage.appLocal.toString() == 'ar') {
      debugPrint("Should change the app language to ar");
      appLanguage.changeLanguage(const Locale('en'));
      PrefManager.setLang('en');
    } else {
      debugPrint("Should change the app language to en");
      appLanguage.changeLanguage(const Locale('ar'));
      PrefManager.setLang('ar');
    }
  }
}
