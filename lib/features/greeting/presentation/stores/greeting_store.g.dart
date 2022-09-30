// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'greeting_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GreetingStore on _GreetingStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_GreetingStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$eContractEntityAtom =
      Atom(name: '_GreetingStore.eContractEntity', context: context);

  @override
  EContractEntity? get eContractEntity {
    _$eContractEntityAtom.reportRead();
    return super.eContractEntity;
  }

  @override
  set eContractEntity(EContractEntity? value) {
    _$eContractEntityAtom.reportWrite(value, super.eContractEntity, () {
      super.eContractEntity = value;
    });
  }

  late final _$getEContractAsyncAction =
      AsyncAction('_GreetingStore.getEContract', context: context);

  @override
  Future<bool> getEContract() {
    return _$getEContractAsyncAction.run(() => super.getEContract());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
eContractEntity: ${eContractEntity}
    ''';
  }
}
