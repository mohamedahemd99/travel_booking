import 'dart:io' show Platform;

import 'preferences/pref_manager.dart';

class Constants {
  static const String appName = "ReLive";

  static const String appAndroidLink = "";
  static const String appIOSLink = "";

  //Testing
  static const String googleAPIKey = "";

  //Production
  // static const String googleAPIKey = "";

  static const int currentDBVersion = 1;

  static String appLink = Platform.isAndroid ? appAndroidLink : appIOSLink;
  static int updateAppHours = PrefManager.isAppNeedUpdate() ? 1 : 12;
}
