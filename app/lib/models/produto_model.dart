import 'package:sqflite/sqflite.dart';

import 'database_helper.dart';

class ProdutoModel {
  static String get tabela => 'produto';
  int? id;
  String codigo;
  String nome;
  double preco;
  String? foto;
  int stock;
  // List <MovimentoDeStockModel>  movimentoDeStocks;
  // List <ProdutoNaCompra>  produtoNaCompras;
  // List <ProdutoNaVenda>  produtoNaVendas;
  ProdutoModel({
    this.id,
    required this.nome,
    required this.codigo,
    required this.preco,
    required this.stock,
    this.foto,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'codigo': codigo,
      'preco': preco,
      'foto': foto,
      'stock': stock,
    };
  }

  factory ProdutoModel.fromMap(Map<String, dynamic> map) {
    return ProdutoModel(
        id: map['id'],
        nome: map['nome'],
        codigo: map['codigo'],
        preco: map['preco'],
        foto: map['foto'],
        stock: map['stock']);
  }
  static Future<List<ProdutoModel>> index() async {
    Database db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> maps =
        await db.query('produto', orderBy: 'id DESC');
    return List.generate(maps.length, (index) {
      return ProdutoModel(
          id: maps[index]['id'],
          nome: maps[index]['nome'],
          preco: maps[index]['preco'],
          codigo: maps[index]['codigo'],
          stock: maps[index]['stock']);
    });
  }

  Future<int> salvar() async {
    Database db = await DatabaseHelper.instance.database;
    return db.insert(tabela, toMap());
  }

  static Future<int> eliminar(int id) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.delete(tabela, where: 'id = ?', whereArgs: [id]);
  }

  static Future<List<ProdutoModel>> search(String search) async {
    Database db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> maps = await db.query('produto',
        orderBy: 'id DESC',
        where: 'codigo LIKE ? OR nome LIKE ?',
        whereArgs: ['%$search%', '%$search%']);
    return List.generate(maps.length, (index) {
      return ProdutoModel(
        id: maps[index]['id'],
        nome: maps[index]['nome'],
        preco: maps[index]['preco'],
        codigo: maps[index]['codigo'],
        stock: maps[index]['stock'],
      );
    });
  }
}
