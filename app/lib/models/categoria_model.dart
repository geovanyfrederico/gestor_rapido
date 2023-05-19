import 'package:gr/models/modelo_global.dart';
import 'package:sqflite/sqflite.dart';
import 'database_helper.dart';

class CategoriasModel extends ModeloGlobal {
  static String get tabela => 'categoria';
  late int? id;
  late final String nome;

  CategoriasModel({
    this.id,
    required this.nome,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
    };
  }

  factory CategoriasModel.fromMap(Map<String, dynamic> map) {
    return CategoriasModel(
      id: map['id'],
      nome: map['nome'],
    );
  }
  static Future<List<CategoriasModel>> index() async {
    Database db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> maps =
        await db.query('categoria', orderBy: 'id DESC');
    return List.generate(maps.length, (index) {
      return CategoriasModel(
        id: maps[index]['id'],
        nome: maps[index]['nome'],
      );
    });
  }

  Future<int> salvar() async {
    Database db = await DatabaseHelper.instance.database;
    return db.insert('categoria', toMap());
  }

// exclui um registro do banco de dados
  static Future<int> eliminar(int? id) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.delete(tabela, where: 'id = ?', whereArgs: [id]);
  }
}
