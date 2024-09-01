// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element

class _FlightApiService implements FlightApiService {
  _FlightApiService(
    this._dio, {
    this.baseUrl,
    this.errorLogger,
  }) {
    baseUrl ??= 'https://sky-scrapper.p.rapidapi.com/api/v2/';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<AllFightsRespondModel?> searchFlights({
    required String apiKey,
    String apiHost = "sky-scrapper.p.rapidapi.com",
    required String originSkyId,
    required String destinationSkyId,
    required String originEntityId,
    required String destinationEntityId,
    required String date,
    required String returnDate,
    String cabinClass = "economy",
    int adults = 1,
    String sortBy = "best",
    String currency = "USD",
    String market = "en-US",
    String countryCode = "US",
    int limit = 1,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'originSkyId': originSkyId,
      r'destinationSkyId': destinationSkyId,
      r'originEntityId': originEntityId,
      r'destinationEntityId': destinationEntityId,
      r'date': date,
      r'returnDate': returnDate,
      r'cabinClass': cabinClass,
      r'adults': adults,
      r'sortBy': sortBy,
      r'currency': currency,
      r'market': market,
      r'countryCode': countryCode,
      r'limit': limit,
    };
    final _headers = <String, dynamic>{
      r'X-RapidAPI-Key': apiKey,
      r'X-RapidAPI-Host': apiHost,
    };
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<AllFightsRespondModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'flights/searchFlights',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>?>(_options);
    late AllFightsRespondModel? _value;
    try {
      _value = _result.data == null
          ? null
          : AllFightsRespondModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
