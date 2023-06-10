import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gr/core/utils/alert_help.dart';
import 'package:gr/models/movimento_de_stock_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/utils/mat.dart';
import '../../../models/produto_model.dart';
class ProdutosEditarController {
  final codigo = TextEditingController();
  final nome = TextEditingController();
  final preco = TextEditingController();
  final stock = TextEditingController();
  final motivo = TextEditingController();

  late ProdutoModel produto;
  Future<void> init(ProdutoModel produtoInited) async {
    produto = produtoInited;
    codigo.text = produto.codigo;
    nome.text = produto.nome;
    preco.text = produto.preco.toString();
    stock.text = produto.stock.toString();
  }
  bool valido(context){
    if( nome.value.text.isEmpty
        || preco.value.text.isEmpty
    ){
      AlertHelper.warning(context, "Preencha todos campos");
      return false;
    }
    // gerar um código aleatorio se estiver vazio
    if(codigo.value.text.isEmpty){
      codigo.text = "P"+Mat.codigoAleatorio();
    }
    if(stock.value.text.isEmpty){
      stock.text = 0.toString() ;
    }
    return true;
  }

  Future<bool> atualizar(BuildContext context) async {
    if(!valido(context)){
      return false;
    }
    late int stockAtual = int.parse(stock.value.text);
    final int uId = await utilizadorId();
    try{
      produto.codigo = codigo.value.text;
      produto.nome = nome.value.text;
      produto.preco = double.parse(preco.value.text);
      if(produto.stock != stockAtual){
        produto.stock = stockAtual;
        //Verifica se existe um motivo para atualizar o stock
        motivo.text = motivo.value.text.isEmpty ? "S/Ref" : motivo.value.text;
        MovimentoDeStockModel( produtoId: produto.id!, utilizadorId: uId, data: _hoje(), totalQtd: stockAtual, ref: motivo.value.text, tipo: 'Atualização').insert();
      }
      await produto.update();
      AlertHelper.success(context, "Operação concluida");
      return true;
    }catch(e){
      AlertHelper.error(context, "Não foi possivel ataulizar o produto, tente novamente. \nErro:${e.toString()}");
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

}
