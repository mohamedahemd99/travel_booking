// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'airport_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirportsResponse _$AirportsResponseFromJson(Map<String, dynamic> json) =>
    AirportsResponse(
      status: json['status'] as bool?,
      timestamp: (json['timestamp'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AirportsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AirportsResponseToJson(AirportsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'timestamp': instance.timestamp,
      'data': instance.data,
    };

AirportsModel _$AirportsModelFromJson(Map<String, dynamic> json) =>
    AirportsModel(
      skyId: json['skyId'] as String?,
      entityId: json['entityId'] as String?,
      presentation: json['presentation'] == null
          ? null
          : Presentation.fromJson(json['presentation'] as Map<String, dynamic>),
      navigation: json['navigation'] == null
          ? null
          : Navigation.fromJson(json['navigation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AirportsModelToJson(AirportsModel instance) =>
    <String, dynamic>{
      'skyId': instance.skyId,
      'entityId': instance.entityId,
      'presentation': instance.presentation,
      'navigation': instance.navigation,
    };

Presentation _$PresentationFromJson(Map<String, dynamic> json) => Presentation(
      title: json['title'] as String?,
      suggestionTitle: json['suggestionTitle'] as String?,
      subtitle: json['subtitle'] as String?,
    );

Map<String, dynamic> _$PresentationToJson(Presentation instance) =>
    <String, dynamic>{
      'title': instance.title,
      'suggestionTitle': instance.suggestionTitle,
      'subtitle': instance.subtitle,
    };

Navigation _$NavigationFromJson(Map<String, dynamic> json) => Navigation(
      entityId: json['entityId'] as String?,
      entityType: json['entityType'] as String?,
      localizedName: json['localizedName'] as String?,
      relevantFlightParams: json['relevantFlightParams'] == null
          ? null
          : RelevantFlightParams.fromJson(
              json['relevantFlightParams'] as Map<String, dynamic>),
      relevantHotelParams: json['relevantHotelParams'] == null
          ? null
          : RelevantHotelParams.fromJson(
              json['relevantHotelParams'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NavigationToJson(Navigation instance) =>
    <String, dynamic>{
      'entityId': instance.entityId,
      'entityType': instance.entityType,
      'localizedName': instance.localizedName,
      'relevantFlightParams': instance.relevantFlightParams,
      'relevantHotelParams': instance.relevantHotelParams,
    };

RelevantFlightParams _$RelevantFlightParamsFromJson(
        Map<String, dynamic> json) =>
    RelevantFlightParams(
      skyId: json['skyId'] as String?,
      entityId: json['entityId'] as String?,
      flightPlaceType: json['flightPlaceType'] as String?,
      localizedName: json['localizedName'] as String?,
    );

Map<String, dynamic> _$RelevantFlightParamsToJson(
        RelevantFlightParams instance) =>
    <String, dynamic>{
      'skyId': instance.skyId,
      'entityId': instance.entityId,
      'flightPlaceType': instance.flightPlaceType,
      'localizedName': instance.localizedName,
    };

RelevantHotelParams _$RelevantHotelParamsFromJson(Map<String, dynamic> json) =>
    RelevantHotelParams(
      entityId: json['entityId'] as String?,
      entityType: json['entityType'] as String?,
      localizedName: json['localizedName'] as String?,
    );

Map<String, dynamic> _$RelevantHotelParamsToJson(
        RelevantHotelParams instance) =>
    <String, dynamic>{
      'entityId': instance.entityId,
      'entityType': instance.entityType,
      'localizedName': instance.localizedName,
    };
