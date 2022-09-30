import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Future<Dio> provideDio({Map<String, dynamic>? pHeaders}) async {
  final dio = Dio(BaseOptions(connectTimeout: 30000, headers: pHeaders));
  dio.interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 90,
  ));
  return dio;
}

class ApiProvider {
  static String getAccessToken() {
    return 'fake access token';
  }
}

class AppTracking {
  static trackAmplitudeEvent({required String eventName, Map<String, dynamic> data = const {}}) {}
}
