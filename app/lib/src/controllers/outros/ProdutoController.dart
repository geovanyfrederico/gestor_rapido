import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gr/src/models/produto_model.dart';

class ProdutoController extends GetXState {
  final FormRegistarProduto = GlobalKey<FormState>();
  final nomeDoProduto = TextEditingController();
  final preco = TextEditingController();
  final descricao = TextEditingController();

  void CadastrarProduto() {
    print(nomeDoProduto.text);
    print(preco.toString());
    print(descricao.text);
    Get.toNamed("/produtos/listar");
  }
}