// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sys_venda/app/core/config/api_service.dart';
import 'package:sys_venda/app/core/interfaces/client_interface.dart';
import 'package:sys_venda/app/core/models/cliente_model.dart';

class ClienteRepository implements ClientInterface {
  Dio dio = Dio();

  @override
  Future<bool> createClient(
      String nome, String cpf, double cc, double limite) async {
    bool success = false;

    ClienteModel clienteModel =
        ClienteModel(nome: nome, cc: cc, cpf: cpf, limite: limite);

    print(jsonEncode(clienteModel.toJson()));

    var response =
        await dio.post(ApiService.CREATE_CLIENT, data: clienteModel.toJson());

    if (response.statusCode == 200) {
      print(response.data);
      if (response.data["message"] == "cliente Cadastrado com sucesso") {
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
  Future<bool> deleteClient(int id) async {
    bool success = false;

    ClienteModel clienteModel = ClienteModel(id: id);

    var response =
        await dio.post(ApiService.DELETE_CLIENT, data: clienteModel.toJson());

    if (response.statusCode == 200) {
      print(response.data);
      if (response.data["message"] == "cliente deletado com sucesso") {
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
  Future<List<ClienteModel>> getAllClients() async {
    List<ClienteModel> clientes = [];

    var response = await dio.post(ApiService.GET_ALL_CLIENTS);

    if (response.statusCode == 200) {
      var pp = response.data["result"] as List;

      print(jsonEncode(response.data));
      clientes = pp.map((json) => ClienteModel.fromJson(json)).toList();
    } else {
      clientes = [];
    }

    return clientes;
  }

  @override
  Future<ClienteModel> getClientForId(int id) async {
    ClienteModel clienteModel = ClienteModel(id: id);

    var response = await dio.post(ApiService.GET_CLIENT_FOR_ID,
        data: clienteModel.toJson());

    if (response.statusCode == 200) {
      print(jsonEncode(response.data));

      if (response.data["message"] == "cliente Encontrado") {
        clienteModel = ClienteModel.fromJson(response.data["result"][0]);
      } else {
        clienteModel.id = 0;
      }
    } else {
      clienteModel.id = 0;
    }

    return clienteModel;
  }

  @override
  Future<bool> updateClient(
      int id, String nome, String cpf, double cc, double limite) async {
    bool success = false;

    var data =
        ClienteModel(id: id, nome: nome, cpf: cpf, cc: cc, limite: limite)
            .toJson();

    print(data);

    var response = await dio.post(ApiService.UPDATE_CLIENT, data: data);

    if (response.statusCode == 200) {
      if (response.data["message"] == "cliente editado com sucesso") {
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
