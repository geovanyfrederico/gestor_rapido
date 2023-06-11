import 'package:flutter/cupertino.dart';
import 'package:gr/core/utils/alert_help.dart';
import 'package:gr/core/utils/snackbar_helper.dart';
import 'package:gr/core/utils/snackbar_helper.dart';
import 'package:gr/models/database_helper.dart';
import 'package:gr/models/utilizador_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  Future<int> utilizadorTipo() async {
    late SharedPreferences _prefs;
    _prefs = await SharedPreferences.getInstance();
    return _prefs.getInt("utilizadorTipo")!;
  }
  Future<bool> eliminar(BuildContext context, int? id) async {
    int uTipo = await utilizadorTipo();
    if(UtilizadorModel.tipoVendedor == uTipo){
      SnackbarHelper.error(context, "Voce não tem permissão.");
      return false;
    }

    try{
      await UtilizadorModel.eliminar(id!);
      SnackbarHelper.success(context, 'Operação concluida.');
      return true;
    }catch(e){
      SnackbarHelper.error(context, 'Não foi possivel eliminar este utilizador. \n O mesmo tem vendas ou compras realizadas.');
      return false;
    }
  }

}
