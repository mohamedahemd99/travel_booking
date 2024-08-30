import 'package:flutter/material.dart';

import '../../domain/repositories/flight_repository.dart';

class FlightProvider extends ChangeNotifier {
  final FlightRepository flightRepository;

  bool loading = false;

  FlightProvider(this.flightRepository);

  Future<void> searchFlights({
    required String departureId,
    required String arrivalId,
    required String outboundDate,
    required String returnDate,
  }) async {
    loading = true;

    notifyListeners();

    try {
      final flight = await flightRepository.searchFlights(
          departureId: departureId,
          arrivalId: arrivalId,
          outboundDate: outboundDate,
          returnDate: returnDate);
      print(flight);
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
