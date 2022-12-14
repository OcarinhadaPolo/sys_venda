import 'package:flutter_modular/flutter_modular.dart';
import 'package:sys_venda/app/modules/clientes/clientes_module.dart';
import 'package:sys_venda/app/modules/produtos/produtos_module.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute('/', module: HomeModule()),
    ModuleRoute('/produtos', module: ProdutosModule()),
    ModuleRoute('/clientes', module: ClientesModule())
  ];
}
