import 'package:sys_venda/app/core/models/cliente_model.dart';

abstract class ClientInterface {
  Future<bool> createClient(String nome, String cpf, double cc, double limite);

  Future<bool> deleteClient(int id);

  Future<bool> updateClient(
      int id, String nome, String cpf, double cc, double limite);

  Future<List<ClienteModel>> getAllClients();

  Future<ClienteModel> getClientForId(int id);
}
