import 'package:dio/dio.dart';
import 'package:sample_clean_arch/external/dsb_core.dart';

class DioProvider {
  static Future<Dio> initDio({Dio? dio}) async {
    Dio? providedDio = dio;
    providedDio ??= await provideDio(pHeaders: {
      'Accept': 'application/json',
      'x-access-token': ApiProvider.getAccessToken(),
    });
    return providedDio;
  }
}
