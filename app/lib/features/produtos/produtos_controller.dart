import 'dart:collection';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:gr/models/produto_model.dart';
import 'package:gr/models/usuario_model.dart';
import 'package:sqflite/sqflite.dart';

import 'package:gr/models/database_helper.dart';


class ProdutosController  extends ChangeNotifier{
  var loading = false;
  Future<List<ProdutoModel>> buscar() async {
    Database db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> maps = await db.query('produto', orderBy: 'id DESC');
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
  Future<bool> eliminar(id) async {
    UsuarioModel.eliminar(id);
    return true;
  }

}
