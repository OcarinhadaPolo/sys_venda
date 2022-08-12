class VendaModel {
  int? id;
  int? clienteId;
  String? dataEHora;
  double? total;
  double? descontoTotal;
  int? vendaId;
  int? produtoId;
  int? quantidade;
  double? precoNaVenda;
  double? desconto;
  String? nome;
  double? preco;
  String? unidade;

  VendaModel(
      {this.id,
      this.clienteId,
      this.dataEHora,
      this.total,
      this.descontoTotal,
      this.vendaId,
      this.produtoId,
      this.quantidade,
      this.precoNaVenda,
      this.desconto,
      this.nome,
      this.preco,
      this.unidade});

  VendaModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    clienteId = int.parse(json['cliente_id']);
    dataEHora = json['data_e_hora'];
    total = double.parse(json['total']);
    descontoTotal = double.parse(json['desconto_total']);
    vendaId = int.parse(json['venda_id']);
    produtoId = int.parse(json['produto_id']);
    quantidade = int.parse(json['quantidade']);
    precoNaVenda = double.parse(json['preco_na_venda']);
    desconto = double.parse(json['desconto']);
    nome = json['nome'];
    preco = double.parse(json['preco']);
    unidade = json['unidade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cliente_id'] = clienteId;
    data['data_e_hora'] = dataEHora;
    data['total'] = total;
    data['desconto_total'] = descontoTotal;
    data['venda_id'] = vendaId;
    data['produto_id'] = produtoId;
    data['quantidade'] = quantidade;
    data['preco_na_venda'] = precoNaVenda;
    data['desconto'] = desconto;
    data['nome'] = nome;
    data['preco'] = preco;
    data['unidade'] = unidade;
    return data;
  }
}
