import 'dart:developer';

import 'package:gr/models/cliente_model.dart';
import 'package:gr/models/produto_na_venda_model.dart';
import 'package:gr/models/usuario_model.dart';
import 'package:gr/models/venda_model.dart';
class VisualizarVendaController {
  late VendaModel venda;
  late ClienteModel cliente;
  late UsuarioModel usuario;
  Future<void> init(VendaModel vendaModel) async {
    venda = vendaModel;
    cliente = await venda.cliente;
    usuario = await venda.usuario;
  }
  Future<List<ProdutoNaVendaModel>> produtos() async{
    return await venda.produtos;
  }
}
