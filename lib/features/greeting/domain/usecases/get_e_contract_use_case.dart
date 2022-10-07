import 'package:dartz/dartz.dart';
import 'package:sample_clean_arch/core/base/failure.dart';
import 'package:sample_clean_arch/core/base/usecase.dart';

import '../entities/e_contract_entity.dart';
import '../repositories/greeting_repository.dart';

class GetEContractUseCase extends UseCase<EContractEntity, Params> {
  GreetingRepository repository;

  GetEContractUseCase({required this.repository});

  @override
  Future<Either<Failure, EContractEntity>> call(Params params) async {
    return Left(ServerFailure.nullData());
    return await repository.getEContract("lfvn", params.id);
  }
}

class Params {
  final String id;

  Params({required this.id});
}
