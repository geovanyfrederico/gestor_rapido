import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:gr/core/utils/mat.dart';
import 'package:gr/core/utils/snackbar_helper.dart';

import '../../../models/produto_model.dart';

class ProdutosAdicionarController{
  final codigo = TextEditingController();
  final nome = TextEditingController();
  final preco = TextEditingController();
  final stock = TextEditingController();
  late  File?  foto = null ;

  bool valido(context){
    if( nome.value.text.isEmpty
        || preco.value.text.isEmpty
    ){
      SnackbarHelper.warning(context, "Preencha todos campos");
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
  void limparFormulario(){
    nome.clear();
    codigo.clear();
    preco.clear();
    stock.clear();
  }

  Future<bool> salvar(context) async {
    if(!valido(context)){
      return false;
    }



    ProdutoModel produtoModelo = ProdutoModel(
      nome: nome.value.text,
      codigo: codigo.value.text,
      preco: double.parse(preco.value.text),
      stock: int.parse(stock.value.text),
    );
    if(foto != null){
      produtoModelo.foto   = foto!.path;
    }

    if(await produtoModelo.salvar() > 0){
      SnackbarHelper.success(context, "Operação concluida");
      limparFormulario();
      return  true;
    }
    SnackbarHelper.error(context, "Erro na operação");
    return false;
  }
}