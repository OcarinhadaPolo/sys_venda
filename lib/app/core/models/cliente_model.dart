class ClienteModel {
  int? id;
  String? nome;
  String? cpf;
  double? cc;
  double? limite;

  ClienteModel({this.id, this.nome, this.cpf, this.cc, this.limite});

  ClienteModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    nome = json['nome'];
    cpf = json['cpf'];
    cc = double.parse(json['cc']);
    limite = double.parse(json['limite']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['cpf'] = cpf;
    data['cc'] = cc;
    data['limite'] = limite;
    return data;
  }
}
