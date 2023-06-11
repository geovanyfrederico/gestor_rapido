import 'package:flutter/cupertino.dart';
import 'package:gr/core/utils/snackbar_helper.dart';
import 'package:gr/models/fornecedor_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/utilizador_model.dart';

class FornecedoresAdicionarController{
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
  Future<int> utilizadorTipo() async {
    late SharedPreferences _prefs;
    _prefs = await SharedPreferences.getInstance();
    return _prefs.getInt("utilizadorTipo")!;
  }
  Future<bool> salvar(context) async {
    int uTipo = await utilizadorTipo();
    if(UtilizadorModel.tipoVendedor == uTipo){
      SnackbarHelper.error(context, "Voce não tem permissão.");
      return false;
    }

    if(!valido(context)){
      return false;
    }
    FornecedorModel fornecedorModel = FornecedorModel(
        nome: nome.value.text,
        telefone: telefone.value.text,
        nif: nif.value.text,
        endereco:endereco.value.text
    );
    if(await fornecedorModel.salvar() > 0){
      SnackbarHelper.success(context, "Fornecedor adicionado.");
      limparFormulario();
      return  true;
    }

    SnackbarHelper.error(context, "Não foi possivel adicionar o fornecedor, tente novamente");
    return false;
  }



}
