import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/repositories/flight_repository.dart';
import 'app_language_provider.dart';
import 'flight_provider.dart';

class AppMainProvider extends StatelessWidget {
  const AppMainProvider(
      {super.key, this.child, required this.flightRepository});

  final FlightRepository flightRepository;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppLanguageProvider>(
          create: (_) => AppLanguageProvider()..fetchLocale(),
        ),
        ChangeNotifierProvider<FlightProvider>(
            create: (_) => FlightProvider(flightRepository)),
      ],
      child: child!,
    );
  }
}
