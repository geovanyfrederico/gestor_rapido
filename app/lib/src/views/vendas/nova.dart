import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:gr/src/config/app_theme.dart';
import 'package:gr/src/controllers/AuthController.dart';
import 'package:gr/theme/theme1.dart';

class VendasNovaView extends StatelessWidget {
  final AuthController controller =
      Get.put(AuthController()); // Adicione o controller aqui
  VendasNovaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme1.primary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => VendasNovaView()));
          },
        ),
        title: Text('Vendas Produtos'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 6, right: 50, left: 50),
        child: Column(
          children: [
            IconButton(
                iconSize: 100,
                icon: Icon(
                  Icons.photo,
                ),
                onPressed: () {}),
            Row(
              children: [
                Text(
                  'Nome do Produto',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Nome do Produto:',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Text(
                  'Preço do Produto',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: '00,AOA',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Text(
                  'Descrição do Produto',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Insira a descrição do produto',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              maxLines: 5,
            ),
          ],
        ),
      ),
      floatingActionButton: GFButton(
        child: Text('Cadastrar Produto'),
        color: Theme1.primary,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => VendasNovaView()));
        },
      ),
    );
  }
}
