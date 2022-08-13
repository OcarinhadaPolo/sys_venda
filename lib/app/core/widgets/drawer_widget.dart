import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            onTap: () {
              Modular.to.pushNamed('/');
            },
            title: const Text("Home"),
            leading: const Icon(Icons.home),
          ),
          ListTile(
            onTap: () {
              Modular.to.pushNamed('/produtos');
            },
            title: const Text("Produtos"),
            leading: const Icon(Icons.shop_2),
          ),
          ListTile(
            onTap: () {
              Modular.to.pushNamed('/clientes');
            },
            title: const Text("Clientes"),
            leading: const Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
