import 'package:flutter/cupertino.dart';
import 'package:gr/core/utils/snackbar_helper.dart';
import 'package:gr/models/fornecedor_model.dart';
import 'package:gr/models/database_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/utilizador_model.dart';


class FornecedoresListarController  extends ChangeNotifier{

  var fornecedores = <FornecedorModel>[];



  Future<void> buscarFornecedores() async {
    Database db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> maps = await db.query('fornecedor', orderBy: 'id DESC');
    fornecedores =  List.generate(maps.length, (index) {
      return FornecedorModel(
        id: maps[index]['id'],
        nome: maps[index]['nome'],
        endereco: maps[index]['endereco'],
        telefone: maps[index]['telefone'],
        nif: maps[index]['nif'],
      );
    });
  }
  Future<int> utilizadorTipo() async {
    late SharedPreferences _prefs;
    _prefs = await SharedPreferences.getInstance();
    return _prefs.getInt("utilizadorTipo")!;
  }
  Future<bool> eliminar(index, BuildContext context) async {
    int uTipo = await utilizadorTipo();
    if(UtilizadorModel.tipoVendedor == uTipo){
      SnackbarHelper.error(context, "Voce não tem permissão.");
      return false;
    }

    FornecedorModel fornecedorModel = fornecedores[index];
    try{
      if(await FornecedorModel.eliminar(fornecedorModel.id) > 0){
        SnackbarHelper.success(context, "Successo: "+ fornecedorModel.nome+ " eliminado.");
        fornecedores.removeAt(index);
        return true;
      }
    }catch(e){
      SnackbarHelper.error(context, "Erro: não é possivel eliminar este fornecedor, é possivel que esteja relacionado com uma venda.");
      return false;
    }
    SnackbarHelper.error(context, "Erro: não é possivel eliminar este fornecedor.");
    return false;
  }

}
