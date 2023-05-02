import 'package:flutter/cupertino.dart';
import 'package:gr/core/utils/snackbar_helper.dart';
import 'package:gr/models/database_helper.dart';
import 'package:sqflite/sqflite.dart';

import '../../../models/usuario_model.dart';

class ProdutosAdicionarController{
  final nome = TextEditingController();
  final telefone = TextEditingController();
  final pin = TextEditingController();
  final tipo = TextEditingController();

  bool valido(context){
    if( nome.value.text.isEmpty
        || telefone.value.text.isEmpty
        || pin.value.text.isEmpty
    ){
      SnackbarHelper.warning(context, "Preencha todos campos");
      return false;
    }

    return true;
  }
  void limparFormulario(){
    nome.clear();
    telefone.clear();
    pin.clear();
    tipo.clear();
  }

  Future<bool> salvar(context) async {
    if(!valido(context)){
      return false;
    }
    UsuarioModel usuarioModel = UsuarioModel(
      nome: nome.value.text,
      pin: pin.value.text,
      telefone: telefone.value.text,
    );
    if(await usuarioModel.salvar() > 0){
      SnackbarHelper.success(context, "Usuario adicionado.");
      limparFormulario();
      return  true;
    }

    SnackbarHelper.error(context, "Não foi possivel adicionar o usuarios, tente novamente");
    return false;
  }



}