import 'package:sys_venda/app/core/models/produto_model.dart';

abstract class ProdutoInterface {
  Future<bool> createProduct(String nome, double preco, String unidade);

  Future<bool> deleteProduct(int id);

  Future<bool> updateProduct(int id, String nome, double preco, String unidade);

  Future<List<ProdutoModel>> getAllProducts();

  Future<ProdutoModel> getProductForId(int id);
}
