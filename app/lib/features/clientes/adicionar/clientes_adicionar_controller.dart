import 'package:flutter/cupertino.dart';
import 'package:gr/core/utils/snackbar_helper.dart';
import 'package:gr/models/cliente_model.dart';
import 'package:gr/models/database_helper.dart';
import 'package:sqflite/sqflite.dart';

import '../../../models/usuario_model.dart';

class ClientesAdicionarController{
  final nome = TextEditingController();
  final telefone = TextEditingController();
  final nif = TextEditingController();
  final endereco = TextEditingController();

  bool valido(context){
    if( nome.value.text.isEmpty){
      SnackbarHelper.warning(context, "Preencha todos campos");
      return false;
    }

    return true;
  }
  void limparFormulario(){
    nome.clear();
    telefone.clear();
    nif.clear();
    endereco.clear();
  }

  Future<bool> salvar(context) async {
    if(!valido(context)){
      return false;
    }
    ClienteModel clienteModel = ClienteModel(
      nome: nome.value.text,
      telefone: telefone.value.text,
      nif: nif.value.text,
      endereco:endereco.value.text
    );
    if(await clienteModel.salvar() > 0){
      SnackbarHelper.success(context, "Cliente adicionado.");
      limparFormulario();
      return  true;
    }

    SnackbarHelper.error(context, "Não foi possivel adicionar o cliente, tente novamente");
    return false;
  }



}
