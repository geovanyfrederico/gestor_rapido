import 'package:flutter/cupertino.dart';
import 'package:gr/models/fornecedor_model.dart';

class FornecedorModalController {
  final filtro = TextEditingController();
  List<FornecedorModel> items = <FornecedorModel>[];
  Future<bool> index() async {
    items.clear();
    items = await FornecedorModel.index();
    return true;
  }
  Future<bool> filtrar(String search) async {
    items.clear();
    items = await FornecedorModel.search(search);
    return true;
  }


}
