import 'package:mobx/mobx.dart';
import 'package:sys_venda/app/core/models/cliente_model.dart';
import 'package:sys_venda/app/core/repositories/client_repository.dart';

part 'clientes_store.g.dart';

class ClientesStore = _ClientesStoreBase with _$ClientesStore;

abstract class _ClientesStoreBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  @observable
  List<ClienteModel> clientes = [];

  @action
  void setClientes(value) => clientes = value;

  @action
  Future<void> getClientes() async {
    List<ClienteModel> clientesAux = await ClienteRepository().getAllClients();

    if (clientesAux.isNotEmpty) {
      setClientes(clientesAux);
    }
  }
}
