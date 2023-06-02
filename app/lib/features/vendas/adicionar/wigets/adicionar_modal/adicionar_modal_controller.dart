import 'package:flutter/cupertino.dart';
import 'package:gr/models/produto_model.dart';

class AdicionarModalController {
  final filtro = TextEditingController();
  List<ProdutoModel> produtos = <ProdutoModel>[];
  Future<bool> buscarProdutos() async {
    produtos.clear();
    produtos = await ProdutoModel.index();
    return true;
  }
  Future<bool> filtrar(String search) async {
    produtos.clear();
    produtos = await ProdutoModel.search(search);
    return true;
  }
}
