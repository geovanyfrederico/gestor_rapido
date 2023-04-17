import 'package:flutter/material.dart';
import 'package:gr/src/views/produtos/listar.dart';

class ProdutosDetalhes extends StatefulWidget {
  Produtos produto;

  ProdutosDetalhes({Key? key, required this.produto}) : super(key: key);

  @override
  State<ProdutosDetalhes> createState() => _ProdutosDetalhesState();
}

class _ProdutosDetalhesState extends State<ProdutosDetalhes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.produto.nome),
      ),
    );
  }
}
