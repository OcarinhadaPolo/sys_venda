import 'package:sys_venda/app/modules/produtos/produtos_Page.dart';
import 'package:sys_venda/app/modules/produtos/produtos_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProdutosModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProdutosStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const ProdutosPage()),
  ];
}
