import 'package:json_annotation/json_annotation.dart';

part 'flight_model.g.dart'; // Replace with your actual file name

@JsonSerializable()
class AllFightsRespondModel {
  List<BestFlights>? bestFlights;

  AllFightsRespondModel({
    this.bestFlights,
  });

  factory AllFightsRespondModel.fromJson(Map<String, dynamic> json) =>
      _$AllFightsRespondModelFromJson(json);
  Map<String, dynamic> toJson() => _$AllFightsRespondModelToJson(this);
}

@JsonSerializable()
class BestFlights {
  List<Flights>? flights;
  List<Layovers>? layovers;
  int? totalDuration;
  CarbonEmissions? carbonEmissions;
  int? price;
  String? type;
  String? airlineLogo;
  String? departureToken;

  BestFlights(
      {this.flights,
      this.layovers,
      this.totalDuration,
      this.carbonEmissions,
      this.price,
      this.type,
      this.airlineLogo,
      this.departureToken});

  factory BestFlights.fromJson(Map<String, dynamic> json) =>
      _$BestFlightsFromJson(json);
  Map<String, dynamic> toJson() => _$BestFlightsToJson(this);
}

@JsonSerializable()
class Flights {
  DepartureAirport? departureAirport;
  DepartureAirport? arrivalAirport;
  int? duration;
  String? airplane;
  String? airline;
  String? airlineLogo;
  String? travelClass;
  String? flightNumber;
  String? legroom;
  List<String>? extensions;
  bool? overnight;
  bool? oftenDelayedByOver30Min;
  List<String>? ticketAlsoSoldBy;

  Flights(
      {this.departureAirport,
      this.arrivalAirport,
      this.duration,
      this.airplane,
      this.airline,
      this.airlineLogo,
      this.travelClass,
      this.flightNumber,
      this.legroom,
      this.extensions,
      this.overnight,
      this.oftenDelayedByOver30Min,
      this.ticketAlsoSoldBy});

  factory Flights.fromJson(Map<String, dynamic> json) =>
      _$FlightsFromJson(json);
  Map<String, dynamic> toJson() => _$FlightsToJson(this);
}

@JsonSerializable()
class DepartureAirport {
  String? name;
  String? id;
  String? time;

  DepartureAirport({this.name, this.id, this.time});

  factory DepartureAirport.fromJson(Map<String, dynamic> json) =>
      _$DepartureAirportFromJson(json);
  Map<String, dynamic> toJson() => _$DepartureAirportToJson(this);
}

@JsonSerializable()
class Layovers {
  int? duration;
  String? name;
  String? id;

  Layovers({this.duration, this.name, this.id});

  factory Layovers.fromJson(Map<String, dynamic> json) =>
      _$LayoversFromJson(json);
  Map<String, dynamic> toJson() => _$LayoversToJson(this);
}

@JsonSerializable()
class CarbonEmissions {
  int? thisFlight;
  int? typicalForThisRoute;
  int? differencePercent;

  CarbonEmissions(
      {this.thisFlight, this.typicalForThisRoute, this.differencePercent});

  factory CarbonEmissions.fromJson(Map<String, dynamic> json) =>
      _$CarbonEmissionsFromJson(json);
  Map<String, dynamic> toJson() => _$CarbonEmissionsToJson(this);
}
