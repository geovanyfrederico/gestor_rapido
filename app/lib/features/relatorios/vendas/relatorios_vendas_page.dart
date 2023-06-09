import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gr/features/relatorios/vendas/relatorios_vendas_controller.dart';
import 'package:gr/models/cliente_model.dart';
import '../../../core/utils/mat.dart';
import '../../../core/utils/tempo.dart';
import '../../../wigets/date_range_selector.dart';

class RelatoriosVendasPage extends StatefulWidget {
  const RelatoriosVendasPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return RelatoriosVendasState();
  }
}

class RelatoriosVendasState extends State<RelatoriosVendasPage> {
  final RelatoriosVendasController controller = RelatoriosVendasController();
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
        title: const Text('Relatorios de vendas'),
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Center(
                child: SingleChildScrollView(
                  child: relatorioPage(context),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                      child: DateRangeSelector(callback: setTime),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget relatorioPage(BuildContext context){
    if(loading){
      return const Center(child: CircularProgressIndicator());
    }

    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        resumo(),
        vendas(),
        topPorUtilizador(),
        topPorCliente(),
        SizedBox(height: 150 )
      ],
    );
  }
  Widget resumo(){
    return Container(
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
                    )
                  ],
                ),
              ))),
    );
  }
  Widget vendas(){
    return Container(
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
    );
  }
  Widget listagemDeVendas(BuildContext context){
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: SizedBox(
        height: 150, // Defina uma altura fixa para o ListView interno ou ajuste conforme necessário
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

  Widget topPorCliente(){
    return Container(
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
                  onTap: () { },
                  title:  Center(
                    child: Text("Vendas por clientes(${controller.vendasPorCliente.length})",
                        style: TextStyle( fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                  subtitle: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: SizedBox(
                      height: 150, // Defina uma altura fixa para o ListView interno ou ajuste conforme necessário
                      child: ListView.builder(
                        shrinkWrap: true, // Defina shrinkWrap como true
                        itemCount: controller.vendasPorCliente.length,
                        itemBuilder: (context, index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${controller.vendasPorCliente.keys.elementAt(index)?.nome} "),
                                Text(Mat.numeroParaDinheiro(controller.vendasPorCliente.values.elementAt(index).toString())),
                              ],
                            ),
                            // Aqui você pode adicionar mais widgets e personalizar a exibição de cada item do ListView
                            // utilizando os dados de produtoNaVenda
                          ],
                        ),
                      ),
                    ),
                  )
              )
          )
      ),
    );
  }
  Widget topPorUtilizador(){
    return Container(
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
                  onTap: () { },
                  title:  Center(
                    child: Text("Vendas por utilizador(${controller.vendasPorUtilizador.length})",
                        style: TextStyle( fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                  subtitle: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: SizedBox(
                      height: 150, // Defina uma altura fixa para o ListView interno ou ajuste conforme necessário
                      child: ListView.builder(
                        shrinkWrap: true, // Defina shrinkWrap como true
                        itemCount: controller.vendasPorUtilizador.length,
                        itemBuilder: (context, index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${controller.vendasPorUtilizador.keys.elementAt(index)?.nome} "),
                                Text(Mat.numeroParaDinheiro(controller.vendasPorUtilizador.values.elementAt(index).toString())),
                              ],
                            ),
                            // Aqui você pode adicionar mais widgets e personalizar a exibição de cada item do ListView
                            // utilizando os dados de produtoNaVenda
                          ],
                        ),
                      ),
                    ),
                  )
              )
          )
      ),
    );
  }

}
