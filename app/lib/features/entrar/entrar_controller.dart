import 'package:flutter/cupertino.dart';
import 'package:gr/core/utils/snackbar_helper.dart';
import 'package:sqflite/sqflite.dart';

import 'package:gr/models/database_helper.dart';

class EntrarController{
  final telefone = TextEditingController();
  final pin = TextEditingController();

  bool valido(){
    if(telefone.value.text.isEmpty){
      return false;
    }
    if(pin.value.text.isEmpty){
      return false;
    }
    return true;
  }


  Future<bool> entrar(BuildContext context) async{
    if(!valido()){
      SnackbarHelper.warning(context, "Preencha todos campos.");
      return false;
    }
    try{
      Database db = await DatabaseHelper.instance.database;

      /* busca todos os usuários
      List<Map<String, dynamic>> allUsers = await db.query('usuario');
      for (var user in allUsers) {
        print("${user['nome']}, PIN: ${user['pin']}, TIPO: ${user['telefone']}");
      }*/
      List<Map<String, dynamic>> results = await db.query(
        'usuario',
        where: "telefone = ? AND pin = ?",
        whereArgs: [telefone.value.text, pin.value.text],
      );

      if (results.isNotEmpty) {
        SnackbarHelper.success(context,"Bem vindo.");
        return true;
      }
      SnackbarHelper.error(context,"Usuario ou pin incorrecto.");
      return false;
    }catch(e){
      SnackbarHelper.error(context, "Erro:"+e.toString());
      return false;
    }

  }
}