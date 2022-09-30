import 'package:dartz/dartz.dart';
import 'package:sample_clean_arch/core/base/failure.dart';
import 'package:sample_clean_arch/features/greeting/data/datasources/greeting_remote_data_source.dart';
import 'package:sample_clean_arch/features/greeting/domain/entities/e_contract_entity.dart';
import 'package:sample_clean_arch/features/greeting/domain/repositories/greeting_repository.dart';

class GreetingRepositoryImpl implements GreetingRepository {
  final GreetingRemoteDataSource remoteDataSource;

  GreetingRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, EContractEntity>> getEContract(String partnerCode, String id) async {
    try {
      final response = await remoteDataSource.getEContract(partnerCode, id);
      if (response.isSuccess) {
        final data = response.data;
        if (data != null) {
          return Right(data.toEntity());
        }
        return Left(ServerFailure.nullData());
      } else {
        return Left(ServerFailure(response.message));
      }
    } catch (e) {
      return Left(ServerFailure('$e'));
    }
  }
}
