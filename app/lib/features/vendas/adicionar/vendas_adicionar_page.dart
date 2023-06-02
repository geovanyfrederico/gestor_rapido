import 'dart:developer';
import 'package:gr/features/vendas/adicionar/vendas_adicionar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gr/features/vendas/adicionar/wigets/payment_modal.dart';
import 'package:gr/features/vendas/adicionar/wigets/produtos_no_carrinho_page.dart';

import '../../../models/produto_model.dart';

class VendasAdicionarPage extends StatefulWidget {
  const VendasAdicionarPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return VendasAdicionarState();
  }
}

class VendasAdicionarState extends State<VendasAdicionarPage> {
  final VendasAdicionarController controller = VendasAdicionarController();

  String? valorFilho;

  // Função de callback para receber o valor do filho
  void adicionarAoCarrinho(ProdutoModel produto) {
    controller.adicionar(produto);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
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
        title: const Text('Vender'),
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey[100],
      body: SafeArea(
          child: Stack(
            children: [
              Container(),
              Positioned.fill(
                child: controller.produtos.isEmpty
                    ? Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            padding:
                            const EdgeInsets.only(right: 50, top: 50),
                            width: 360,
                            child: Image.asset(
                                'assets/images/ilustration/gr9.png')),
                        const Text(
                          'Adicione produtos ao carrinho',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 20),
                        )
                      ]),
                )
                    : ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.produtos.length,
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (context, index) => Card(
                    child: Container(
                      height: 90,
                      padding: const EdgeInsets.all(15),
                      width: 100,
                      margin: const EdgeInsets.all(2),
                      child: Row(
                        children: [
                          CircleAvatar(
                              radius: 35,
                              backgroundImage: AssetImage(controller
                                  .produtos[index].produto!
                                  .getFoto()),
                              backgroundColor: Colors.transparent),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.produtos[index].nome,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    controller
                                        .produtos[index].produto!.codigo,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    controller.produtos[index]
                                        .precoTotalToMoney(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.orange),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => {
                                  controller.removeQtd(index),
                                  setState(() {})
                                },
                                child: Container(
                                  color: Colors.grey[200],
                                  child: const Icon(Icons.remove),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(controller.produtos[index].qtd
                                    .toString()),
                              ),
                              GestureDetector(
                                  onTap: () => {
                                    controller.addQtd(index),
                                    setState(() {})
                                  },
                                  child: Container(
                                    color: Colors.grey[200],
                                    child: const Icon(Icons.add),
                                  ))
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
                              children: [
                                Text(
                                  controller.totalPagarToMoney(),
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
                                  onPressed: () async => {
                                    if(controller.podeFinalizarVenda(context)){
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (BuildContext context) {
                                          return PaymentModal(totalPagarDoCarrinho: controller.totalPagar, produtosDoCarrinho: controller.produtos,);
                                        },
                                      )
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
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () async {
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
                                    return ProdutoNoCarrinhoPage(callback: adicionarAoCarrinho);
                                  },
                                );
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
