import 'package:flutter/cupertino.dart';
import 'package:gr/core/utils/snackbar_helper.dart';
import 'package:gr/models/categoria_model.dart';
import 'package:gr/models/database_helper.dart';
import 'package:gr/models/produto_na_venda_model.dart';
import 'package:sqflite/sqflite.dart';

import '../../../core/utils/mat.dart';
import '../../../models/produto_model.dart';
import '../../../models/usuario_model.dart';

class VendasAdicionarController {
  late  List<ProdutoNaVendaModel> produtos = <ProdutoNaVendaModel>[];

  late double totalPagar = 0;
  void adicionar(ProdutoModel produtoModel) {
    late bool naoTem = true;
    produtos.forEach((element) {
      if (element.produtoId == produtoModel.id) {
        naoTem = false;
        element.addQtd();
      }
    });
    if (naoTem) {
      ProdutoNaVendaModel produtoNaVendaModel = ProdutoNaVendaModel(
          nome: produtoModel.nome,
          produtoId: produtoModel.id,
          totalQtd: 1,
          produto: produtoModel,
          preco: produtoModel.preco,
          precoTotal: produtoModel.preco * 1);
      produtos.add(produtoNaVendaModel);
    }
    calcular();
  }

  void addQtd(int index) {
    produtos[index].addQtd();
    calcular();
  }

  void removeQtd(int index) {
    produtos[index].removeQtd();
    if (produtos[index].totalQtd == 0) {
      produtos.removeAt(index);
    }
    calcular();
  }

  void calcular() {
    // Logica para calcular
    totalPagar = 0;
    produtos.forEach((element) {
      totalPagar = totalPagar + element.precoTotal;
    });
  }

  bool podeFinalizarVenda(BuildContext context){
    if (totalPagar <= 0){
      SnackbarHelper.error(context, 'Não é possivel finalizar um carrinho vazio.');
      return false;
    }
    return true;
  }
  String totalPagarToMoney() {
    return Mat.numeroParaDinheiro(totalPagar);
  }

  void finalizarVenda() {
    produtos.clear();
    totalPagar = 0;
    calcular();
  }
}
