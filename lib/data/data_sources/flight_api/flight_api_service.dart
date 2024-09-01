// import 'package:dio/dio.dart';
// import 'package:retrofit/retrofit.dart';
//
// import '../../models/flight_model.dart';
//
// part 'flight_api_service.g.dart';
//
// @RestApi(baseUrl: "https://serpapi.com/")
// abstract class FlightApiService {
//   factory FlightApiService(Dio dio, {String baseUrl}) = _FlightApiService;
//
//   @GET("search.json")
//   Future<AllFightsRespondModel?> searchFlights({
//     @Query("engine") String engine = "google_flights",
//     @Query("departure_id") required String departureId,
//     @Query("arrival_id") required String arrivalId,
//     @Query("outbound_date") required String outboundDate,
//     @Query("return_date") required String returnDate,
//     @Query("currency") String currency = "USD",
//     @Query("hl") String hl = "en",
//     @Query("api_key") required String apiKey,
//   });
// }
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/flight_model.dart';

part 'flight_api_service.g.dart';

@RestApi(baseUrl: "https://sky-scrapper.p.rapidapi.com/api/v2/")
abstract class FlightApiService {
  factory FlightApiService(Dio dio, {String baseUrl}) = _FlightApiService;

  @GET("flights/searchFlights")
  Future<AllFightsRespondModel?> searchFlights({
    @Header("X-RapidAPI-Key") required String apiKey,
    @Header("X-RapidAPI-Host") String apiHost = "sky-scrapper.p.rapidapi.com",
    @Query("originSkyId") required String originSkyId,
    @Query("destinationSkyId") required String destinationSkyId,
    @Query("originEntityId") required String originEntityId,
    @Query("destinationEntityId") required String destinationEntityId,
    @Query("date") required String date,
    @Query("returnDate") required String returnDate,
    @Query("cabinClass") String cabinClass = "economy",
    @Query("adults") int adults = 1,
    @Query("sortBy") String sortBy = "best",
    @Query("currency") String currency = "USD",
    @Query("market") String market = "en-US",
    @Query("countryCode") String countryCode = "US",
    @Query("limit") int limit = 1,
  });
}
