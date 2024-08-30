import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travel_booking/presentaion/provider/app_language_provider.dart';
import 'package:travel_booking/presentaion/provider/app_main_providers.dart';

import 'domain/repositories/flight_repository.dart';
import 'helpers/application_localization.dart';
import 'helpers/constants.dart';
import 'helpers/utils.dart';
import 'injection.dart';
import 'presentaion/screens/home_view.dart';

void main() {
  configureDependencies();
  final flightRepository = getIt<FlightRepository>();
  runApp(MyApp(flightRepository: flightRepository));
}

class MyApp extends StatelessWidget {
  final FlightRepository flightRepository;

  const MyApp({super.key, required this.flightRepository});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.grey,
      statusBarIconBrightness: Brightness.dark,
    ));
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => AppMainProvider(
        flightRepository: flightRepository,
        child: Consumer<AppLanguageProvider>(builder: (context, model, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              navigatorKey: navigatorKey,
              supportedLocales: const [
                Locale('en', 'US'),
                Locale('ar', ''),
              ],
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              locale: model.appLocal,
              title: Constants.appName,
              builder: EasyLoading.init(
                builder: (context, child) => Scaffold(
                  body: GestureDetector(
                    onTap: () => clearFocus(context),
                    child: child,
                  ),
                ),
              ),
              home: HomeView());
        }),
      ),
    );
  }
}
