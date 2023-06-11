import 'package:flutter/material.dart';

import '../../../../core/utils/mat.dart';
import '../../../../models/produto_model.dart';
import 'produtos_no_carrinho_controller.dart';

class ProdutoNoCarrinhoPage extends StatefulWidget {
  const ProdutoNoCarrinhoPage({Key? key, this.callback}) : super(key: key);
  final Function(ProdutoModel)? callback;
  @override
  _ModalContentState createState() => _ModalContentState();
}

class _ModalContentState extends State<ProdutoNoCarrinhoPage> {
  final ProdutoNoCarrinhoController _produtoNoCarrinhoPage =
      ProdutoNoCarrinhoController();

  @override
  void initState() {
    super.initState();
    // Inicializa a lista de produtos
    iniProdutoNoCarrinho();
  }

  void _adicionar(ProdutoModel produto) {
    widget.callback?.call(produto);
  }

  Future<void> iniProdutoNoCarrinho() async {
    await _produtoNoCarrinhoPage.buscarProdutos();
    setState(() {});
  }

  Future<void> filtrar(String value) async {
    if (value.isNotEmpty) {
      await _produtoNoCarrinhoPage.filtrar(value);
      setState(() {});
    } else {
      iniProdutoNoCarrinho();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Adicionar ao Carrinho',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: _produtoNoCarrinhoPage.produtos.length,
              itemBuilder: (context, index) {
                return _buildProductItem(
                    _produtoNoCarrinhoPage.produtos[index]);
              },
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            onChanged: (value) => filtrar(value),
            decoration: const InputDecoration(
              hintText: 'Escreva para filtrar',
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.qr_code),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem(ProdutoModel produto) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ListTile(
          onTap: () {
            _adicionar(produto);
          },
          title: Text(
            produto.nome,
            style: const TextStyle(fontSize: 18),
          ),
          subtitle: Text("Código: " +
              produto.codigo +
              "\nStock:" +
              produto.stock.toString()),
          trailing: Text(
            Mat.numeroParaDinheiro(produto.preco),
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
