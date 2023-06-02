import 'package:flutter/cupertino.dart';
import 'package:gr/core/utils/snackbar_helper.dart';
import 'package:gr/models/cliente_model.dart';
import 'package:sqflite/sqflite.dart';

import 'package:gr/models/database_helper.dart';

import '../../models/fornecedor_model.dart';

class FornecedoresListarController extends ChangeNotifier {
  var fornecedores = <FornecedorModel>[];

  Future<void> buscarFornecedores() async {
    Database db = await DatabaseHelper.instance.database;

    List<Map<String, dynamic>> maps =
        await db.query('fornecedor', orderBy: 'id DESC');

    fornecedores = List.generate(maps.length, (index) {
      return FornecedorModel(
        id: maps[index]['id'],
        nome: maps[index]['nome'],
        endereco: maps[index]['endereco'],
        telefone: maps[index]['telefone'],
        nif: maps[index]['nif'],
      );
    });
  }

  Future<bool> eliminar(index, BuildContext context) async {
    FornecedorModel clienteModel = fornecedores[index];
    if (await FornecedorModel.eliminar(clienteModel.id) > 0) {
      SnackbarHelper.success(
          context, "Successo: " + clienteModel.nome + " eliminado.");
      fornecedores.removeAt(index);
      return true;
    }
    SnackbarHelper.error(
        context, "Erro: não é possivel eliminar este cliente.");
    return false;
  }
}
