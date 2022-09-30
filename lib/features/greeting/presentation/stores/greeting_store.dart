import 'package:mobx/mobx.dart';
import 'package:sample_clean_arch/features/greeting/domain/entities/e_contract_entity.dart';
import 'package:sample_clean_arch/features/greeting/domain/usecases/get_e_contract_use_case.dart';
import 'package:sample_clean_arch/injection_container.dart';

part 'greeting_store.g.dart';

class GreetingStore extends _GreetingStore with _$GreetingStore {}

abstract class _GreetingStore with Store {
  @observable
  bool isLoading = false;

  @observable
  EContractEntity? eContractEntity;

  @action
  Future<bool> getEContract() async {
    isLoading = true;

    final failureOrEntity = await locator<GetEContractUseCase>().call(Params(id: '123456'));
    await Future.delayed(const Duration(seconds: 3));

    isLoading = false;

    return failureOrEntity.fold(
      (failure) => false,
      (entity) {
        eContractEntity = entity;
        return true;
      },
    );
  }
}
