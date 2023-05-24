import 'dart:io';
import 'package:gr/features/vendas/adicionar/vendas_adicionar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gr/features/vendas/adicionar/vendas_adicionar_no_carrinho_controller.dart';
import 'package:gr/core/utils/mat.dart';

class VendasAdicionarPage extends StatefulWidget {
  const VendasAdicionarPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return VendasAdicionarState();
  }
}

class VendasAdicionarState extends State<VendasAdicionarPage> {
  final VendasAdicionarController controller = VendasAdicionarController();
  final VendasAdicionarNoCarrinhController _vendasAdicionarNoCarrinhController =
      VendasAdicionarNoCarrinhController();
  File? imageFile;

  @override
  void initState() {
    super.initState();
    _vendasAdicionarNoCarrinhController.buscarProdutos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => {Modular.to.navigate("/vendas")},
        ),
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text('Adicionar vendas'),
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey[100],
      body: SafeArea(
          child: Stack(
        children: [
          Container(),
          Positioned.fill(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.cartItems.length,
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) => Card(
                child: Container(
                  height: 110,
                  padding: const EdgeInsets.all(15),
                  width: 100,
                  margin: const EdgeInsets.all(2),
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  controller.cartItems[index].nome)),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.cartItems[index].nome,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  controller.cartItems[index].nome,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                controller.cartItems[index].preco.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            color: Colors.grey[200],
                            child: const Icon(Icons.remove),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                controller.cartItems[index].qtd.toString()),
                          ),
                          Container(
                            color: Colors.grey[200],
                            child: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                shadowColor: Colors.grey[600],
                elevation: 1,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16,
                bottom: 8.0,
                top: 4.0,
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Total",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Text(
                              "100.00 AOA",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () async => {},
                              child: const Text("Finalizar"),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  vertical: 15,
                                ),
                                primary: Colors.orange,
                                textStyle: const TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              )))
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            _showAddToCartModal(
                                context, _vendasAdicionarNoCarrinhController);
                          },
                          child: const Text(
                            "Adicionar produtos",
                            style: TextStyle(color: Color(0xFF323232)),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            textStyle: const TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                            ),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                              side: BorderSide(
                                  color: Color(0xFFC1C1C1), width: 1),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}

Future<void> _showAddToCartModal(
    BuildContext context,
    VendasAdicionarNoCarrinhController
        _vendasAdicionarNoCarrinhoController) async {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Adicionar ao Carrinho',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ListView.builder(
                      itemCount:
                          _vendasAdicionarNoCarrinhoController.produtos.length,
                      itemBuilder: (context, index) {
                        return _buildProductItem(
                            _vendasAdicionarNoCarrinhoController
                                .produtos[index].nome,
                            _vendasAdicionarNoCarrinhoController
                                .produtos[index].codigo,
                            Mat.numeroParaDinheiro(
                                _vendasAdicionarNoCarrinhoController
                                    .produtos[index].preco),
                            _vendasAdicionarNoCarrinhoController
                                .produtos[index].stock);
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              onChanged: (value) async => {
                await _vendasAdicionarNoCarrinhoController.filtrar(value),
              },
              decoration: InputDecoration(
                hintText: 'Escreva para filtrar',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget _buildCategoryItem(String categoryName) {
  return ListTile(
    title: Text(categoryName),
  );
}

Widget _buildProductItem(
    String productName, String description, String price, int stock) {
  return Card(
      child: Padding(
    padding: EdgeInsets.all(5),
    child: ListTile(
      title: Text(
        productName,
        style: TextStyle(fontSize: 18),
      ),
      subtitle: Text("Código: " + description + "\nStock:" + stock.toString()),
      trailing: Text(
        price,
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    ),
  ));
}
