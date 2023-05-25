import 'package:gr/models/produto_model.dart';

import '../core/utils/mat.dart';

class ProdutoNaVendaModel {
  int? id;
  int? produtoId;
  int qtd;
  String nome;
  double preco;
  double precoTotal;
  ProdutoModel? produto;
  ProdutoNaVendaModel(
      {this.id,
      required this.produtoId,
      required this.qtd,
      required this.nome,
      required this.preco,
      required this.precoTotal,
      this.produto});

  // List <MovimentoDeStockModel>  movimentoDeStocks;
  // List <ProdutoNaCompra>  produtoNaCompras;
  // List <ProdutoNaVenda>  produtoNaVendas;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'preco': preco,
      'produtoId': produtoId,
      'precoTotal': precoTotal,
      'qtd': qtd,
    };
  }

  String precoToMoney() {
    return Mat.numeroParaDinheiro(preco);
  }

  String precoTotalToMoney() {
    return Mat.numeroParaDinheiro(precoTotal);
  }

  factory ProdutoNaVendaModel.fromMap(Map<String, dynamic> map) {
    return ProdutoNaVendaModel(
        id: map['id'],
        produtoId: map['produtoId'],
        qtd: map['qtd'],
        nome: map['nome'],
        preco: map['preco'],
        precoTotal: map['precoTotal'],
        produto: map['produto']);
  }

  void addQtd() {
    qtd++;
    precoTotal = preco * qtd;
  }

  void removeQtd() {
    qtd--;
    precoTotal = preco * qtd;
  }
}
