import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gr/core/utils/alert_help.dart';

import '../../../models/cliente_model.dart';

class ClienteEditarController {
  var nome = TextEditingController();
  var endereco = TextEditingController();
  var telefone = TextEditingController();
  var nif = TextEditingController();
  late ClienteModel cliente = ClienteModel(nome: "", nif: "");

  Future<void> init(ClienteModel clienteInited) async {
    cliente = clienteInited;
    nome.text = cliente.nome;
    nif.text = cliente.nif;
    endereco.text = cliente.endereco!;
    telefone.text = cliente.telefone!;
  }

  bool valido(context) {
    if (nome.text.isEmpty) {
      AlertHelper.warning(context, "Preencha todos campos obrigatórios.");
      return false;
    }
    return true;
  }

  Future<bool> atualizar(BuildContext context) async {
    if (!valido(context)) {
      return false;
    }

    try {
      cliente.nome = nome.text;
      cliente.nif = nif.text;
      cliente.endereco = endereco.text;
      cliente.telefone = telefone.text;
      await cliente.update();
      AlertHelper.success(context, "Operação concluída");
      return true;
    } catch (e) {
      AlertHelper.error(context, "Não foi possível atualizar o cliente, tente novamente. \nErro: ${e.toString()}");
      return false;
    }
  }
}
