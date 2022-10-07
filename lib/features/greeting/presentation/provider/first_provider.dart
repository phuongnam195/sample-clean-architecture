import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_clean_arch/features/greeting/domain/entities/e_contract_entity.dart';
import 'package:sample_clean_arch/features/greeting/domain/usecases/get_e_contract_use_case.dart';
import 'package:sample_clean_arch/injection_container.dart';

final getEContractProvider = FutureProvider<EContractEntity?>(
  (ref) async {
    final failureOrEntity = await locator<GetEContractUseCase>().call(Params(id: '123456'));
    await Future.delayed(const Duration(seconds: 3));

    return failureOrEntity.fold(
      (failure) => throw Exception(failure.message),
      (entity) => entity,
    );
  },
);
