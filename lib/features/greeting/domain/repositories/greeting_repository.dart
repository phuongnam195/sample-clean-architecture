import 'package:dartz/dartz.dart';
import 'package:sample_clean_arch/core/base/failure.dart';

import '../entities/e_contract_entity.dart'; // TODO: Cùng một tầng thì relative import

abstract class GreetingRepository {
  Future<Either<Failure, EContractEntity>> getEContract(String partnerCode, String id);
}
