import 'package:flutter/cupertino.dart';
import 'package:gr/models/utilizador_model.dart';

class UtilizadorModalController {
  final filtro = TextEditingController();
  List<UtilizadorModel> items = <UtilizadorModel>[];
  Future<bool> index() async {
    items.clear();
    items = await UtilizadorModel.index();
    return true;
  }
  Future<bool> filtrar(String search) async {
    items.clear();
    items = await UtilizadorModel.search(search);
    return true;
  }


}
