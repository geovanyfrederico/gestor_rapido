import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gr/models/cliente_model.dart';
import 'package:gr/models/movimento_de_stock_model.dart';
import 'package:gr/models/produto_na_compra_model.dart';
import 'package:gr/models/compra_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/utils/alert_help.dart';
import '../../../../../models/produto_model.dart';
class FinalizarModalController {
  final filtro = TextEditingController();
  final totalPagoInput = TextEditingController();

  List<ProdutoNaCompraModel> produtos = <ProdutoNaCompraModel>[];
  double totalPagar = 0;
  double totalPago = 0;
  double troco = 0;
  late ClienteModel cliente = ClienteModel(nome: 'Consumidor Final', nif: '9999999');

  Future<bool> init(List<ProdutoNaCompraModel> produtosDoCarrinho, double totalPagarDoCarrinho) async {
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
      for (var element in produtos) {
        totalQtd = totalQtd + element.totalQtd;
      }
      int uId = await utilizadorId();
      CompraModel compraModel = CompraModel(
          fornecedorId: cliente.id
          , utilizadorId:uId
          , data: _hoje()
          , totalQtd: totalQtd
          , totalPagar: totalPagar
          , totalPago: totalPago
          , troco: troco );
      compraModel.id = await compraModel.salvar();

      for (var pnv in produtos) {
        ProdutoModel produtoModel = await ProdutoModel.findOneById(pnv.produtoId!);

        produtoModel.stock -= pnv.totalQtd;
        pnv.compraId = compraModel.id;
        await produtoModel.update();
        MovimentoDeStockModel( produtoId: produtoModel.id!, utilizadorId: uId, data: _hoje(), totalQtd: pnv.totalQtd, ref: 'Compra ${compraModel.id}', tipo: 'Saída').insert();
        await pnv.salvar();
      }
      return true;
    }catch(e){
      log(e.toString());
      AlertHelper.error(context, 'Erro a realizar a compra, porfavor tente novamente.', title: 'Erro');
      return false;
    }

  }


  String _hoje(){
    return DateTime.now().toIso8601String();
  }
  Future<int> utilizadorId() async {
    late SharedPreferences _prefs;
    _prefs = await SharedPreferences.getInstance();
    return _prefs.getInt("utilizadorId")!;
  }

  void limpar() {

  }
}
