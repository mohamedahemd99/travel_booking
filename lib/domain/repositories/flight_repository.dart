// import '../../data/models/airport_model.dart';
// import '../../data/models/flight_model.dart';
//
// abstract class FlightRepository {
//   // Method to search for flights
//   Future<AllFightsRespondModel> searchFlights({
//     required String departureId,
//     required String arrivalId,
//     required String outboundDate,
//     required String returnDate,
//     String currency = "USD",
//     String hl = "en",
//   });
//
//   Future<List<AirportsModel>> getAirportsByName(String name);
// }
import '../../data/models/airport_model.dart';
import '../../data/models/flight_model.dart';

abstract class FlightRepository {
  // Method to search for flights
  Future<AllFightsRespondModel> searchFlights({
    required String originSkyId,
    required String destinationSkyId,
    required String originEntityId,
    required String destinationEntityId,
    required String date,
    required String returnDate,
    String cabinClass = "economy",
    int adults = 1,
    String sortBy = "best",
    String currency = "USD",
    String market = "en-US",
    String countryCode = "US",
    int limit = 1,
  });

  Future<AirportsResponse> getAirportsByName(String name);
}
