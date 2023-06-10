import 'package:flutter/cupertino.dart';
import 'package:gr/models/database_helper.dart';
import 'package:gr/models/utilizador_model.dart';
import 'package:sqflite/sqflite.dart';


class UtilizadorsController  extends ChangeNotifier{

  var  utilizadores = <UtilizadorModel>[];
  var loading = false;
  final filtro = TextEditingController();

  Future<List<UtilizadorModel>> buscarUtilizadors() async {
    Database db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> maps = await db.query('utilizador', orderBy: 'id DESC');
    return List.generate(maps.length, (index) {
      return UtilizadorModel(
        id: maps[index]['id'],
        nome: maps[index]['nome'],
        telefone: maps[index]['telefone'],
        pin: maps[index]['pin'],
        tipo: maps[index]['tipo'],
      );
    });
  }
  Future<bool> eliminar(id) async {
    UtilizadorModel.eliminar(id);
    return true;
  }

}
