import 'package:travel_booking/data/models/flight_model.dart';

abstract class FlightRepository {
  Future<AllFightsRespondModel> searchFlights({
    required String departureId,
    required String arrivalId,
    required String outboundDate,
    required String returnDate,
    String currency = "USD",
    String hl = "en",
  });
}
