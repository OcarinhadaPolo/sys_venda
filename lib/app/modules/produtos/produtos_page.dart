import 'package:data_table_2/data_table_2.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sys_venda/app/core/models/produto_model.dart';
import 'package:sys_venda/app/core/widgets/drawer_widget.dart';
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
                                onPressed: (() => print('a')),
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
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}
