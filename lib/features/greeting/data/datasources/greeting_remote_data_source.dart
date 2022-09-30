import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sample_clean_arch/core/network/constants/constants.dart';
import 'package:sample_clean_arch/features/greeting/data/models/e_contract_response.dart';

part 'greeting_remote_data_source.g.dart';

@RestApi(baseUrl: API_BASE_URL)
abstract class GreetingRemoteDataSource {
  factory GreetingRemoteDataSource(Dio dio, {String baseUrl}) = _GreetingRemoteDataSource;

  @GET('/v1/ed01ee24-6299-40ea-ab54-ce3401b16a59')
  Future<EContractResponse> getEContract(@Query('partner_code') String partnerCode, @Query('id') String id);
}
