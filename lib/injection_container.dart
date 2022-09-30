import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sample_clean_arch/features/greeting/data/datasources/greeting_remote_data_source.dart';
import 'package:sample_clean_arch/features/greeting/data/repositories/greeting_repository_impl.dart';
import 'package:sample_clean_arch/features/greeting/domain/repositories/greeting_repository.dart';
import 'package:sample_clean_arch/features/greeting/domain/usecases/get_e_contract_use_case.dart';

import 'core/network/providers/dio_provider.dart';

final locator = GetIt.instance;

Future setupLocator() async {
  //! Core
  final dio = await DioProvider.initDio();
  // locator.registerLazySingletonAsync<Dio>(() => DioProvider.initDio());

  // Feature `Greeting`
  locator.registerLazySingleton<GetEContractUseCase>(() => GetEContractUseCase(repository: locator()));
  locator.registerLazySingleton<GreetingRepository>(() => GreetingRepositoryImpl(remoteDataSource: locator()));
  locator.registerLazySingleton<GreetingRemoteDataSource>(
      () => GreetingRemoteDataSource(dio, baseUrl: 'https://mocki.io')); // Mặc định baseUrl là API_BASE_URL

  // Other features
}
