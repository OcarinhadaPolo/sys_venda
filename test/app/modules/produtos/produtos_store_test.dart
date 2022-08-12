import 'package:flutter_test/flutter_test.dart';
import 'package:sys_venda/app/modules/produtos/produtos_store.dart';
 
void main() {
  late ProdutosStore store;

  setUpAll(() {
    store = ProdutosStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}