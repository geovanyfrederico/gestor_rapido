import 'package:flutter/cupertino.dart';
import 'package:gr/core/utils/snackbar_helper.dart';
import 'package:gr/models/database_helper.dart';
import 'package:gr/models/produto_model.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/compra_model.dart';


class ComprasController  extends ChangeNotifier{
  var loading = false;
  final filtro = TextEditingController();
  Future<List<CompraModel>> buscar() async {
    Database db = await DatabaseHelper.instance.database;
    String query = 'SELECT * FROM compra';
    if (filtro.text.isNotEmpty) {
      query += " WHERE codigo = '${filtro.text}'";
    }
    query += ' ORDER BY id DESC';
    List<Map<String, dynamic>> maps = await db.rawQuery(query);

    return List.generate(maps.length, (index) {
      return CompraModel.fromMap(maps[index]);
    });
  }
  Future<bool> eliminar(id, BuildContext context) async {
    await ProdutoModel.eliminar(id) > 0 ? SnackbarHelper.success(context, 'Operação concluida') :  SnackbarHelper.success(context, 'Operação não concluida');
    return true;
  }

}
