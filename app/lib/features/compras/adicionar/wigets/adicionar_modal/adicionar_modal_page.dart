import 'package:flutter/material.dart';
import 'package:gr/core/utils/mat.dart';
import 'package:gr/models/produto_model.dart';

import 'adicionar_modal_controller.dart';


class AdicionarModalPage extends StatefulWidget {
  const AdicionarModalPage({Key? key, this.callback}) : super(key: key);
  final Function(ProdutoModel)? callback;
  @override
  AdicionarModalState createState() => AdicionarModalState();
}

class AdicionarModalState extends State<AdicionarModalPage> {
  final AdicionarModalController controller =
  AdicionarModalController();

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
    await controller.buscarProdutos();
    setState(() {});
  }

  Future<void> filtrar(String value) async {
    if (value.isNotEmpty) {
      await controller.filtrar(value);
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
              itemCount: controller.produtos.length,
              itemBuilder: (context, index) {
                return _buildProductItem(
                    controller.produtos[index]);
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
