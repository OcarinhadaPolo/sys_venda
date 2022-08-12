// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produtos_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProdutosStore on _ProdutosStoreBase, Store {
  late final _$valueAtom =
      Atom(name: '_ProdutosStoreBase.value', context: context);

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

  late final _$produtosAtom =
      Atom(name: '_ProdutosStoreBase.produtos', context: context);

  @override
  List<ProdutoModel> get produtos {
    _$produtosAtom.reportRead();
    return super.produtos;
  }

  @override
  set produtos(List<ProdutoModel> value) {
    _$produtosAtom.reportWrite(value, super.produtos, () {
      super.produtos = value;
    });
  }

  late final _$getAllProductsAsyncAction =
      AsyncAction('_ProdutosStoreBase.getAllProducts', context: context);

  @override
  Future<void> getAllProducts() {
    return _$getAllProductsAsyncAction.run(() => super.getAllProducts());
  }

  late final _$_ProdutosStoreBaseActionController =
      ActionController(name: '_ProdutosStoreBase', context: context);

  @override
  void increment() {
    final _$actionInfo = _$_ProdutosStoreBaseActionController.startAction(
        name: '_ProdutosStoreBase.increment');
    try {
      return super.increment();
    } finally {
      _$_ProdutosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProdutos(dynamic value) {
    final _$actionInfo = _$_ProdutosStoreBaseActionController.startAction(
        name: '_ProdutosStoreBase.setProdutos');
    try {
      return super.setProdutos(value);
    } finally {
      _$_ProdutosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
produtos: ${produtos}
    ''';
  }
}
