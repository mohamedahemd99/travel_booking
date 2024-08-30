// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllFightsRespondModel _$AllFightsRespondModelFromJson(
        Map<String, dynamic> json) =>
    AllFightsRespondModel(
      bestFlights: (json['bestFlights'] as List<dynamic>?)
          ?.map((e) => BestFlights.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllFightsRespondModelToJson(
        AllFightsRespondModel instance) =>
    <String, dynamic>{
      'bestFlights': instance.bestFlights,
    };

BestFlights _$BestFlightsFromJson(Map<String, dynamic> json) => BestFlights(
      flights: (json['flights'] as List<dynamic>?)
          ?.map((e) => Flights.fromJson(e as Map<String, dynamic>))
          .toList(),
      layovers: (json['layovers'] as List<dynamic>?)
          ?.map((e) => Layovers.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalDuration: (json['totalDuration'] as num?)?.toInt(),
      carbonEmissions: json['carbonEmissions'] == null
          ? null
          : CarbonEmissions.fromJson(
              json['carbonEmissions'] as Map<String, dynamic>),
      price: (json['price'] as num?)?.toInt(),
      type: json['type'] as String?,
      airlineLogo: json['airlineLogo'] as String?,
      departureToken: json['departureToken'] as String?,
    );

Map<String, dynamic> _$BestFlightsToJson(BestFlights instance) =>
    <String, dynamic>{
      'flights': instance.flights,
      'layovers': instance.layovers,
      'totalDuration': instance.totalDuration,
      'carbonEmissions': instance.carbonEmissions,
      'price': instance.price,
      'type': instance.type,
      'airlineLogo': instance.airlineLogo,
      'departureToken': instance.departureToken,
    };

Flights _$FlightsFromJson(Map<String, dynamic> json) => Flights(
      departureAirport: json['departureAirport'] == null
          ? null
          : DepartureAirport.fromJson(
              json['departureAirport'] as Map<String, dynamic>),
      arrivalAirport: json['arrivalAirport'] == null
          ? null
          : DepartureAirport.fromJson(
              json['arrivalAirport'] as Map<String, dynamic>),
      duration: (json['duration'] as num?)?.toInt(),
      airplane: json['airplane'] as String?,
      airline: json['airline'] as String?,
      airlineLogo: json['airlineLogo'] as String?,
      travelClass: json['travelClass'] as String?,
      flightNumber: json['flightNumber'] as String?,
      legroom: json['legroom'] as String?,
      extensions: (json['extensions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      overnight: json['overnight'] as bool?,
      oftenDelayedByOver30Min: json['oftenDelayedByOver30Min'] as bool?,
      ticketAlsoSoldBy: (json['ticketAlsoSoldBy'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$FlightsToJson(Flights instance) => <String, dynamic>{
      'departureAirport': instance.departureAirport,
      'arrivalAirport': instance.arrivalAirport,
      'duration': instance.duration,
      'airplane': instance.airplane,
      'airline': instance.airline,
      'airlineLogo': instance.airlineLogo,
      'travelClass': instance.travelClass,
      'flightNumber': instance.flightNumber,
      'legroom': instance.legroom,
      'extensions': instance.extensions,
      'overnight': instance.overnight,
      'oftenDelayedByOver30Min': instance.oftenDelayedByOver30Min,
      'ticketAlsoSoldBy': instance.ticketAlsoSoldBy,
    };

DepartureAirport _$DepartureAirportFromJson(Map<String, dynamic> json) =>
    DepartureAirport(
      name: json['name'] as String?,
      id: json['id'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$DepartureAirportToJson(DepartureAirport instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'time': instance.time,
    };

Layovers _$LayoversFromJson(Map<String, dynamic> json) => Layovers(
      duration: (json['duration'] as num?)?.toInt(),
      name: json['name'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$LayoversToJson(Layovers instance) => <String, dynamic>{
      'duration': instance.duration,
      'name': instance.name,
      'id': instance.id,
    };

CarbonEmissions _$CarbonEmissionsFromJson(Map<String, dynamic> json) =>
    CarbonEmissions(
      thisFlight: (json['thisFlight'] as num?)?.toInt(),
      typicalForThisRoute: (json['typicalForThisRoute'] as num?)?.toInt(),
      differencePercent: (json['differencePercent'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CarbonEmissionsToJson(CarbonEmissions instance) =>
    <String, dynamic>{
      'thisFlight': instance.thisFlight,
      'typicalForThisRoute': instance.typicalForThisRoute,
      'differencePercent': instance.differencePercent,
    };
