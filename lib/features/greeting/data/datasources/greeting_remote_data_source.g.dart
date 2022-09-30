// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'greeting_remote_data_source.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _GreetingRemoteDataSource implements GreetingRemoteDataSource {
  _GreetingRemoteDataSource(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.tala.xyz';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<EContractResponse> getEContract(partnerCode, id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'partner_code': partnerCode,
      r'id': id
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<EContractResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(
                    _dio.options, '/v1/ed01ee24-6299-40ea-ab54-ce3401b16a59',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = EContractResponse.fromJson(_result.data!);
    return value;
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
}
