import 'package:sys_venda/app/core/models/produto_model.dart';
import 'package:sys_venda/app/core/models/venda_model.dart';

abstract class SaleInterface {
  Future<bool> createSale(int clientId, List<ProdutoModel> products);

  Future<List<VendaModel>> salesForClient(int clientId);
}
