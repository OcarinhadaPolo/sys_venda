// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sys_venda/app/core/config/api_service.dart';
import 'package:sys_venda/app/core/interfaces/sale_interface.dart';
import 'package:sys_venda/app/core/models/venda_model.dart';
import 'package:sys_venda/app/core/models/produto_model.dart';

class VendaRepository implements SaleInterface {
  Dio dio = Dio();

  @override
  Future<bool> createSale(int clientId, List<ProdutoModel> products) async {
    bool success = false;

    var data = {
      "cliente": clientId,
      "products": products.map((p) => p.toJson()).toList()
    };

    print(jsonEncode(data));

    var response = await dio.post(ApiService.CREATE_SALE, data: data);

    if (response.statusCode == 200) {
      print(response.data);
      if (response.data["message"] == "Sucesso ao criar a venda") {
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
  Future<List<VendaModel>> salesForClient(int clientId) async {
    List<VendaModel> vendas = [];

    var response = await dio
        .post(ApiService.GET_SALES_FOR_CLIENT, data: {"cliente": clientId});

    if (response.statusCode == 200) {
      var pp = response.data["result"] as List;

      print(jsonEncode(response.data));
      vendas = pp.map((json) => VendaModel.fromJson(json)).toList();
    } else {
      vendas = [];
    }

    return vendas;
  }
}
