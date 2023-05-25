import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/utils/mat.dart';
import '../../../../models/produto_model.dart';
import 'produtos_no_carrinho_controller.dart';

class PaymentModal extends StatefulWidget {
  const PaymentModal({Key? key}) : super(key: key);

  @override
  _ModalContentState createState() => _ModalContentState();
}

class _ModalContentState extends State<PaymentModal> {
  final ProdutoNoCarrinhoController _produtoNoCarrinhoPage =
      ProdutoNoCarrinhoController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        heightFactor: 0.9,
        child: SingleChildScrollView(
            child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 16, bottom: 15),
                child: const Text(
                  'Confirmação do pedido',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                  child: Column(
                children: [
                  Card(
                      elevation: 1,
                      margin: const EdgeInsets.only(
                          left: 10, top: 10, right: 10, bottom: 5),
                      child: Padding(
                          padding: EdgeInsets.all(2),
                          child: ListTile(
                            onTap: () {
                              Modular.to.navigate("/categorias");
                            },
                            title: Text("Consumidor Final"),
                            subtitle: Text("50000000"),
                            trailing: Icon(Icons.arrow_right_alt_rounded),
                          ))),
                  Card(
                      elevation: 1,
                      margin: const EdgeInsets.only(
                          left: 10, top: 10, right: 10, bottom: 5),
                      child: Padding(
                          padding: EdgeInsets.all(2),
                          child: ListTile(
                            onTap: () {
                              Modular.to.navigate("/categorias");
                            },
                            leading: Icon(Icons.money),
                            title: Text("Dinheiro"),
                          ))),
                  Card(
                      elevation: 1,
                      margin: const EdgeInsets.only(
                          left: 10, top: 10, right: 10, bottom: 5),
                      child: Padding(
                          padding: EdgeInsets.all(2),
                          child: ListTile(
                            onTap: () {
                              Modular.to.navigate("/categorias");
                            },
                            title: Text("Consumidor Final"),
                            subtitle: Text(
                                "NIF: 50000000 \nTel: +244 925924797 \nEnd: Benguela Lobito"),
                            trailing: Icon(Icons.arrow_right_alt_rounded),
                          ))),
                ],
              )),
              SizedBox(height: 16),
              _buildFooter()
            ],
          ),
        )));
  }

  Widget _buildProductItem(ProdutoModel produto) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ListTile(
          onTap: () {},
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

  Widget _buildFooter() {
    return Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Valor pago',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.money),
              ),
            ),
            SizedBox(height: 16),
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
            )
          ],
        ));
  }
}
