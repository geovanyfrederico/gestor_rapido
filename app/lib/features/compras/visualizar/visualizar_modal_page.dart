import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gr/core/utils/mat.dart';
import 'package:gr/models/produto_na_compra_model.dart';
import 'package:gr/models/compra_model.dart';

import '../../../core/utils/tempo.dart';
import 'visualizar_modal_controller.dart';

class VisualizarModalPage extends StatefulWidget {
  const VisualizarModalPage({
    Key? key, required this.compra}) : super(key: key);

  final CompraModel compra;
  @override
  VisualizarModalState createState() => VisualizarModalState();
}

class VisualizarModalState extends State<VisualizarModalPage> {
  final VisualizarCompraController controller =
  VisualizarCompraController();

  @override
  void initState() {
    _init();
    super.initState();

  }
  Future<void> _init() async {
    await controller.init(widget.compra);
    setState(() {});
  }
  @override
  Widget build(BuildContext context)  {
    final screenHeight = MediaQuery.of(context).size.height;
    final targetHeight = screenHeight *0.9; // 80% da altura da tela

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child:  SizedBox(
          height: targetHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                  elevation: 1,
                  margin: const EdgeInsets.only(
                      left: 10, top: 10, right: 10, bottom: 5),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        onTap: () {

                        },
                        title: const Text("Informações da compra",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Cliente",
                                ),
                                Text(controller.cliente.nome),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Vendedor",
                                ),
                                Text(controller.utilizador.nome),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Data"),
                                Text(Tempo.formatarData(controller.compra.data)),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Pagamento"),
                                Text("Dinheiro"),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Total Pagar"),
                                Text(Mat.numeroParaDinheiro(controller.compra.totalPagar)),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Total Pago"),
                                Text(Mat.numeroParaDinheiro(controller.compra.totalPago)),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Troco"),
                                Text(Mat.numeroParaDinheiro(controller.compra.troco)),
                              ],
                            ),
                          ],
                        ),
                      ))),
              Card(
                  elevation: 1,
                  margin: const EdgeInsets.only(
                      left: 10, top: 10, right: 10, bottom: 5),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                          onTap: () {},
                          title: const Text(
                              "Produtos Vendidos",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)
                          ),
                          subtitle: FutureBuilder<List<ProdutoNaCompraModel>>(
                            future: controller.produtos(),
                            builder: (context, snapshot) {
                              if(snapshot.connectionState != ConnectionState.done){
                                return const Center(child: CircularProgressIndicator());
                              }
                              // Erro
                              if(snapshot.hasError){
                                log(snapshot.error.toString());
                                log(snapshot.stackTrace.toString());
                                return const Center(child: Text("Ocorreu um erro ao carregar os produtos"));
                              }
                              // Lista vasia
                              if(snapshot.data!.isEmpty){
                                return Center(child: Column(
                                  crossAxisAlignment:CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        width: 300,
                                        height: 300,
                                        child: Image.asset('assets/images/ilustration/gr9.png')
                                    ),
                                    const Text("Sem compras",
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey
                                        ))
                                  ],
                                ));
                              }
                              // Tudo correu bem
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  final produtoNaCompra = snapshot.data![index];
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(snapshot.data![index].nome),
                                          Text("${snapshot.data![index].totalQtd} x ${snapshot.data![index].precoToMoney()}"),
                                        ],
                                      ),
                                      // Aqui você pode adicionar mais widgets e personalizar a exibição de cada item do ListView
                                      // utilizando os dados de produtoNaCompra
                                    ],
                                  );
                                },
                              );

                            },
                          )
                      )
                  )
              ),
              _buildFooter()
            ],
          )
      ),
    );


  }

  Widget _buildFooter() {
    return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /*  Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () async => {

                        },
                        child: const Text("Fechar"),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          primary: Colors.orange,
                          textStyle: const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ))
                ),
                SizedBox(width: 10),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () async => {

                        },
                        child: const Text("Fechar"),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          primary: Colors.orange,
                          textStyle: const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ))
                )
              ],
            )*/
          ],
        ));
  }
}
