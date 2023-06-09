import 'package:flutter/cupertino.dart';
import 'package:gr/core/utils/snackbar_helper.dart';
import 'package:gr/models/database_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class EntrarController{
  final telefone = TextEditingController();
  final pin = TextEditingController();

   // Crie uma instância do SharedPreferences.
  SharedPreferences? prefs;

  // Inicialize o SharedPreferences na construção do controlador.
  EntrarController() {
    initSharedPreferences();
  }
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
      List<Map<String, dynamic>> allUsers = await db.query('utilizador');
      for (var user in allUsers) {
        print("${user['nome']}, PIN: ${user['pin']}, TIPO: ${user['telefone']}");
      }*/
      List<Map<String, dynamic>> results = await db.query(
        'utilizador',
        where: "telefone = ? AND pin = ?",
        whereArgs: [telefone.value.text, pin.value.text],
      );

      if (results.isNotEmpty) {
         await prefs?.setInt("utilizadorId", results.first['id']);
          await prefs?.setString("utilizadorNome", results.first['nome']);
          await prefs?.setString("utilizadorTelefone", results.first['telefone']);
          await prefs?.setInt("utilizadorTipo", results.first['tipo']);
        SnackbarHelper.success(context,"Bem vindo.");
        return true;
      }
      SnackbarHelper.error(context,"Utilizador ou pin incorrecto.");
      return false;
    }catch(e){
      SnackbarHelper.error(context, "Erro:"+e.toString());
      return false;
    }

  }

  Future<void> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }
}