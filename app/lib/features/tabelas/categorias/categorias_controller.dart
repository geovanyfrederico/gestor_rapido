import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gr/core/utils/database_error_handler.dart';
import 'package:gr/core/utils/snackbar_helper.dart';
import 'package:gr/models/categoria_model.dart';

class CategoriasController extends ChangeNotifier {
  var categorias = <CategoriasModel>[];
  final nome = TextEditingController();
  Future<bool> index(BuildContext context) async {
    try {
      categorias = [];
      categorias = await CategoriasModel.index();
      return true;
    } catch (e) {
      SnackbarHelper.error(context, "Erro:" + e.toString());
      return false;
    }
  }

  Future<bool> eliminar(index, BuildContext context) async {
    CategoriasModel clienteModel = categorias[index];
    if (await CategoriasModel.eliminar(clienteModel.id) > 0) {
      SnackbarHelper.success(
          context, "Successo: " + clienteModel.nome + " eliminado.");
      categorias.removeAt(index);
      return true;
    }
    SnackbarHelper.error(
        context, "Erro: não é possivel eliminar este cliente.");
    return false;
  }

  Future<bool> adicionar(BuildContext context) async {
    var categoriasModel = CategoriasModel(nome: nome.value.text);
    try {
      categoriasModel.id = await categoriasModel.salvar();
      categorias.insert(0, categoriasModel);
      nome.clear();
      return true;
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(
                DatabaseErrorHandler.getErrorMessage(e),
              ),
            );
          });
      return false;
    }
  }
}
