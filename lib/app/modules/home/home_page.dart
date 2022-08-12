// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sys_venda/app/core/models/cliente_model.dart';
import 'package:sys_venda/app/core/repositories/client_repository.dart';

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
          //bool value = await ClienteRepository()
          // .createClient("Nubia Silveira", "02224121412", 9000, 15000);

          //value = await ClienteRepository().deleteClient(6);

          List<ClienteModel> mo = await ClienteRepository().getAllClients();

          //ClienteModel c = await ClienteRepository().getClientForId(1);

          bool value = await ClienteRepository()
              .updateClient(1, "Bahia 2", "04835063546", 5000, 9000);

          print(value);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
