import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gr/core/utils/mat.dart';
import 'package:gr/core/utils/tempo.dart';
import 'package:gr/features/relatorios/clientes/relatorios_clientes_controller.dart';
import 'package:gr/models/cliente_model.dart';
import 'package:gr/wigets/date_range_selector.dart';

import '../../vendas/adicionar/wigets/cliente_modal/cliente_modal_page.dart';

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
        Container(
          margin: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color:Colors.grey[300]!,
              width: 1,
            ),
          ),
          child: Card(
              elevation: 0,
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    onTap: () {

                    },
                    title: Center(
                      child: const Text("Resumo",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
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
                            const Text("Qtd Vendas"),
                            Text(controller.vendas.length.toString()),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Qtd items"),
                            Text(controller.totalQtd.toString()),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Total vendas"),
                            Text(Mat.numeroParaDinheiro(controller.totalPagar)),
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
                            Text(Mat.numeroParaDinheiro(controller.menorVenda)),
                          ],
                        ),
                      ],
                    ),
                  ))),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color:Colors.grey[300]!,
              width: 1,
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
                      "Vendas (${controller.vendas.length})",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  subtitle:listagemDeVendas(context)
              ),
            ),
          ),
        )

      ],
    );
  }
  Widget listagemDeVendas(BuildContext context){
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: SizedBox(

        height: 200, // Defina uma altura fixa para o ListView interno ou ajuste conforme necessário
        child: ListView.builder(
          shrinkWrap: true, // Defina shrinkWrap como true
          itemCount: controller.vendas.length,
          itemBuilder: (context, index) => SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: SizedBox(
              height: 200, // Defina uma altura fixa para o ListView interno ou ajuste conforme necessário
              child: ListView.builder(
                shrinkWrap: true, // Defina shrinkWrap como true
                itemCount: controller.vendas.length,
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Venda ${controller.vendas[index].id.toString()} \nData: ${Tempo.formatarData(controller.vendas[index].data)}\nUtilizador: ${controller.vendas[index].utilizadorModel?.nome}"),

                        Text("${Mat.numeroParaDinheiro(controller.vendas[index].totalPagar)}"),
                      ],
                    ),
                    // Aqui você pode adicionar mais widgets e personalizar a exibição de cada item do ListView
                    // utilizando os dados de produtoNaVenda
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
