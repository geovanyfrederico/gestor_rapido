import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gr/core/utils/snackbar_helper.dart';
import 'package:gr/models/cliente_model.dart';
import 'package:gr/models/produto_na_venda_model.dart';
import 'package:gr/models/venda_model.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/utils/alert_help.dart';
class FinalizarModalController {
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

  void setCliente(ClienteModel clienteSet) {
    cliente = clienteSet;
  }

  Future<bool> finalizar(BuildContext context) async {
    calcularResumo();
    if(totalPago < totalPagar){
      AlertHelper.error(context, 'Quantia paga insuficiente.', title: 'Erro');
      return false;
    }
    try{
      late int totalQtd = 0;
      produtos.forEach((element) {
        totalQtd = totalQtd + element.totalQtd;
      });
      int clienteId = await usuarioId();
      VendaModel vendaModel = VendaModel(
          clienteId: cliente.id
          , usuarioId:clienteId
          , data: _hoje()
          , totalQtd: totalQtd
          , totalPagar: totalPagar
          , totalPago: totalPago
          , troco: troco );
      vendaModel.id = await vendaModel.salvar();

      produtos.forEach((element) {
        element.vendaId = vendaModel.id;
        element.salvar();
      });
      return true;
    }catch(e){
      AlertHelper.error(context, 'Erro a realizar a venda, porfavor tente novamente.', title: 'Erro');
      return false;
    }

  }


  String _hoje(){
    DateTime today = DateTime.now();
    return DateFormat('yyyy-MM-dd').format(today);
  }
  Future<int> usuarioId() async {
    late SharedPreferences _prefs;
    _prefs = await SharedPreferences.getInstance();
    return _prefs.getInt("usuarioId")!;
  }

  void limpar() {

  }
}
