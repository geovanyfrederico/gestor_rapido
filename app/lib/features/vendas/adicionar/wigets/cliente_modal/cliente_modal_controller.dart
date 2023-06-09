import 'package:flutter/cupertino.dart';
import 'package:gr/models/cliente_model.dart';

class ClienteModalController {
  final filtro = TextEditingController();
  List<ClienteModel> items = <ClienteModel>[];
  Future<bool> index() async {
    items.clear();
    items = await ClienteModel.index();
    return true;
  }
  Future<bool> filtrar(String search) async {
    items.clear();
    items = await ClienteModel.search(search);
    return true;
  }


}
