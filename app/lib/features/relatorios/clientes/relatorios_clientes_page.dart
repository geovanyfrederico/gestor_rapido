import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gr/features/relatorios/clientes/relatorios_clientes_controller.dart';
import 'package:gr/models/cliente_model.dart';

import '../../../core/utils/mat.dart';
import '../../../core/utils/tempo.dart';
import '../../../wigets/date_range_selector.dart';
import '../../vendas/adicionar/wigets/cliente_modal/cliente_modal_page.dart';
import '../../vendas/visualizar/visualizar_modal_page.dart';

class RelatoriosClientesPage extends StatefulWidget {
  const RelatoriosClientesPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return RelatoriosClientesState();
  }
}

class RelatoriosClientesState extends State<RelatoriosClientesPage> {
  final RelatoriosClientesController controller = RelatoriosClientesController();
  bool notInited = true;
  bool loading = false;
  // Função de callback para receber o valor do filho
  Future<void> setCliente(ClienteModel cliente) async {
    controller.setCliente(cliente);
    await controller.gerarRelatorios();
    setState(() {});
  }

  Future<void> setTime(DateTime?  inicio, DateTime?  fim) async {
    controller.setTime(inicio, fim);
    await controller.gerarRelatorios();
    setState(() {});
  }

  Future<void> gerarRelatorio() async {
    await controller.gerarRelatorios();
    setState(() {});
  }
  @override
  void initState() {
    super.initState();
    gerarRelatorio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => {Modular.to.navigate("/relatorios")},
        ),
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text('Relatorios de clientes'),
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey[100],
      body: SafeArea(
          child: Stack(
            children: [
              Container(),
              Positioned.fill(child: Center(
                child: relatorioPage(context),
              ),),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Card(
                          elevation: 0,
                          margin: const EdgeInsets.only(
                              left: 0, top: 0, right:0, bottom: 0),
                          child: Padding(
                              padding: EdgeInsets.all(0),
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
                              )
                          )
                      ),
                      Padding(
                          padding:
                          const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                          child: DateRangeSelector(callback: setTime)
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
  Widget relatorioPage(BuildContext context){
    if(loading){
      return const Center(child: CircularProgressIndicator());
    }

    return  Column(
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
                  title: const Text("Resumo",
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
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Data"),
                          Text("${Tempo.formatarDataNull(controller.inicio?.toIso8601String())}  - ${Tempo.formatarDataNull(controller.fim?.toIso8601String())}"),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Total pago"),
                          Text(Mat.numeroParaDinheiro(controller.totalPagar)),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Total Qtd"),
                          Text(controller.totalQtd.toString()),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Maior venda"),
                          Text(Mat.numeroParaDinheiro(controller.maiorVenda)),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Menor venda"),
                          Text(Mat.numeroParaDinheiro(controller.maiorVenda)),
                        ],
                      ),
                    ],
                  ),
                ))),
        Container(
          margin: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Color(0xFFF5F5F5),
              width: 2,
            ),
          ),
          child: Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                onTap: () {},
                title: Center(
                  child:  Text(
                    "Vendas(${controller.totalQtd.toString()})",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                subtitle: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: SizedBox(
                    height: 270, // Defina uma altura fixa para o ListView interno ou ajuste conforme necessário
                    child: ListView.builder(
                      shrinkWrap: true, // Defina shrinkWrap como true
                      itemCount: controller.vendas.length,
                      itemBuilder: (context, index) => Card(
                        elevation: 0,
                        margin: const EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 5),
                        child: Padding(
                          padding: EdgeInsets.all(0),
                          child: ListTile(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return VisualizarModalPage(venda: controller.vendas[index]);
                                },
                              );
                            },
                            title: Text("Venda " + controller.vendas[index].id.toString()),
                            subtitle: Text("Qtd: ${controller.vendas[index].totalQtd.toString()}\nData: ${Tempo.formatarData(controller.vendas[index].data.toString())}"),
                            trailing: Text(Mat.numeroParaDinheiro(controller.vendas[index].totalPagar.toString())),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )

      ],
    );
  }

}
