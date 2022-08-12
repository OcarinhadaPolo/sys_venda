// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sys_venda/app/core/config/api_service.dart';
import 'package:sys_venda/app/core/interfaces/product_interface.dart';
import 'package:sys_venda/app/core/models/produto_model.dart';

class ProdutoRepository implements ProdutoInterface {
  Dio dio = Dio();

  @override
  Future<bool> createProduct(String nome, double preco, String unidade) async {
    bool success = false;

    ProdutoModel produtoModel =
        ProdutoModel(nome: nome, preco: preco, unidade: unidade);

    var response =
        await dio.post(ApiService.CREATE_PRODUCT, data: produtoModel.toJson());

    if (response.statusCode == 200) {
      print(response.data);
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
  Future<bool> deleteProduct(int id) async {
    bool success = false;

    ProdutoModel produtoModel = ProdutoModel(id: id);

    var response =
        await dio.post(ApiService.DELETE_PRODUCT, data: produtoModel.toJson());

    if (response.statusCode == 200) {
      print(response.data);
      if (response.data["message"] == "Produto deletado com sucesso") {
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
  Future<List<ProdutoModel>> getAllProducts() async {
    List<ProdutoModel> produtos = [];

    var response = await dio.post(ApiService.GET_ALL_PRODUCTS);

    if (response.statusCode == 200) {
      var pp = response.data["result"] as List;

      print(jsonEncode(response.data));
      produtos = pp.map((json) => ProdutoModel.fromJson(json)).toList();
    } else {
      produtos = [];
    }

    return produtos;
  }

  @override
  Future<ProdutoModel> getProductForId(int id) async {
    ProdutoModel produtoModel = ProdutoModel(id: id);

    var response = await dio.post(ApiService.GET_PRODUCT_FOR_ID,
        data: produtoModel.toJson());

    if (response.statusCode == 200) {
      print(jsonEncode(response.data));

      if (response.data["message"] == "Produto Encontrado") {
        produtoModel = ProdutoModel.fromJson(response.data["result"][0]);
      } else {
        produtoModel.id = 0;
      }
    } else {
      produtoModel.id = 0;
    }

    return produtoModel;
  }

  @override
  Future<bool> updateProduct(
      int id, String nome, double preco, String unidade) async {
    bool success = false;

    var data = ProdutoModel(nome: nome, id: id, preco: preco, unidade: unidade)
        .toJson();

    var response = await dio.post(ApiService.UPDATE_PRODUCT, data: data);

    if (response.statusCode == 200) {
      if (response.data["message"] == "Produto editado com sucesso") {
        success = true;
      } else {
        success = false;
      }
    } else {
      success = false;
    }

    return success;
  }
}
