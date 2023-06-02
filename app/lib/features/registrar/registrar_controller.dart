import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gr/core/utils/snackbar_helper.dart';
import 'package:gr/models/empresa_model.dart';
import 'package:gr/models/usuario_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/utils/sms.dart';

class RegistarController {
  // Crie uma instância do SharedPreferences.
  SharedPreferences? prefs;

  final nomeDaEmpresa = TextEditingController();
  final nomeDoUsuario = TextEditingController();
  final nif = TextEditingController();
  final telefone = TextEditingController();
  final pin = TextEditingController();

  bool valido(){
    if(nomeDaEmpresa.value.text.isEmpty) {
      return false;
    }
    if(nomeDoUsuario.value.text.isEmpty) {
      return false;
    }
    if(nif.value.text.isEmpty) {
      return false;
    }
    if(telefone.value.text.isEmpty) {
      return false;
    }
    if(pin.value.text.isEmpty) {
      return false;
    }

    return true;
  }



  Future<bool> registar(BuildContext context) async {
    if(!valido()){
      SnackbarHelper.warning(context, "Preencha todos campos.");
      return false;
    }
    // Cadastar empresa
    EmpresaModel empresaModel = EmpresaModel(
        nome: nomeDaEmpresa.value.text,
        nif: nif.value.text
    );
    UsuarioModel usuarioModel = UsuarioModel(
        nome: nomeDoUsuario.value.text,
        pin: pin.value.text,
        telefone: telefone.value.text,
        tipo: 2
    );
    final empresas =   await EmpresaModel.count();
    if(empresas != 0){
      SnackbarHelper.error(context, "Já existe uma empresa registrada neste despositivo");
      return false;
    }
    try {
      await empresaModel.salvar();
      final usuarioId = await usuarioModel.salvar();

      SnackbarHelper.success(context, "Successo");

      var _prefs = await SharedPreferences.getInstance();
      await _prefs.setBool('logado', true);
      await _prefs.setInt("usuarioId", usuarioId);
      await _prefs.setString("usuarioNome", usuarioModel.nome);
      await _prefs.setString("usuarioTelefone", usuarioModel.telefone);
      await _prefs.setInt("usuarioTipo",usuarioModel.tipo);

      // Envia uma mensagem de boas vindas.
      SMS.send(telefone.value.text, "${usuarioModel.nome}, bem vindo ao Gestor Rápido.");
      return true;
    } catch ( e) {
      SnackbarHelper.error(context, "Erro: "+e.toString());
      return false;
    }
  }
}

