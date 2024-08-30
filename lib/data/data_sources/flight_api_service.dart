import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/flight_model.dart';

part 'flight_api_service.g.dart';

@RestApi(baseUrl: "https://serpapi.com/")
abstract class FlightApiService {
  factory FlightApiService(Dio dio, {String baseUrl}) = _FlightApiService;

  @GET("search.json")
  Future<AllFightsRespondModel?> searchFlights({
    @Query("engine") String engine = "google_flights",
    @Query("departure_id") required String departureId,
    @Query("arrival_id") required String arrivalId,
    @Query("outbound_date") required String outboundDate,
    @Query("return_date") required String returnDate,
    @Query("currency") String currency = "USD",
    @Query("hl") String hl = "en",
    @Query("api_key") required String apiKey,
  });
}
