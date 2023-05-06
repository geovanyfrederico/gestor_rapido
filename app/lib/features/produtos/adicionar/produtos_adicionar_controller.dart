import 'package:flutter/cupertino.dart';
import 'package:gr/core/utils/snackbar_helper.dart';
import 'package:gr/models/database_helper.dart';
import 'package:sqflite/sqflite.dart';

import '../../../models/produto_model.dart';
import '../../../models/usuario_model.dart';

class ProdutosAdicionarController{
  final codigo = TextEditingController();
  final nome = TextEditingController();
  final preco = TextEditingController();
  final stock = TextEditingController();

  bool valido(context){
    if( nome.value.text.isEmpty
        || codigo.value.text.isEmpty
        || preco.value.text.isEmpty
        || stock.value.text.isEmpty
    ){
      SnackbarHelper.warning(context, "Preencha todos campos");
      return false;
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
      stock: int.parse(preco.value.text)
    );
    if(await produtoModelo.salvar() > 0){
      SnackbarHelper.success(context, "Operação concluida");
      limparFormulario();
      return  true;
    }
    SnackbarHelper.error(context, "Erro na operação");
    return false;
  }
}