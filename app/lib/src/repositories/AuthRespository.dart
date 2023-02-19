import 'package:sqflite/sqflite.dart';
import 'package:templates/src/models/UtilizadorModel.dart';
import 'package:templates/src/models/DatabaseHelper.dart';

class AuthRepository {
  final dbHelper = DatabaseHelper.instance;
  final dbTable = "utilizador";

  Future<List<UtilizadorModel>> buscarTudo() async {
    final maps = await dbHelper.query(dbTable);

    return List.generate(maps.length, (i) {
      return UtilizadorModel(
        id: maps[i]['id'],
        nome: maps[i]['nome'],
        pin: maps[i]['pin'],
        tipo: maps[i]['tipo'],
      );
    });
  }

  Future<UtilizadorModel?> buscarUm(int id) async {
    final db = await dbHelper.database;

    final maps = await db.query(
      dbTable,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return UtilizadorModel(
        id: maps.first['id'] as int,
        nome: maps.first['nome'] as String,
        pin: maps.first['pin'] as int,
        tipo: maps.first['tipo'] as String,
      );
    }

    return null;
  }

  Future<int> adicionar(UtilizadorModel task) async {
    final db = await dbHelper.database;

    return db.insert(
      dbTable,
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> atualizar(UtilizadorModel task) async {
    final db = await dbHelper.database;

    return await db.update(
      dbTable,
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<int> eliminar(int id) async {
    final db = await dbHelper.database;

    return await db.delete(
      dbTable,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
