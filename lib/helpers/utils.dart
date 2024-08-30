import 'package:flutter/material.dart';

import 'application_localization.dart';

// class Utils {

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

bool get isRTL {
  return Localizations.localeOf(navigatorKey.currentContext!).toString() ==
      "ar";
}

bool get isInLandscape {
  return MediaQuery.of(navigatorKey.currentContext!).orientation ==
      Orientation.landscape;
}

extension AppTranslator on String {
  String get tr {
    return navigatorKey.currentContext != null
        ? AppLocalizations.of(navigatorKey.currentContext!)!.translate(this)
        : '';
  }
}

String get currentLanguageCode {
  return Localizations.localeOf(navigatorKey.currentContext!).toString();
}

bool isDarkMode(BuildContext context) {
  var brightness = MediaQuery.of(context).platformBrightness;
  bool isDarkMode = brightness == Brightness.dark;
  return isDarkMode;
}

void clearFocus(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

bool validateEmail(String value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  return regex.hasMatch(value);
}

Future<bool> showAlertDialog(BuildContext context,
    {required Function() onActionClicked, String title = ''}) async {
  return (await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Theme.of(context).cardColor,
          content: Text(
            AppLocalizations.of(context)!
                .translate(title.isNotEmpty ? title : "confirmation_message"),
            style: Theme.of(context).primaryTextTheme.displayLarge,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                AppLocalizations.of(context)!.translate("no"),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            TextButton(
              onPressed: () {
                onActionClicked();
                Navigator.of(context).pop();
              },
              child: Text(
                AppLocalizations.of(context)!.translate("yes"),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      )) ??
      false;
}

Future<bool> noAppUpdatesAlertDialog(BuildContext context) async {
  return (await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Theme.of(context).cardColor,
          content: Text(
            AppLocalizations.of(context)!.translate("no_updates_found"),
            style: Theme.of(context).textTheme.displayMedium,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                AppLocalizations.of(context)!.translate("cancel"),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      )) ??
      false;
}

void openScreen(BuildContext context, Widget screen) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
}

void pushScreen(BuildContext context, Widget screen) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => screen), (route) => false);
}

extension Ex on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}
