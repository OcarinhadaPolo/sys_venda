import 'package:advanced_datatable/advanced_datatable_source.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sys_venda/app/core/models/cliente_model.dart';
import 'package:sys_venda/app/core/repositories/client_repository.dart';
import 'package:sys_venda/app/core/widgets/textfield_default.dart';

class ClienteSource extends AdvancedDataTableSource<ClienteModel> {
  final List<ClienteModel> clientes;
  final BuildContext context;

  TextEditingController controllerENome = TextEditingController();
  TextEditingController controllerECPF = TextEditingController();
  TextEditingController controllerELimite = TextEditingController();
  TextEditingController controllerECC = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  ClienteSource({required this.clientes, required this.context});

  @override
  Future<RemoteDataSourceDetails<ClienteModel>> getNextPage(
      NextPageRequest pageRequest) async {
    await Future.delayed(const Duration(seconds: 2));
    return RemoteDataSourceDetails(
      clientes.length,
      clientes.skip(pageRequest.offset).take(pageRequest.pageSize).toList(),
    );
  }

  @override
  DataRow? getRow(int index) {
    final currentRowData = lastDetails!.rows[index];

    controllerECC.text = currentRowData.cc.toString();
    controllerECPF.text = currentRowData.cpf.toString();
    controllerELimite.text = currentRowData.limite.toString();
    controllerENome.text = currentRowData.nome.toString();

    return DataRow(cells: [
      DataCell(
        Text(currentRowData.id.toString()),
      ),
      DataCell(
        Text(currentRowData.nome.toString()),
      ),
      DataCell(
        Text(currentRowData.cpf.toString()),
      ),
      DataCell(
        Text(currentRowData.cc.toString()),
      ),
      DataCell(
        Text(currentRowData.limite.toString()),
      ),
      DataCell((Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const SizedBox(
          width: 20,
        ),
        IconButton(
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
                          "Editar Cliente",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFieldDefault(
                            controller: controllerENome,
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
                            controller: controllerECPF,
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
                            controller: controllerELimite,
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
                            controller: controllerECC,
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
                    bool create = await ClienteRepository().updateClient(
                        currentRowData.id!,
                        controllerENome.text,
                        controllerECPF.text,
                        double.parse(controllerECC.text),
                        double.parse(controllerELimite.text));

                    if (create) {
                      Modular.to.pop();
                      CoolAlert.show(
                          context: context,
                          type: CoolAlertType.success,
                          title: "Sucesso",
                          text: "Cliente Editado com sucesso");

                      Modular.to.pushNamed('/clientes');
                    } else {
                      Modular.to.pop();
                      CoolAlert.show(
                          context: context,
                          type: CoolAlertType.error,
                          title: "Falha",
                          text: "Ocorreu uma falha ao editar o cliente");
                    }
                  });
            },
            icon: const Icon(
              Icons.edit,
              color: Colors.blue,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ))
      ])))
    ]);
  }

  @override
  int get selectedRowCount => 0;
}
