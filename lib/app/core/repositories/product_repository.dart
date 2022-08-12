import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sys_venda/app/core/config/api_service.dart';
import 'package:sys_venda/app/core/interfaces/product_interface.dart';
import 'package:sys_venda/app/core/models/produto_model.dart';

class ProdutoRepository implements ProdutoInterface {
  late Dio dio = Dio();

  ProdutoRepository() {
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers['Content-type'] = 'application/json';
    dio.options.headers['Access-Control-Allow-Origin'] = '*';
  }

  @override
  Future<bool> createProduct(String nome, double preco, String unidade) async {
    bool success = false;

    ProdutoModel produtoModel =
        ProdutoModel(nome: nome, preco: preco, unidade: unidade);

    var response =
        await dio.post(ApiService.CREATE_PRODUCT, data: produtoModel.toJson());

    if (response.statusCode == 200) {
      if (response.data["message"] == "Produto Cadastrado com sucesso") {
        success = true;
      } else {
        success = false;
      }
    } else {
      success = false;
    }

    return success;
  }

  @override
  Future<bool> deleteProduct(int id) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<List<ProdutoModel>> getAllProducts() {
    // TODO: implement getAllProducts
    throw UnimplementedError();
  }

  @override
  Future<ProdutoModel> getProductForId(int id) {
    // TODO: implement getProductForId
    throw UnimplementedError();
  }

  @override
  Future<bool> updateProduct(
      int id, String nome, double preco, String unidade) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }
}
