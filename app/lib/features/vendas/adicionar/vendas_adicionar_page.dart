import 'dart:io';
import 'package:gr/features/vendas/adicionar/vendas_adicionar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class VendasAdicionarPage extends StatefulWidget {
  const VendasAdicionarPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return VendasAdicionarState();
  }
}

class VendasAdicionarState extends State<VendasAdicionarPage> {
  final VendasAdicionarController controller = VendasAdicionarController();
  File? imageFile;

  @override
  void initState() {
    super.initState();
    controller.buscarCategorias().then((_) => {setState(() {})});
  }

  _init() {}
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
                            _showAddToCartModal(context);
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

void _showAddToCartModal(BuildContext context) {
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
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Pesquisar Produtos',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return _buildCategoryItem('Categoria ${index + 1}');
                      },
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return _buildProductItem(
                          'Produto ${index + 1}',
                          'Descrição do Produto ${index + 1}',
                          'R\$ ${10 + index * 10},00',
                        );
                      },
                    ),
                  ),
                ],
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

Widget _buildProductItem(String productName, String description, String price) {
  return Card(
    child: ListTile(
      title: Text(productName),
      subtitle: Text(description),
      trailing: Text(price),
    ),
  );
}

class Product {
  final String name;
  final String imageUrl;
  final String category;

  Product({required this.name, required this.imageUrl, required this.category});
}

class Category {
  final String name;
  final String imageUrl;

  Category({required this.name, required this.imageUrl});
}

final List<Category> categories = [
  Category(
      name: "Eletrônicos", imageUrl: "https://picsum.photos/id/237/200/300"),
  Category(name: "Roupas", imageUrl: "https://picsum.photos/id/238/200/300"),
  Category(name: "Livros", imageUrl: "https://picsum.photos/id/239/200/300"),
  Category(name: "Outro", imageUrl: "https://picsum.photos/id/239/200/300"),
  Category(name: "Outro2", imageUrl: "https://picsum.photos/id/239/200/300"),
  Category(name: "Outro4", imageUrl: "https://picsum.photos/id/239/200/300"),
  Category(name: "Outro4234", imageUrl: "https://picsum.photos/id/239/200/300"),
  Category(
      name: "Outro42343", imageUrl: "https://picsum.photos/id/239/200/300"),
];

final List<Product> products = [
  Product(
      name: "iPhone 12",
      imageUrl: "https://picsum.photos/id/240/300/200",
      category: "Eletrônicos"),
  Product(
      name: "Samsung Galaxy S21",
      imageUrl: "https://picsum.photos/id/241/300/200",
      category: "Eletrônicos"),
  Product(
      name: "Camisa Polo",
      imageUrl: "https://picsum.photos/id/242/300/200",
      category: "Roupas"),
  Product(
      name: "Calça Jeans",
      imageUrl: "https://picsum.photos/id/243/300/200",
      category: "Roupas"),
  Product(
      name: "O Pequeno Príncipe",
      imageUrl: "https://picsum.photos/id/244/300/200",
      category: "Livros"),
  Product(
      name: "Dom Casmurro",
      imageUrl: "https://picsum.photos/id/245/300/200",
      category: "Livros"),
];
