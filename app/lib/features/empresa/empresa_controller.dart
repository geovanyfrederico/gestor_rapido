import 'package:flutter/cupertino.dart';
import 'package:gr/core/utils/snackbar_helper.dart';
import 'package:gr/models/empresa_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/utilizador_model.dart';

class EmpresaController{

  final nome = TextEditingController();
  final telefone = TextEditingController();
  final nif = TextEditingController();
  final endereco = TextEditingController();
  late EmpresaModel empresa  = EmpresaModel(nome: "", nif: "");
  bool valido(context){
    if( nome.value.text.isEmpty){
      SnackbarHelper.warning(context, "Preencha todos campos");
      return false;
    }
    if(nif.value.text.isEmpty){
      SnackbarHelper.warning(context, "Preencha todos campos");
      return false;
    }
    return true;
  }

  Future<bool> atualizar(context) async {
    int uTipo = await utilizadorTipo();
    if(UtilizadorModel.tipoVendedor == uTipo){
      SnackbarHelper.error(context, "Voce não tem permissão.");
      return false;
    }

    if(!valido(context)){
      return false;
    }
    empresa.nome = nome.value.text ;
    empresa.telefone = telefone.value.text ;
    empresa.nif = nif.value.text ;
    empresa.endereco = endereco.value.text ;
    try{
      empresa.update();
      SnackbarHelper.success(context, "Operação concluida");
      return true;
    }catch(e){
      SnackbarHelper.error(context, "Não foi atualizar. \n Erro:${e.toString()}");
      return false;
    }

  }

  Future<void> init() async {
    empresa = await EmpresaModel.findFirst();
    nome.text = empresa.nome;
    telefone.text = empresa.telefone;
    nif.text = empresa.nif;
    endereco.text = empresa.endereco;
  }


  Future<int> utilizadorTipo() async {
    late SharedPreferences _prefs;
    _prefs = await SharedPreferences.getInstance();
    return _prefs.getInt("utilizadorTipo")!;
  }
}
