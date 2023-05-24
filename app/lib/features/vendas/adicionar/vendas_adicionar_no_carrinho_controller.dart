import 'package:flutter/cupertino.dart';
import 'package:gr/core/utils/snackbar_helper.dart';
import 'package:gr/models/categoria_model.dart';
import 'package:gr/models/database_helper.dart';
import 'package:gr/models/produto_na_venda_model.dart';
import 'package:sqflite/sqflite.dart';

import '../../../models/produto_model.dart';
import '../../../models/usuario_model.dart';

class VendasAdicionarNoCarrinhController {
  final filtro = TextEditingController();
  late List<ProdutoModel> produtos = <ProdutoModel>[];

  Future<void> buscarProdutos() async {
    produtos.clear();
    ProdutoModel.index().then((value) => produtos = value);
  }

  Future<bool> filtrar(String search) async {
    if (search.isEmpty) {
      await buscarProdutos();
      return false;
    }
    produtos.clear();
    await ProdutoModel.search(filtro.value.text)
        .then((value) => produtos = value);
    return true;
  }
}
