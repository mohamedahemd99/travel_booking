import 'package:json_annotation/json_annotation.dart';

part 'airport_model.g.dart';

@JsonSerializable()
class AirportsResponse {
  bool? status;
  int? timestamp;
  List<AirportsModel>? data;

  AirportsResponse({
    this.status,
    this.timestamp,
    this.data,
  });

  factory AirportsResponse.fromJson(Map<String, dynamic> json) =>
      _$AirportsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AirportsResponseToJson(this);
}

@JsonSerializable()
class AirportsModel {
  @JsonKey(name: 'skyId')
  String? skyId;

  @JsonKey(name: 'entityId')
  String? entityId;

  @JsonKey(name: 'presentation')
  Presentation? presentation;

  @JsonKey(name: 'navigation')
  Navigation? navigation;

  AirportsModel({
    this.skyId,
    this.entityId,
    this.presentation,
    this.navigation,
  });

  factory AirportsModel.fromJson(Map<String, dynamic> json) =>
      _$AirportsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AirportsModelToJson(this);
}

@JsonSerializable()
class Presentation {
  String? title;
  String? suggestionTitle;
  String? subtitle;

  Presentation({
    this.title,
    this.suggestionTitle,
    this.subtitle,
  });

  factory Presentation.fromJson(Map<String, dynamic> json) =>
      _$PresentationFromJson(json);

  Map<String, dynamic> toJson() => _$PresentationToJson(this);
}

@JsonSerializable()
class Navigation {
  @JsonKey(name: 'entityId')
  String? entityId;

  @JsonKey(name: 'entityType')
  String? entityType;

  @JsonKey(name: 'localizedName')
  String? localizedName;

  @JsonKey(name: 'relevantFlightParams')
  RelevantFlightParams? relevantFlightParams;

  @JsonKey(name: 'relevantHotelParams')
  RelevantHotelParams? relevantHotelParams;

  Navigation({
    this.entityId,
    this.entityType,
    this.localizedName,
    this.relevantFlightParams,
    this.relevantHotelParams,
  });

  factory Navigation.fromJson(Map<String, dynamic> json) =>
      _$NavigationFromJson(json);

  Map<String, dynamic> toJson() => _$NavigationToJson(this);
}

@JsonSerializable()
class RelevantFlightParams {
  @JsonKey(name: 'skyId')
  String? skyId;

  @JsonKey(name: 'entityId')
  String? entityId;

  @JsonKey(name: 'flightPlaceType')
  String? flightPlaceType;

  @JsonKey(name: 'localizedName')
  String? localizedName;

  RelevantFlightParams({
    this.skyId,
    this.entityId,
    this.flightPlaceType,
    this.localizedName,
  });

  factory RelevantFlightParams.fromJson(Map<String, dynamic> json) =>
      _$RelevantFlightParamsFromJson(json);

  Map<String, dynamic> toJson() => _$RelevantFlightParamsToJson(this);
}

@JsonSerializable()
class RelevantHotelParams {
  @JsonKey(name: 'entityId')
  String? entityId;

  @JsonKey(name: 'entityType')
  String? entityType;

  @JsonKey(name: 'localizedName')
  String? localizedName;

  RelevantHotelParams({
    this.entityId,
    this.entityType,
    this.localizedName,
  });

  factory RelevantHotelParams.fromJson(Map<String, dynamic> json) =>
      _$RelevantHotelParamsFromJson(json);

  Map<String, dynamic> toJson() => _$RelevantHotelParamsToJson(this);
}
