import 'package:advanced_datatable/advanced_datatable_source.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sys_venda/app/core/repositories/client_repository.dart';
import 'package:sys_venda/app/core/widgets/drawer_widget.dart';
import 'package:sys_venda/app/core/widgets/textfield_default.dart';
import 'package:sys_venda/app/modules/clientes/clientes_store.dart';
import 'package:advanced_datatable/datatable.dart';
import 'package:flutter/material.dart';
import 'package:sys_venda/app/modules/clientes/example_souce.dart';

class ClientesPage extends StatefulWidget {
  final String title;
  const ClientesPage({Key? key, this.title = 'ClientesPage'}) : super(key: key);
  @override
  ClientesPageState createState() => ClientesPageState();
}

class ClientesPageState extends State<ClientesPage> {
  final ClientesStore store = Modular.get();

  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerCPF = TextEditingController();
  TextEditingController controllerLimite = TextEditingController();
  TextEditingController controllerCC = TextEditingController();

  TextEditingController controllerENome = TextEditingController();
  TextEditingController controllerECPF = TextEditingController();
  TextEditingController controllerELimite = TextEditingController();
  TextEditingController controllerECC = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  ClienteSource? source;

  Future<void> getClientes() async {
    await store.getClientes();

    if (store.clientes.isNotEmpty) {
      setState(() {
        source = ClienteSource(clientes: store.clientes, context: context);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getClientes();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Clientes"),
      ),
      drawer: const DrawerWidget(),
      body: Observer(builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: source != null
              ? AdvancedPaginatedDataTable(
                  rowsPerPage: AdvancedPaginatedDataTable.defaultRowsPerPage,
                  columns: const [
                    DataColumn(
                      label: Text('ID',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                    DataColumn(
                      label: Text('Nome do Cliente',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                    DataColumn(
                      label: Text('CPF',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                    DataColumn(
                      label: Text(
                        'CC',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Limite',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Ações',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                  source: source!,
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          CoolAlert.show(
              confirmBtnText: "Criar",
              context: context,
              type: CoolAlertType.custom,
              widget: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(
                        child: Text(
                      "Cadastrar Cliente",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldDefault(
                        controller: controllerNome,
                        onChanged: (value) {},
                        validator: (value) {
                          return null;
                        },
                        prefixIcon: const Icon(Icons.person),
                        hintText: "Nome",
                        obscureText: false,
                        inputType: TextInputType.text),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldDefault(
                        controller: controllerCPF,
                        onChanged: (value) {},
                        validator: (value) {
                          return null;
                        },
                        prefixIcon: const Icon(Icons.https),
                        hintText: "CPF",
                        obscureText: false,
                        inputType: TextInputType.number),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldDefault(
                        controller: controllerLimite,
                        onChanged: (value) {},
                        validator: (value) {
                          return null;
                        },
                        prefixIcon: const Icon(Icons.money_off),
                        hintText: "Limite",
                        obscureText: false,
                        inputType: TextInputType.text),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldDefault(
                        controller: controllerCC,
                        onChanged: (value) {},
                        validator: (value) {
                          return null;
                        },
                        prefixIcon: const Icon(Icons.money_off),
                        hintText: "CC",
                        obscureText: false,
                        inputType: TextInputType.text),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              onConfirmBtnTap: () async {
                bool create = await ClienteRepository().createClient(
                    controllerNome.text,
                    controllerCPF.text,
                    double.parse(controllerCC.text),
                    double.parse(controllerLimite.text));

                if (create) {
                  Modular.to.pop();
                  CoolAlert.show(
                      context: context,
                      type: CoolAlertType.success,
                      title: "Sucesso",
                      text: "Cliente Cadastrado com sucesso");

                  Modular.to.pushNamed('/clientes');
                } else {
                  Modular.to.pop();
                  CoolAlert.show(
                      context: context,
                      type: CoolAlertType.error,
                      title: "Falha",
                      text: "Ocorreu uma falha ao cadastrar o cliente");
                }
              });
        },
      ),
    ));
  }
}
