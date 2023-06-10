import 'package:flutter/cupertino.dart';
import 'package:gr/core/utils/snackbar_helper.dart';

import '../../../models/utilizador_model.dart';

class UtilizadorsAdicionarController{
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
    UtilizadorModel utilizadorModel = UtilizadorModel(
      nome: nome.value.text,
      pin: pin.value.text,
      telefone: telefone.value.text,
      tipo: 0
    );
    if(await utilizadorModel.salvar() > 0){
      SnackbarHelper.success(context, "Utilizador adicionado.");
      limparFormulario();
      return  true;
    }

    SnackbarHelper.error(context, "Não foi possivel adicionar o utilizadores, tente novamente");
    return false;
  }



}