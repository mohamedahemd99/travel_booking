// import 'package:injectable/injectable.dart';
// import 'package:travel_booking/data/models/airport_model.dart';
// import 'package:travel_booking/data/models/flight_model.dart';
//
// import '../../domain/repositories/flight_repository.dart';
// import '../data_sources/airports_api_service/airport_api_service.dart';
// import '../data_sources/flight_api/flight_api_service.dart';
//
// @LazySingleton(as: FlightRepository)
// class FlightRepositoryImpl implements FlightRepository {
//   final FlightApiService apiService;
//   final AirportApiService airPortApiService;
//
//   FlightRepositoryImpl(this.apiService, this.airPortApiService);
//
//   // @override
//   // Future<AllFightsRespondModel> searchFlights({
//   //   required String departureId,
//   //   required String arrivalId,
//   //   required String outboundDate,
//   //   required String returnDate,
//   //   String currency = "USD",
//   //   String hl = "en",
//   // }) async {
//   //   final response = await apiService.searchFlights(
//   //     departureId: departureId,
//   //     arrivalId: arrivalId,
//   //     outboundDate: outboundDate,
//   //     returnDate: returnDate,
//   //     currency: currency,
//   //     hl: hl,
//   //     apiKey:
//   //         'c3204a69f1c3319e147fcd4e5b3541c41afe94d5f88e7e5c9102e534fa1be785',
//   //   );
//   //   return response!;
//   // }
//
//   @override
//   Future<List<AirportsModel>> getAirportsByName(String name) async {
//     try {
//       final response = await airPortApiService.getAirportsByName(
//         name: name,
//         apiKey: "RoDXjawMMzgStAvCgiNXhQ==x1Av9k9Mu3xjQrzw",
//       );
//       return response;
//     } catch (e) {
//       throw Exception("Failed to fetch airports: $e");
//     }
//   }
//
//   @override
//   Future<AllFightsRespondModel> searchFlights(
//       {required String departureId,
//       required String arrivalId,
//       required String outboundDate,
//       required String returnDate,
//       String currency = "USD",
//       String hl = "en"}) {
//     // TODO: implement searchFlights
//     throw UnimplementedError();
//   }
// }
import 'package:injectable/injectable.dart';
import 'package:travel_booking/data/models/airport_model.dart';
import 'package:travel_booking/data/models/flight_model.dart';

import '../../domain/repositories/flight_repository.dart';
import '../data_sources/airports_api_service/airport_api_service.dart';
import '../data_sources/flight_api/flight_api_service.dart';

@LazySingleton(as: FlightRepository)
class FlightRepositoryImpl implements FlightRepository {
  final FlightApiService apiService;
  final AirportApiService airPortApiService;

  FlightRepositoryImpl(this.apiService, this.airPortApiService);

  @override
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
  }) async {
    try {
      final response = await apiService.searchFlights(
        apiKey: "69595fb7eamsh047454da8bc419ap12f7b3jsn8566677794a8",
        originSkyId: originSkyId,
        destinationSkyId: destinationSkyId,
        originEntityId: originEntityId,
        destinationEntityId: destinationEntityId,
        date: date,
        returnDate: returnDate,
        cabinClass: cabinClass,
        adults: adults,
        sortBy: sortBy,
        currency: currency,
        market: market,
        countryCode: countryCode,
        limit: limit,
      );
      return response!;
    } catch (e) {
      throw Exception("Failed to search flights: $e");
    }
  }

  @override
  Future<AirportsResponse> getAirportsByName(String name) async {
    try {
      final response = await airPortApiService.getAirportsByName(
        name: name,
        apiKey: "69595fb7eamsh047454da8bc419ap12f7b3jsn8566677794a8",
      );
      return response;
    } catch (e) {
      throw Exception("Failed to fetch airports: $e");
    }
  }
}
