// import 'package:dio/dio.dart';
// import 'package:retrofit/retrofit.dart';
//
// import '../../models/airport_model.dart';
//
// part 'airport_api_service.g.dart';
//
// @RestApi(baseUrl: "https://api.api-ninjas.com/v1/")
// abstract class AirportApiService {
//   factory AirportApiService(Dio dio, {String baseUrl}) = _AirportApiService;
//
//   @GET("airports")
//   Future<List<AirportsModel>> getAirportsByName({
//     @Query("name") required String name,
//     @Header("X-Api-Key") required String apiKey,
//   });
// }
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/airport_model.dart';

part 'airport_api_service.g.dart';

@RestApi(baseUrl: "https://sky-scrapper.p.rapidapi.com/api/v1/")
abstract class AirportApiService {
  factory AirportApiService(Dio dio, {String baseUrl}) = _AirportApiService;

  @GET("flights/searchAirport")
  Future<AirportsResponse> getAirportsByName({
    @Query("query") required String name,
    @Header("X-RapidAPI-Key") required String apiKey,
    @Header("x-rapidapi-ua") String apiUs = "RapidAPI-Playground",
    @Header("x-rapidapi-host") String apiHost = "sky-scrapper.p.rapidapi.com",
  });
}
