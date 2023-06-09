import 'package:flutter/material.dart';
import 'package:gr/core/utils/mat.dart';
import 'package:gr/models/cliente_model.dart';
import 'package:gr/models/produto_model.dart';
import 'package:gr/models/produto_na_venda_model.dart';

import '../cliente_modal/cliente_modal_page.dart';
import 'finalizar_modal_controller.dart';

class FinalizarModalPage extends StatefulWidget {
  const FinalizarModalPage({
    Key? key,
    required this.produtosDoCarrinho,
    required this.totalPagarDoCarrinho,
    this.callback
  }) : super(key: key);

  final List<ProdutoNaVendaModel> produtosDoCarrinho;
  final double totalPagarDoCarrinho;
  final Function(double troco)? callback;
  @override
  _ModalContentState createState() => _ModalContentState();
}

class _ModalContentState extends State<FinalizarModalPage> {
  final FinalizarModalController controller =
  FinalizarModalController();

  // Função de callback para receber o valor do filho
  void setCliente(ClienteModel cliente) {
    controller.setCliente(cliente);
    setState(() {});
  }
  void _concluido( ) {
    widget.callback?.call(controller.troco);
  }
  void _update(){
    controller.calcularResumo();
    setState(() {});
  }
  @override
  void initState() {
    controller.init(widget.produtosDoCarrinho, widget.totalPagarDoCarrinho).then((value) => {
      setState(() {})
    });
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
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (BuildContext context) {
                                          return ClienteModalPage(callback: setCliente);
                                        },
                                      );
                                    },
                                    title: Text(controller.cliente.nome),
                                    subtitle: Text("NIF: ${controller.cliente.nif}"),
                                    trailing: const Icon(Icons.arrow_right_alt_rounded),
                                  ))),
                          Card(
                              elevation: 1,
                              margin: const EdgeInsets.only(
                                  left: 10, top: 10, right: 10, bottom: 5),
                              child: Padding(
                                  padding: EdgeInsets.all(2),
                                  child: ListTile(
                                    onTap: () {
                                      // Modular.to.navigate("/categorias");
                                    },
                                    title: Text("Dinheiro"),
                                    trailing: Icon(Icons.arrow_right_alt_rounded),
                                  ))),
                          Card(
                              elevation: 1,
                              margin: const EdgeInsets.only(
                                  left: 10, top: 10, right: 10, bottom: 5),
                              child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: ListTile(
                                    onTap: () { },
                                    title: Text("RESUMO",
                                        style: TextStyle(
                                            fontSize: 15, fontWeight: FontWeight.bold)),
                                    subtitle: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Total Pagar",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Text(
                                              Mat.numeroParaDinheiro(controller.totalPagar),
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Total Pago",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Text(
                                              Mat.numeroParaDinheiro(controller.totalPago),
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Troco",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Text(
                                              Mat.numeroParaDinheiro(controller.troco),
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
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
              controller: controller.totalPagoInput,
              decoration: const InputDecoration(
                hintText: 'Valor pago',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.money),
              ),
              onChanged: (value){
                _update();
              },
            ),
            SizedBox(height: 10),
            /*  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                    color: Colors.grey[300],
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Text("2.000"),
                    )),
                Card(
                    color: Colors.grey[300],
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Text("2.000"),
                    )),
                Card(
                    color: Colors.grey[300],
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Text("2.000"),
                    )),
                Card(
                    color: Colors.grey[300],
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Text("2.000"),
                    )),
                Card(
                    color: Colors.grey[300],
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Text("2.000"),
                    ))
              ],
            ),
            SizedBox(height: 16),*/
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () async => {
                          if  (await controller.finalizar(context)){
                            _concluido(),
                          }
                        },
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
