import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gr/core/utils/alert_help.dart';

import '../../../models/fornecedor_model.dart';

class FornecedorEditarController {
  var nome = TextEditingController();
  var endereco = TextEditingController();
  var telefone = TextEditingController();
  var nif = TextEditingController();
  late FornecedorModel fornecedor = FornecedorModel(nome: "", nif: "");

  Future<void> init(FornecedorModel fornecedorInited) async {
    fornecedor = fornecedorInited;
    nome.text = fornecedor.nome;
    nif.text = fornecedor.nif;
    endereco.text = fornecedor.endereco!;
    telefone.text = fornecedor.telefone!;
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
      fornecedor.nome = nome.text;
      fornecedor.nif = nif.text;
      fornecedor.endereco = endereco.text;
      fornecedor.telefone = telefone.text;
      await fornecedor.update();
      AlertHelper.success(context, "Operação concluída");
      return true;
    } catch (e) {
      AlertHelper.error(context, "Não foi possível atualizar o fornecedor, tente novamente. \nErro: ${e.toString()}");
      return false;
    }
  }
}
