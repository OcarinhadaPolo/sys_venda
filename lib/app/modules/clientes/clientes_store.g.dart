// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clientes_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ClientesStore on _ClientesStoreBase, Store {
  late final _$valueAtom =
      Atom(name: '_ClientesStoreBase.value', context: context);

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$clientesAtom =
      Atom(name: '_ClientesStoreBase.clientes', context: context);

  @override
  List<ClienteModel> get clientes {
    _$clientesAtom.reportRead();
    return super.clientes;
  }

  @override
  set clientes(List<ClienteModel> value) {
    _$clientesAtom.reportWrite(value, super.clientes, () {
      super.clientes = value;
    });
  }

  late final _$getClientesAsyncAction =
      AsyncAction('_ClientesStoreBase.getClientes', context: context);

  @override
  Future<void> getClientes() {
    return _$getClientesAsyncAction.run(() => super.getClientes());
  }

  late final _$_ClientesStoreBaseActionController =
      ActionController(name: '_ClientesStoreBase', context: context);

  @override
  void increment() {
    final _$actionInfo = _$_ClientesStoreBaseActionController.startAction(
        name: '_ClientesStoreBase.increment');
    try {
      return super.increment();
    } finally {
      _$_ClientesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setClientes(dynamic value) {
    final _$actionInfo = _$_ClientesStoreBaseActionController.startAction(
        name: '_ClientesStoreBase.setClientes');
    try {
      return super.setClientes(value);
    } finally {
      _$_ClientesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
clientes: ${clientes}
    ''';
  }
}
