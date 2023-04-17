import 'package:flutter/material.dart';
import 'package:gr/src/views/produtos/listar.dart';
import 'package:gr/theme/theme1.dart';

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
        backgroundColor: Theme1.primary,
        title: Text(widget.produto.nome),
      ),
      body: ListView(
        children: [
          Container(
            height: 500,
            width: 500,
            child: Image.asset(widget.produto.foto),
          ),
          Text(
            widget.produto.descricao,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
