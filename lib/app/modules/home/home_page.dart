// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sys_venda/app/core/models/produto_model.dart';
import 'package:sys_venda/app/core/repositories/product_repository.dart';
import 'package:sys_venda/app/modules/home/home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeStore store = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Observer(
        builder: (context) => Text('${store.counter}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool value = await ProdutoRepository()
              .updateProduct(6, "Lata de Tinta Bigó - 5L", 100, "L");

          List<ProdutoModel> p = await ProdutoRepository().getAllProducts();

          ProdutoModel pp = await ProdutoRepository().getProductForId(6);

          if (pp.id == 0) {
            print("vazia fiii");
          } else {
            print("tu é foda meu: ${pp.nome}");
          }

          if (p.isEmpty) {
            print("vazia fiii");
          } else {
            print("tu é foda");
          }

          if (value) {
            print("foi foi foi");
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
