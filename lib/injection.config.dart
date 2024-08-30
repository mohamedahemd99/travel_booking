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

import 'data/data_sources/flight_api_service.dart' as _i5;
import 'data/data_sources/flight_api_service.dart';
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
          baseUrl: 'https://serpapi.com/',
        ));

    gh.lazySingleton<Dio>(() => Dio());
    gh.lazySingleton<_i3.FlightRepository>(
        () => _i4.FlightRepositoryImpl(gh<_i5.FlightApiService>()));
    return this;
  }
}
