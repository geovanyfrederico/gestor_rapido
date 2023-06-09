import 'package:flutter/cupertino.dart';
import 'package:gr/core/utils/snackbar_helper.dart';
import 'package:gr/models/database_helper.dart';
import 'package:gr/models/produto_model.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/venda_model.dart';


class VendasController  extends ChangeNotifier{
  var loading = false;
  final filtro = TextEditingController();
  Future<List<VendaModel>> buscar() async {
    Database db = await DatabaseHelper.instance.database;
    String query = 'SELECT * FROM venda';
    if (filtro.text.isNotEmpty) {
      query += " WHERE codigo = '${filtro.text}'";
    }
    query += ' ORDER BY id DESC';
    List<Map<String, dynamic>> maps = await db.rawQuery(query);

    return List.generate(maps.length, (index) {
      return VendaModel.fromMap(maps[index]);
    });
  }
  Future<bool> eliminar(id, BuildContext context) async {
    await ProdutoModel.eliminar(id) > 0 ? SnackbarHelper.success(context, 'Operação concluida') :  SnackbarHelper.success(context, 'Operação não concluida');
    return true;
  }

}
