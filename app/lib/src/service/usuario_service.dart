
import 'package:sqflite/sqflite.dart';
import 'package:gr/src/models/database_helper.dart';
import 'package:gr/src/models/usuario_model.dart';

class UsuarioService{
  static Future<UsuarioModel?> login(String nome, String pin) async {
    Database db = await DatabaseHelper.instance.database;

    // busca todos os usuários
    List<Map<String, dynamic>> allUsers = await db.query('usuario');
    for (var user in allUsers) {
      print("${user['nome']}, PIN: ${user['pin']}, TIPO: ${user['tipo']}");
    }
    List<Map<String, dynamic>> results = await db.query(
      'usuario',
      where: "telefone = ? AND pin = ?",
      whereArgs: [nome, pin],
    );

    if (results.isNotEmpty) {
      return UsuarioModel.fromMap(results.first);
    }
    return null;
  }
}
