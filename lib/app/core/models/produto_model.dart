class ProdutoModel {
  int? id;
  String? nome;
  double? preco;
  String? unidade;

  ProdutoModel({this.id, this.nome, this.preco, this.unidade});

  ProdutoModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    nome = json['nome'];
    preco = double.parse(json['preco']);
    unidade = json['unidade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['preco'] = preco;
    data['unidade'] = unidade;
    return data;
  }
}
