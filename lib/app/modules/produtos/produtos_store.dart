// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:sys_venda/app/core/models/produto_model.dart';
import 'package:sys_venda/app/core/repositories/product_repository.dart';

part 'produtos_store.g.dart';

class ProdutosStore = _ProdutosStoreBase with _$ProdutosStore;

abstract class _ProdutosStoreBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  @observable
  List<ProdutoModel> produtos = [];

  @action
  void setProdutos(value) => produtos = value;

  @action
  Future<void> getAllProducts() async {
    List<ProdutoModel> produtosAux = await ProdutoRepository().getAllProducts();

    if (produtosAux.isNotEmpty) {
      setProdutos(produtosAux);
    }
  }
}
