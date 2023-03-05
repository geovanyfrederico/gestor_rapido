import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:templates/src/config/app_theme.dart';
import 'package:templates/src/controllers/AuthController.dart';
import 'package:templates/src/views/produtos/listar.dart';

class ProdutosNovoView extends StatefulWidget {
  const ProdutosNovoView({super.key});

  @override
  State<StatefulWidget> createState() => Produtos();
}

class Produtos extends State<ProdutosNovoView> {
  bool numberInputIsValid = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProdutosListarView()));
          },
        ),
        title: Text('Cadastro Produtos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            Row(
              children: [
                Text('Nome do Produto'),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Nome do Produto:',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Text('Preço do Produto'),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: '00,AOA',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Text('Descrição do Produto'),
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
              maxLines: 8,
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        child: Text('Cadastrar Produto'),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProdutosListarView()));
        },
      ),
    );
  }
}
  /* TextField(
          keyboardType: TextInputType.number,
          style: Theme.of(context).textTheme.headline4,
          decoration: InputDecoration(
            icon: const Icon(Icons.attach_money),
            labelText: 'Enter an integer:',
            errorText: numberInputIsValid ? null : 'Please enter an integer!',
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
          )),*/