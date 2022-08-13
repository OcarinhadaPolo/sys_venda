import 'package:sys_venda/app/modules/clientes/clientes_Page.dart';
import 'package:sys_venda/app/modules/clientes/clientes_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ClientesModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ClientesStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ClientesPage()),
  ];
}
