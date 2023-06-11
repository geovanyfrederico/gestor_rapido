import 'package:gr/models/produto_model.dart';
import 'package:sqflite/sqflite.dart';

import '../core/utils/mat.dart';
import 'database_helper.dart';

class ProdutoNaCompraModel {
  int? id;
  int? produtoId;
  int totalQtd;
  String nome;
  double preco;
  double precoTotal;
  ProdutoModel? produto;
  int? compraId;
  ProdutoNaCompraModel(
      { this.id,
        required this.produtoId,
        required this.totalQtd,
        required this.nome,
        required this.preco,
        required this.precoTotal,
        this.produto,
        this.compraId
      });

  // List <MovimentoDeStockModel>  movimentoDeStocks;
  // List <ProdutoNaCompra>  produtoNaCompras;
  // List <ProdutoNaVenda>  produtoNaCompras;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'preco': preco,
      'produtoId': produtoId,
      'precoTotal': precoTotal,
      'totalQtd': totalQtd,
      'compraId':compraId
    };
  }

  String precoToMoney() {
    return Mat.numeroParaDinheiro(preco);
  }

  String precoTotalToMoney() {
    return Mat.numeroParaDinheiro(precoTotal);
  }

  factory ProdutoNaCompraModel.fromMap(Map<String, dynamic> map) {

    return ProdutoNaCompraModel(
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
    return db.insert('produtoNaCompra', toMap());
  }

 static Future<List<ProdutoNaCompraModel>> findAllByVendaId(int id) async{
    Database db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> maps = await db.query('produtoNaCompra',
        orderBy: 'id DESC',
        where: 'compraId = ?',
        whereArgs: [id]);
    return List.generate(maps.length, (index) {
      return ProdutoNaCompraModel.fromMap(maps[index]);
    });

  }
}
