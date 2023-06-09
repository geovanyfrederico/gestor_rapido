import 'package:gr/models/produto_model.dart';
import 'package:sqflite/sqflite.dart';

import '../core/utils/mat.dart';
import 'database_helper.dart';

class ProdutoNaVendaModel {
  int? id;
  int? produtoId;
  int totalQtd;
  String nome;
  double preco;
  double precoTotal;
  ProdutoModel? produto;
  int? vendaId;
  ProdutoNaVendaModel(
      { this.id,
        required this.produtoId,
        required this.totalQtd,
        required this.nome,
        required this.preco,
        required this.precoTotal,
        this.produto,
        this.vendaId
      });

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
      'totalQtd': totalQtd,
      'vendaId':vendaId
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
        totalQtd: map['totalQtd'],
        nome: map['nome'],
        preco: map['preco'],
        precoTotal: map['precoTotal'],
        produto: map['produto']);
  }

  void addQtd() {
    totalQtd++;
    precoTotal = preco * totalQtd;
  }

  void removeQtd() {
    totalQtd--;
    precoTotal = preco * totalQtd;
  }
  Future<int?> salvar() async {
    Database db = await DatabaseHelper.instance.database;
    return db.insert('produtoNaVenda', toMap());
  }

 static Future<List<ProdutoNaVendaModel>> findAllByVendaId(int id) async{
    Database db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> maps = await db.query('produtoNaVenda',
        orderBy: 'id DESC',
        where: 'vendaId = ?',
        whereArgs: [id]);
    return List.generate(maps.length, (index) {
      return ProdutoNaVendaModel.fromMap(maps[index]);
    });

  }
}
