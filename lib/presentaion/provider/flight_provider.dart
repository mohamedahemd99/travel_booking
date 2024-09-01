import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

import '../../data/models/airport_model.dart';
import '../../data/models/flight_model.dart';
import '../../domain/repositories/flight_repository.dart';

class FlightProvider extends ChangeNotifier {
  final FlightRepository flightRepository;

  FlightProvider({required this.flightRepository});

  String? depId;
  String? arrId;
  String? depEntityId;
  String? arrEntityId;
  AirportsResponse? airports;
  AllFightsRespondModel? flights;
  DateTimeRange? selectedDateRange;
  String? selectedTravelers;
  String? selectedClass;
  bool isResultScreen = false;
  String? selectedFrom;
  String? selectedTo;

  void setSelectedFrom(value) {
    selectedFrom = value;
    fetchAirportsByName(value!, true);
    notifyListeners();
  }

  void setSelectedTo(value) {
    selectedTo = value;
    fetchAirportsByName(value!, false);

    notifyListeners();
  }

  void setDatePicker(value) {
    selectedDateRange = value;
    notifyListeners();
  }

  void setTraveller(value) {
    selectedTravelers = value;
    notifyListeners();
  }

  void setClass(value) {
    selectedClass = value;
    notifyListeners();
  }

  void getBack() {
    isResultScreen = false;
    notifyListeners();
  }

  void swapFromTo() {
    final temp = selectedFrom;
    selectedFrom = selectedTo;
    selectedTo = temp;
    final tempId = depId;
    depId = arrId;
    arrId = tempId;
    final tempEntity = depEntityId;
    depEntityId = arrEntityId;
    arrEntityId = tempEntity;
    notifyListeners();
  }

  Future<void> searchFlights() async {
    EasyLoading.show();
    if (selectedDateRange == null || depId == null || arrId == null) {
      // Handle the case where required parameters are not set
      EasyLoading.dismiss();

      print('Missing required parameters');
      return;
    }

    notifyListeners();

    try {
      flights = await flightRepository.searchFlights(
        originSkyId: depId!,
        destinationSkyId: arrId!,
        originEntityId: depEntityId!,
        // Replace with actual value
        destinationEntityId: arrEntityId!,
        // Replace with actual value
        date: DateFormat('yyyy-MM-dd').format(selectedDateRange!.start),
        returnDate: DateFormat('yyyy-MM-dd').format(selectedDateRange!.end),
        cabinClass: selectedClass!.toLowerCase() ?? 'economy',
        adults: int.tryParse(selectedTravelers ?? '1') ?? 1,
        sortBy: 'best',
        currency: 'USD',
        market: 'en-US',
        countryCode: 'US',
        limit: 10,
      );
      EasyLoading.dismiss();

      isResultScreen = true;
      notifyListeners();
      print(flights);
    } catch (e) {
      EasyLoading.dismiss();

      print(e);
    }
    EasyLoading.dismiss();

    notifyListeners();
  }

  Future<void> fetchAirportsByName(String name, bool isFrom) async {
    notifyListeners();

    try {
      airports = await flightRepository.getAirportsByName(name);
      if (airports != null && airports!.data!.isNotEmpty) {
        final airport = airports!.data!.firstWhere(
            (element) => element.presentation?.title?.isNotEmpty ?? false);
        if (isFrom) {
          depId = airport.navigation?.relevantFlightParams?.skyId;
          depEntityId = airport.navigation?.relevantFlightParams?.entityId;
        } else {
          arrId = airport.navigation?.relevantFlightParams?.skyId;
          arrEntityId = airport.navigation?.relevantFlightParams?.entityId;
        }
      }
      print(airports);
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }
}
