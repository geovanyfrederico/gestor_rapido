import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:getwidget/getwidget.dart';
import 'package:gr/src/config/app_theme.dart';
import 'package:gr/src/controllers/controlador_padrao.dart';
import 'package:gr/src/views/produtos/listar.dart';
import 'package:gr/src/controllers/outros/ProdutoController.dart';
import 'package:gr/theme/theme1.dart';

class ProdutosNovoView extends StatefulWidget {
  const ProdutosNovoView({super.key});

  @override
  State<StatefulWidget> createState() => Produtos();
}

class Produtos extends State<ProdutosNovoView> {
  final ProdutoController controladorProduto = Get.put(ProdutoController());
  bool numberInputIsValid = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme1.primary,
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
        key: controladorProduto.FormRegistarProduto,
        padding: const EdgeInsets.only(top: 6, right: 50, left: 50),
        child: Column(
          children: [
            Center(
              child: Stack(children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    border: Border.all(width: 4, color: Colors.white),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.1),
                      )
                    ],
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage('')),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 4, color: Colors.white),
                        color: Theme1.primary),
                    child: Icon(Icons.photo_camera, color: Colors.white),
                  ),
                )
              ]),
            ),
            SizedBox(
              height: 10.0,
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: controladorProduto.nomeDoProduto,
              decoration: InputDecoration(
                labelText: 'Nome do Produto:',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Campo obrigatório';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: controladorProduto.preco,
              decoration: InputDecoration(
                labelText: '00,AOA',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Campo obrigatório';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: controladorProduto.descricao,
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
          controladorProduto.CadastrarProduto();
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
