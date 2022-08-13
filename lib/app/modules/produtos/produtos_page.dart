import 'package:cool_alert/cool_alert.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sys_venda/app/core/models/produto_model.dart';
import 'package:sys_venda/app/core/repositories/product_repository.dart';
import 'package:sys_venda/app/core/widgets/drawer_widget.dart';
import 'package:sys_venda/app/core/widgets/textfield_default.dart';
import 'package:sys_venda/app/modules/produtos/produtos_store.dart';
import 'package:flutter/material.dart';

class ProdutosPage extends StatefulWidget {
  final String title;
  const ProdutosPage({Key? key, this.title = 'ProdutosPage'}) : super(key: key);
  @override
  ProdutosPageState createState() => ProdutosPageState();
}

class ProdutosPageState extends State<ProdutosPage> {
  final ProdutosStore store = Modular.get();

  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerPreco = TextEditingController();
  TextEditingController controllerUnidade = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    getProdutos();
  }

  Future<void> getProdutos() async {
    await store.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Produtos"),
        ),
        drawer: const DrawerWidget(),
        body: Observer(builder: (context) {
          return Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: store.produtos.isNotEmpty
                ? DataTable2(
                    columnSpacing: 12,
                    horizontalMargin: 12,
                    minWidth: 600,
                    columns: const [
                      DataColumn(
                        label: Text('ID',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                      DataColumn2(
                          label: Text('Nome do Produto',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          size: ColumnSize.L),
                      DataColumn(
                        label: Text('Preço (R\$)',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                      DataColumn(
                        label: Text(
                          'Unidade de Medida',
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
                    rows:
                        List<DataRow>.generate(store.produtos.length, (index) {
                      ProdutoModel produto = store.produtos[index];
                      return DataRow(cells: [
                        DataCell(Text(produto.id.toString())),
                        DataCell(Text(produto.nome!)),
                        DataCell(Text(produto.preco!.toStringAsFixed(2))),
                        DataCell(Text(produto.unidade!)),
                        DataCell(Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            IconButton(
                                onPressed: (() => print('a')),
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.blue,
                                )),
                            IconButton(
                                onPressed: () async {
                                  await CoolAlert.show(
                                      context: context,
                                      type: CoolAlertType.confirm,
                                      text:
                                          "Deseja mesmo excluir esse registro",
                                      title: "Atenção",
                                      cancelBtnText: "Não",
                                      confirmBtnText: "Sim, Excluir",
                                      onConfirmBtnTap: () async {
                                        bool delete = await ProdutoRepository()
                                            .deleteProduct(produto.id!);

                                        if (delete) {
                                          Modular.to.pop();
                                          CoolAlert.show(
                                              context: context,
                                              type: CoolAlertType.success,
                                              title: "Sucesso",
                                              text:
                                                  "Produto Eliminado com sucesso");

                                          store.getAllProducts();
                                        } else {
                                          Modular.to.pop();
                                          CoolAlert.show(
                                              context: context,
                                              type: CoolAlertType.error,
                                              title: "Falha",
                                              text:
                                                  "Ocorreu uma falha ao eliminar o produto");
                                        }
                                      },
                                      onCancelBtnTap: () {
                                        Modular.to.pop();
                                      });
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ))
                          ],
                        ))
                      ]);
                    }))
                : const Center(child: CircularProgressIndicator()),
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
                        "Cadastrar Produto",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFieldDefault(
                          controller: controllerNome,
                          onChanged: (value) {},
                          validator: (value) {},
                          prefixIcon: const Icon(Icons.person),
                          hintText: "Nome",
                          obscureText: false,
                          inputType: TextInputType.text),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFieldDefault(
                          controller: controllerPreco,
                          onChanged: (value) {},
                          validator: (value) {},
                          prefixIcon: const Icon(Icons.money),
                          hintText: "Preço",
                          obscureText: false,
                          inputType: TextInputType.number),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFieldDefault(
                          controller: controllerUnidade,
                          onChanged: (value) {},
                          validator: (value) {},
                          prefixIcon: const Icon(Icons.numbers),
                          hintText: "Unidade",
                          obscureText: false,
                          inputType: TextInputType.text),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                onConfirmBtnTap: () async {
                  bool create = await ProdutoRepository().createProduct(
                      controllerNome.text,
                      double.parse(controllerPreco.text),
                      controllerUnidade.text);

                  if (create) {
                    Modular.to.pop();
                    CoolAlert.show(
                        context: context,
                        type: CoolAlertType.success,
                        title: "Sucesso",
                        text: "Produto Cadastrado com sucesso");

                    store.getAllProducts();
                  } else {
                    Modular.to.pop();
                    CoolAlert.show(
                        context: context,
                        type: CoolAlertType.error,
                        title: "Falha",
                        text: "Ocorreu uma falha ao cadastrar o produto");
                  }
                });
          },
        ),
      ),
    );
  }
}
