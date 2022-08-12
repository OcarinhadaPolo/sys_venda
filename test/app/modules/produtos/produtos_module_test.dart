import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sys_venda/app/modules/produtos/produtos_module.dart';

void main() {
  setUpAll(() {
    initModule(ProdutosModule());
  });
}
