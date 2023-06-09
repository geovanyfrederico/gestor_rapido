import 'package:gr/models/modelo_global.dart';
import 'package:sqflite/sqflite.dart';

import 'database_helper.dart';

class ClienteModel extends ModeloGlobal {
  static String get tabela => 'cliente';
  late final int? id;
  late final String nome;
  late final String? endereco;
  late final String? telefone;
  late final String nif;
  //List<VendaModel> vendas = [];
  ClienteModel(
      {this.id,
        required this.nome,
        required this.nif,
        this.endereco,
        this.telefone});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'telefone': telefone,
      'nif': nif,
      'endereco': endereco,
    };
  }

  factory ClienteModel.fromMap(Map<String, dynamic> map) {
    return ClienteModel(
      id: map['id'],
      nome: map['nome'],
      endereco: map['endereco'],
      nif: map['nif'],
      telefone: map['telefone'],
    );
  }
  Future<int> salvar() async {
    Database db = await DatabaseHelper.instance.database;
    return db.insert('cliente', toMap());
  }

// exclui um registro do banco de dados
  static Future<int> eliminar(int? id) async {
    Database db = await DatabaseHelper.instance.database;
    await  db.execute("PRAGMA foreign_keys=ON");
    return await db.delete(tabela, where: 'id = ?', whereArgs: [id]);
  }

  static Future<ClienteModel> findOneById(int id) async {
    Database db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> maps = await db.query(
      tabela,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return ClienteModel.fromMap(maps.first);
    }
    throw Exception("Não foi possivel encontrar este cliente");
  }

  static Future<List<ClienteModel>> index() async {
    Database db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> maps =
    await db.query('cliente', orderBy: 'id DESC');

    return List.generate(maps.length, (index) {
      return ClienteModel.fromMap(maps[index]);
    });
  }

  static Future<List<ClienteModel>> search(String search) async {
    Database db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> maps = await db.query('cliente',
        orderBy: 'id DESC',
        where: 'nome LIKE ? OR nif LIKE ?',
        whereArgs: ['%$search%', '%$search%']);
    return List.generate(maps.length, (index) {
      return ClienteModel.fromMap(maps[index]);
    });
  }

}
