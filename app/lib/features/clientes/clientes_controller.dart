import 'package:flutter/cupertino.dart';
import 'package:gr/core/utils/snackbar_helper.dart';
import 'package:gr/models/cliente_model.dart';
import 'package:gr/models/database_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/utilizador_model.dart';


class ClientesListarController  extends ChangeNotifier{

  var clientes = <ClienteModel>[];



  Future<void> buscarClientes() async {
    Database db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> maps = await db.query('cliente', orderBy: 'id DESC');
    clientes =  List.generate(maps.length, (index) {
      return ClienteModel(
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
    ClienteModel clienteModel = clientes[index];
    if (clienteModel.id==1) {
      SnackbarHelper.error(context, "Erro: este cliente não pode ser eliminado.");
      return false;

    }
    try{
      if(await ClienteModel.eliminar(clienteModel.id) > 0){
        SnackbarHelper.success(context, "Successo: "+ clienteModel.nome+ " eliminado.");
        clientes.removeAt(index);
        return true;
      }
    }catch(e){
      SnackbarHelper.error(context, "Erro: não é possivel eliminar este cliente, é possivel que esteja relacionado com uma venda.");
      return false;
    }
    SnackbarHelper.error(context, "Erro: não é possivel eliminar este cliente.");
    return false;
  }



}
