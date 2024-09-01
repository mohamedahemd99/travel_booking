// import 'package:json_annotation/json_annotation.dart';
//
// part 'flight_model.g.dart';
//
// @JsonSerializable()
// class AllFightsRespondModel {
//   List<BestFlights>? bestFlights;
//
//   AllFightsRespondModel({
//     this.bestFlights,
//   });
//
//   factory AllFightsRespondModel.fromJson(Map<String, dynamic> json) =>
//       _$AllFightsRespondModelFromJson(json);
//   Map<String, dynamic> toJson() => _$AllFightsRespondModelToJson(this);
// }
//
// @JsonSerializable()
// class BestFlights {
//   List<Flights>? flights;
//   List<Layovers>? layovers;
//   int? totalDuration;
//   CarbonEmissions? carbonEmissions;
//   int? price;
//   String? type;
//   String? airlineLogo;
//   String? departureToken;
//
//   BestFlights(
//       {this.flights,
//       this.layovers,
//       this.totalDuration,
//       this.carbonEmissions,
//       this.price,
//       this.type,
//       this.airlineLogo,
//       this.departureToken});
//
//   factory BestFlights.fromJson(Map<String, dynamic> json) =>
//       _$BestFlightsFromJson(json);
//   Map<String, dynamic> toJson() => _$BestFlightsToJson(this);
// }
//
// @JsonSerializable()
// class Flights {
//   DepartureAirport? departureAirport;
//   DepartureAirport? arrivalAirport;
//   int? duration;
//   String? airplane;
//   String? airline;
//   String? airlineLogo;
//   String? travelClass;
//   String? flightNumber;
//   String? legroom;
//   List<String>? extensions;
//   bool? overnight;
//   bool? oftenDelayedByOver30Min;
//   List<String>? ticketAlsoSoldBy;
//
//   Flights(
//       {this.departureAirport,
//       this.arrivalAirport,
//       this.duration,
//       this.airplane,
//       this.airline,
//       this.airlineLogo,
//       this.travelClass,
//       this.flightNumber,
//       this.legroom,
//       this.extensions,
//       this.overnight,
//       this.oftenDelayedByOver30Min,
//       this.ticketAlsoSoldBy});
//
//   factory Flights.fromJson(Map<String, dynamic> json) =>
//       _$FlightsFromJson(json);
//   Map<String, dynamic> toJson() => _$FlightsToJson(this);
// }
//
// @JsonSerializable()
// class DepartureAirport {
//   String? name;
//   String? id;
//   String? time;
//
//   DepartureAirport({this.name, this.id, this.time});
//
//   factory DepartureAirport.fromJson(Map<String, dynamic> json) =>
//       _$DepartureAirportFromJson(json);
//   Map<String, dynamic> toJson() => _$DepartureAirportToJson(this);
// }
//
// @JsonSerializable()
// class Layovers {
//   int? duration;
//   String? name;
//   String? id;
//
//   Layovers({this.duration, this.name, this.id});
//
//   factory Layovers.fromJson(Map<String, dynamic> json) =>
//       _$LayoversFromJson(json);
//   Map<String, dynamic> toJson() => _$LayoversToJson(this);
// }
//
// @JsonSerializable()
// class CarbonEmissions {
//   int? thisFlight;
//   int? typicalForThisRoute;
//   int? differencePercent;
//
//   CarbonEmissions(
//       {this.thisFlight, this.typicalForThisRoute, this.differencePercent});
//
//   factory CarbonEmissions.fromJson(Map<String, dynamic> json) =>
//       _$CarbonEmissionsFromJson(json);
//   Map<String, dynamic> toJson() => _$CarbonEmissionsToJson(this);
// }
import 'package:json_annotation/json_annotation.dart';

part 'flight_model.g.dart';

@JsonSerializable()
class AllFightsRespondModel {
  final bool status;
  final int timestamp;
  final String sessionId;
  final FlightData data;

  AllFightsRespondModel({
    required this.status,
    required this.timestamp,
    required this.sessionId,
    required this.data,
  });

  factory AllFightsRespondModel.fromJson(Map<String, dynamic> json) =>
      _$AllFightsRespondModelFromJson(json);
  Map<String, dynamic> toJson() => _$AllFightsRespondModelToJson(this);
}

@JsonSerializable()
class FlightData {
  final List<Itinerary> itineraries;
  final List<dynamic> messages;
  final String destinationImageUrl;

  FlightData({
    required this.itineraries,
    required this.messages,
    required this.destinationImageUrl,
  });

  factory FlightData.fromJson(Map<String, dynamic> json) =>
      _$FlightDataFromJson(json);
  Map<String, dynamic> toJson() => _$FlightDataToJson(this);
}

@JsonSerializable()
class Itinerary {
  final String id;
  final ItineraryPrice price;
  final List<Leg> legs;

  Itinerary({
    required this.id,
    required this.price,
    required this.legs,
  });

  factory Itinerary.fromJson(Map<String, dynamic> json) =>
      _$ItineraryFromJson(json);
  Map<String, dynamic> toJson() => _$ItineraryToJson(this);
}

@JsonSerializable()
class ItineraryPrice {
  final double raw;
  final String formatted;
  final String pricingOptionId;

  ItineraryPrice({
    required this.raw,
    required this.formatted,
    required this.pricingOptionId,
  });

  factory ItineraryPrice.fromJson(Map<String, dynamic> json) =>
      _$ItineraryPriceFromJson(json);
  Map<String, dynamic> toJson() => _$ItineraryPriceToJson(this);
}

@JsonSerializable()
class Leg {
  final String id;
  final Airport origin;
  final Airport destination;
  final int durationInMinutes;
  final int stopCount;
  final bool isSmallestStops;
  final String departure;
  final String arrival;
  final int timeDeltaInDays;
  final Carriers carriers;
  final List<Segment> segments;

  Leg({
    required this.id,
    required this.origin,
    required this.destination,
    required this.durationInMinutes,
    required this.stopCount,
    required this.isSmallestStops,
    required this.departure,
    required this.arrival,
    required this.timeDeltaInDays,
    required this.carriers,
    required this.segments,
  });

  factory Leg.fromJson(Map<String, dynamic> json) => _$LegFromJson(json);
  Map<String, dynamic> toJson() => _$LegToJson(this);
}

@JsonSerializable()
class Airport {
  final String id;
  final String entityId;
  final String name;
  final String displayCode;
  final String city;
  final String country;
  final bool isHighlighted;

  Airport({
    required this.id,
    required this.entityId,
    required this.name,
    required this.displayCode,
    required this.city,
    required this.country,
    required this.isHighlighted,
  });

  factory Airport.fromJson(Map<String, dynamic> json) =>
      _$AirportFromJson(json);
  Map<String, dynamic> toJson() => _$AirportToJson(this);
}

@JsonSerializable()
class Carriers {
  final List<Carrier> marketing;
  final String operationType;

  Carriers({
    required this.marketing,
    required this.operationType,
  });

  factory Carriers.fromJson(Map<String, dynamic> json) =>
      _$CarriersFromJson(json);
  Map<String, dynamic> toJson() => _$CarriersToJson(this);
}

@JsonSerializable()
class Carrier {
  final int id;
  final String logoUrl;
  final String name;

  Carrier({
    required this.id,
    required this.logoUrl,
    required this.name,
  });

  factory Carrier.fromJson(Map<String, dynamic> json) =>
      _$CarrierFromJson(json);
  Map<String, dynamic> toJson() => _$CarrierToJson(this);
}

@JsonSerializable()
class Segment {
  final String id;
  final FlightPlace origin;
  final FlightPlace destination;
  final String departure;
  final String arrival;
  final int durationInMinutes;
  final String flightNumber;
  final MarketingCarrier marketingCarrier;
  final MarketingCarrier operatingCarrier;

  Segment({
    required this.id,
    required this.origin,
    required this.destination,
    required this.departure,
    required this.arrival,
    required this.durationInMinutes,
    required this.flightNumber,
    required this.marketingCarrier,
    required this.operatingCarrier,
  });

  factory Segment.fromJson(Map<String, dynamic> json) =>
      _$SegmentFromJson(json);
  Map<String, dynamic> toJson() => _$SegmentToJson(this);
}

@JsonSerializable()
class FlightPlace {
  final String flightPlaceId;
  final String displayCode;
  final ParentPlace parent;
  final String name;
  final String type;
  final String country;

  FlightPlace({
    required this.flightPlaceId,
    required this.displayCode,
    required this.parent,
    required this.name,
    required this.type,
    required this.country,
  });

  factory FlightPlace.fromJson(Map<String, dynamic> json) =>
      _$FlightPlaceFromJson(json);
  Map<String, dynamic> toJson() => _$FlightPlaceToJson(this);
}

@JsonSerializable()
class ParentPlace {
  final String flightPlaceId;
  final String displayCode;
  final String name;
  final String type;

  ParentPlace({
    required this.flightPlaceId,
    required this.displayCode,
    required this.name,
    required this.type,
  });

  factory ParentPlace.fromJson(Map<String, dynamic> json) =>
      _$ParentPlaceFromJson(json);
  Map<String, dynamic> toJson() => _$ParentPlaceToJson(this);
}

@JsonSerializable()
class MarketingCarrier {
  final int id;
  final String name;
  final String alternateId;
  final int allianceId;
  final String displayCode;

  MarketingCarrier({
    required this.id,
    required this.name,
    required this.alternateId,
    required this.allianceId,
    required this.displayCode,
  });

  factory MarketingCarrier.fromJson(Map<String, dynamic> json) =>
      _$MarketingCarrierFromJson(json);
  Map<String, dynamic> toJson() => _$MarketingCarrierToJson(this);
}
