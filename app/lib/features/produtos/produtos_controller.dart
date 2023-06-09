import 'package:flutter/cupertino.dart';
import 'package:gr/core/utils/snackbar_helper.dart';
import 'package:gr/models/database_helper.dart';
import 'package:gr/models/produto_model.dart';
import 'package:sqflite/sqflite.dart';


class ProdutosController  extends ChangeNotifier{
  var loading = false;
  final filtro = TextEditingController();
  Future<List<ProdutoModel>> buscar() async {


    Database db = await DatabaseHelper.instance.database;
    String query = 'SELECT * FROM produto';
    if (filtro.text.isNotEmpty) {
      query += " WHERE nome LIKE '%${filtro.text}%' OR codigo LIKE '%${filtro.text}%'";
    }
    query += ' ORDER BY id DESC';
    List<Map<String, dynamic>> maps = await db.rawQuery(query);

    return List.generate(maps.length, (index) {
      return ProdutoModel(
        id: maps[index]['id'],
        nome: maps[index]['nome'],
        codigo: maps[index]['codigo'],
        preco: maps[index]['preco'],
        stock: maps[index]['stock'],
        foto: maps[index]['foto'],
      );
    });
  }
  Future<bool> eliminar(id, BuildContext context) async {
   await ProdutoModel.eliminar(id) > 0 ? SnackbarHelper.success(context, 'Operação concluida') :  SnackbarHelper.success(context, 'Operação não concluida');
    return true;
  }

}
