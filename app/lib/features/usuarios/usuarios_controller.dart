import 'package:flutter/cupertino.dart';
import 'package:gr/models/database_helper.dart';
import 'package:gr/models/usuario_model.dart';
import 'package:sqflite/sqflite.dart';


class UsuariosController  extends ChangeNotifier{

  var  usuarios = <UsuarioModel>[];
  var loading = false;
  final filtro = TextEditingController();

  Future<List<UsuarioModel>> buscarUsuarios() async {
    Database db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> maps = await db.query('usuario', orderBy: 'id DESC');
    return List.generate(maps.length, (index) {
      return UsuarioModel(
        id: maps[index]['id'],
        nome: maps[index]['nome'],
        telefone: maps[index]['telefone'],
        pin: maps[index]['pin'],
        tipo: maps[index]['tipo'],
      );
    });
  }
  Future<bool> eliminar(id) async {
    UsuarioModel.eliminar(id);
    return true;
  }

}
