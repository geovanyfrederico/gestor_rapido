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
  final codigo = TextEditingController();
  final nome = TextEditingController();
  final preco = TextEditingController();
  final stock = TextEditingController();
  final cartItems = <ProdutoNaVendaModel>[];
  var categorias = <CategoriasModel>[];

  late double totalPagar = 0;
  void adicionar(ProdutoModel produtoModel) {
    late bool naoTem = true;
    cartItems.forEach((element) {
      if (element.produtoId == produtoModel.id) {
        naoTem = false;
        element.addQtd();
      }
    });
    if (naoTem) {
      ProdutoNaVendaModel produtoNaVendaModel = ProdutoNaVendaModel(
          nome: produtoModel.nome,
          produtoId: produtoModel.id,
          qtd: 1,
          produto: produtoModel,
          preco: produtoModel.preco,
          precoTotal: produtoModel.preco * 1);
      cartItems.add(produtoNaVendaModel);
    }
    calcular();
  }

  void addQtd(int index) {
    cartItems[index].addQtd();
    calcular();
  }

  void removeQtd(int index) {
    cartItems[index].removeQtd();
    if (cartItems[index].qtd == 0) {
      cartItems.removeAt(index);
    }
    calcular();
  }

  void calcular() {
    // Logica para calcular
    totalPagar = 0;
    cartItems.forEach((element) {
      totalPagar = totalPagar + element.precoTotal;
    });
  }

  String totalPagarToMoney() {
    return Mat.numeroParaDinheiro(totalPagar);
  }
}
