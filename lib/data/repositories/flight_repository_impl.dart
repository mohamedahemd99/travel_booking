import 'package:injectable/injectable.dart';
import 'package:travel_booking/data/models/flight_model.dart';

import '../../domain/repositories/flight_repository.dart';
import '../data_sources/flight_api_service.dart';

@LazySingleton(
    as: FlightRepository) // Adjust to match your repository interface
class FlightRepositoryImpl implements FlightRepository {
  final FlightApiService apiService;

  FlightRepositoryImpl(this.apiService);

  @override
  Future<AllFightsRespondModel> searchFlights({
    required String departureId,
    required String arrivalId,
    required String outboundDate,
    required String returnDate,
    String currency = "USD",
    String hl = "en",
  }) async {
    final response = await apiService.searchFlights(
      departureId: departureId,
      arrivalId: arrivalId,
      outboundDate: outboundDate,
      returnDate: returnDate,
      currency: currency,
      hl: hl,
      apiKey:
          'c3204a69f1c3319e147fcd4e5b3541c41afe94d5f88e7e5c9102e534fa1be785',
    );
    return response!;
  }
}
