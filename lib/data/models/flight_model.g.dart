// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllFightsRespondModel _$AllFightsRespondModelFromJson(
        Map<String, dynamic> json) =>
    AllFightsRespondModel(
      status: json['status'] as bool,
      timestamp: (json['timestamp'] as num).toInt(),
      sessionId: json['sessionId'] as String,
      data: FlightData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AllFightsRespondModelToJson(
        AllFightsRespondModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'timestamp': instance.timestamp,
      'sessionId': instance.sessionId,
      'data': instance.data,
    };

FlightData _$FlightDataFromJson(Map<String, dynamic> json) => FlightData(
      itineraries: (json['itineraries'] as List<dynamic>)
          .map((e) => Itinerary.fromJson(e as Map<String, dynamic>))
          .toList(),
      messages: json['messages'] as List<dynamic>,
      destinationImageUrl: json['destinationImageUrl'] as String,
    );

Map<String, dynamic> _$FlightDataToJson(FlightData instance) =>
    <String, dynamic>{
      'itineraries': instance.itineraries,
      'messages': instance.messages,
      'destinationImageUrl': instance.destinationImageUrl,
    };

Itinerary _$ItineraryFromJson(Map<String, dynamic> json) => Itinerary(
      id: json['id'] as String,
      price: ItineraryPrice.fromJson(json['price'] as Map<String, dynamic>),
      legs: (json['legs'] as List<dynamic>)
          .map((e) => Leg.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItineraryToJson(Itinerary instance) => <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'legs': instance.legs,
    };

ItineraryPrice _$ItineraryPriceFromJson(Map<String, dynamic> json) =>
    ItineraryPrice(
      raw: (json['raw'] as num).toDouble(),
      formatted: json['formatted'] as String,
      pricingOptionId: json['pricingOptionId'] as String,
    );

Map<String, dynamic> _$ItineraryPriceToJson(ItineraryPrice instance) =>
    <String, dynamic>{
      'raw': instance.raw,
      'formatted': instance.formatted,
      'pricingOptionId': instance.pricingOptionId,
    };

Leg _$LegFromJson(Map<String, dynamic> json) => Leg(
      id: json['id'] as String,
      origin: Airport.fromJson(json['origin'] as Map<String, dynamic>),
      destination:
          Airport.fromJson(json['destination'] as Map<String, dynamic>),
      durationInMinutes: (json['durationInMinutes'] as num).toInt(),
      stopCount: (json['stopCount'] as num).toInt(),
      isSmallestStops: json['isSmallestStops'] as bool,
      departure: json['departure'] as String,
      arrival: json['arrival'] as String,
      timeDeltaInDays: (json['timeDeltaInDays'] as num).toInt(),
      carriers: Carriers.fromJson(json['carriers'] as Map<String, dynamic>),
      segments: (json['segments'] as List<dynamic>)
          .map((e) => Segment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LegToJson(Leg instance) => <String, dynamic>{
      'id': instance.id,
      'origin': instance.origin,
      'destination': instance.destination,
      'durationInMinutes': instance.durationInMinutes,
      'stopCount': instance.stopCount,
      'isSmallestStops': instance.isSmallestStops,
      'departure': instance.departure,
      'arrival': instance.arrival,
      'timeDeltaInDays': instance.timeDeltaInDays,
      'carriers': instance.carriers,
      'segments': instance.segments,
    };

Airport _$AirportFromJson(Map<String, dynamic> json) => Airport(
      id: json['id'] as String,
      entityId: json['entityId'] as String,
      name: json['name'] as String,
      displayCode: json['displayCode'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      isHighlighted: json['isHighlighted'] as bool,
    );

Map<String, dynamic> _$AirportToJson(Airport instance) => <String, dynamic>{
      'id': instance.id,
      'entityId': instance.entityId,
      'name': instance.name,
      'displayCode': instance.displayCode,
      'city': instance.city,
      'country': instance.country,
      'isHighlighted': instance.isHighlighted,
    };

Carriers _$CarriersFromJson(Map<String, dynamic> json) => Carriers(
      marketing: (json['marketing'] as List<dynamic>)
          .map((e) => Carrier.fromJson(e as Map<String, dynamic>))
          .toList(),
      operationType: json['operationType'] as String,
    );

Map<String, dynamic> _$CarriersToJson(Carriers instance) => <String, dynamic>{
      'marketing': instance.marketing,
      'operationType': instance.operationType,
    };

Carrier _$CarrierFromJson(Map<String, dynamic> json) => Carrier(
      id: (json['id'] as num).toInt(),
      logoUrl: json['logoUrl'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$CarrierToJson(Carrier instance) => <String, dynamic>{
      'id': instance.id,
      'logoUrl': instance.logoUrl,
      'name': instance.name,
    };

Segment _$SegmentFromJson(Map<String, dynamic> json) => Segment(
      id: json['id'] as String,
      origin: FlightPlace.fromJson(json['origin'] as Map<String, dynamic>),
      destination:
          FlightPlace.fromJson(json['destination'] as Map<String, dynamic>),
      departure: json['departure'] as String,
      arrival: json['arrival'] as String,
      durationInMinutes: (json['durationInMinutes'] as num).toInt(),
      flightNumber: json['flightNumber'] as String,
      marketingCarrier: MarketingCarrier.fromJson(
          json['marketingCarrier'] as Map<String, dynamic>),
      operatingCarrier: MarketingCarrier.fromJson(
          json['operatingCarrier'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SegmentToJson(Segment instance) => <String, dynamic>{
      'id': instance.id,
      'origin': instance.origin,
      'destination': instance.destination,
      'departure': instance.departure,
      'arrival': instance.arrival,
      'durationInMinutes': instance.durationInMinutes,
      'flightNumber': instance.flightNumber,
      'marketingCarrier': instance.marketingCarrier,
      'operatingCarrier': instance.operatingCarrier,
    };

FlightPlace _$FlightPlaceFromJson(Map<String, dynamic> json) => FlightPlace(
      flightPlaceId: json['flightPlaceId'] as String,
      displayCode: json['displayCode'] as String,
      parent: ParentPlace.fromJson(json['parent'] as Map<String, dynamic>),
      name: json['name'] as String,
      type: json['type'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$FlightPlaceToJson(FlightPlace instance) =>
    <String, dynamic>{
      'flightPlaceId': instance.flightPlaceId,
      'displayCode': instance.displayCode,
      'parent': instance.parent,
      'name': instance.name,
      'type': instance.type,
      'country': instance.country,
    };

ParentPlace _$ParentPlaceFromJson(Map<String, dynamic> json) => ParentPlace(
      flightPlaceId: json['flightPlaceId'] as String,
      displayCode: json['displayCode'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$ParentPlaceToJson(ParentPlace instance) =>
    <String, dynamic>{
      'flightPlaceId': instance.flightPlaceId,
      'displayCode': instance.displayCode,
      'name': instance.name,
      'type': instance.type,
    };

MarketingCarrier _$MarketingCarrierFromJson(Map<String, dynamic> json) =>
    MarketingCarrier(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      alternateId: json['alternateId'] as String,
      allianceId: (json['allianceId'] as num).toInt(),
      displayCode: json['displayCode'] as String,
    );

Map<String, dynamic> _$MarketingCarrierToJson(MarketingCarrier instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'alternateId': instance.alternateId,
      'allianceId': instance.allianceId,
      'displayCode': instance.displayCode,
    };
