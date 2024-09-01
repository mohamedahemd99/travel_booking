// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:travel_booking/data/data_sources/airports_api_service/airport_api_service.dart';

import 'data/data_sources/flight_api/flight_api_service.dart';
import 'data/repositories/flight_repository_impl.dart' as _i4;
import 'domain/repositories/flight_repository.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<FlightApiService>(() => FlightApiService(
          gh<Dio>(),
          baseUrl: 'https://sky-scrapper.p.rapidapi.com/api/v2/',
        ));
    gh.lazySingleton<AirportApiService>(() => AirportApiService(
          gh<Dio>(),
          baseUrl: 'https://sky-scrapper.p.rapidapi.com/api/v1/',
        ));

    gh.lazySingleton<Dio>(() => Dio());
    gh.lazySingleton<_i3.FlightRepository>(() => _i4.FlightRepositoryImpl(
        gh<FlightApiService>(), gh<AirportApiService>()));
    return this;
  }
}
