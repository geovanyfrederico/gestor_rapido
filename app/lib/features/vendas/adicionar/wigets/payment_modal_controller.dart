import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:gr/models/cliente_model.dart';
import 'package:gr/models/produto_na_venda_model.dart';
class PaymentModalController {
  final filtro = TextEditingController();
  final totalPagoInput = TextEditingController();


  List<ProdutoNaVendaModel> produtos = <ProdutoNaVendaModel>[];
  double totalPagar = 0;
  double totalPago = 0;
  double troco = 0;
  late ClienteModel cliente = ClienteModel(nome: 'Consumidor Final', nif: '9999999');

  Future<bool> init(List<ProdutoNaVendaModel> produtosDoCarrinho, double totalPagarDoCarrinho) async {
    produtos = produtosDoCarrinho;
    totalPagar = totalPagarDoCarrinho;
    totalPago = totalPagarDoCarrinho;
    totalPagoInput.text = totalPagarDoCarrinho.toString();
    cliente = await ClienteModel.findOneById(1);
    return true;
  }

  void calcularResumo(){
    totalPago = double.parse(totalPagoInput.text);
    troco = totalPago  - totalPagar;
  }

}
