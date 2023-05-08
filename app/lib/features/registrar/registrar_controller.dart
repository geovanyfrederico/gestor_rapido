import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gr/core/utils/snackbar_helper.dart';
import 'package:gr/models/empresa_model.dart';
import 'package:gr/models/usuario_model.dart';

class RegistarController {


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
    try {
      await empresaModel.salvar();
      await usuarioModel.salvar();
      SnackbarHelper.success(context, "Successo");
      // Envia uma mensagem de boas vindas.
      //  SmsService.send(telefone.value.text, "Bem vindo ao Gestor Rápido, código de verificação: ${Matematica.gerarNumerosAleatorios(5)}");
      return true;
    } catch ( e) {
      SnackbarHelper.error(context, "Erro: "+e.toString());
      return false;
    }
  }
}

