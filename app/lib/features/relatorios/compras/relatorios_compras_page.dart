import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gr/features/relatorios/compras/relatorios_compras_controller.dart';
import 'package:gr/models/fornecedor_model.dart';

import '../../../core/utils/mat.dart';
import '../../../core/utils/tempo.dart';
import '../../../wigets/date_range_selector.dart';

class RelatoriosComprasPage extends StatefulWidget {
  const RelatoriosComprasPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return RelatoriosComprasState();
  }
}

class RelatoriosComprasState extends State<RelatoriosComprasPage> {
  final RelatoriosComprasController controller = RelatoriosComprasController();
  bool notInited = true;
  bool loading = false;
  // Função de callback para receber o valor do filho
  Future<void> setFornecedor(FornecedorModel fornecedor) async {
    controller.setFornecedor(fornecedor);
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
        title: const Text('Relatorios de compras'),
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
        compras(),
        topPorUtilizador(),
        topPorFornecedor(),
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
                        const Text("Qtd Compras"),
                        Text(controller.compras.length.toString()),
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
                        const Text("Total compras"),
                        Text(Mat.numeroParaDinheiro(controller.totalPagar)),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Maior compra"),
                        Text(Mat.numeroParaDinheiro(controller.maiorCompra)),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Menor compra"),
                        Text(Mat.numeroParaDinheiro(controller.menorCompra)),
                      ],
                    )
                  ],
                ),
              ))),
    );
  }
  Widget compras(){
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
                  "Compras (${controller.compras.length})",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              subtitle:listagemDeCompras(context)
          ),
        ),
      ),
    );
  }
  Widget listagemDeCompras(BuildContext context){
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: SizedBox(
        height: 150, // Defina uma altura fixa para o ListView interno ou ajuste conforme necessário
        child: ListView.builder(
          shrinkWrap: true, // Defina shrinkWrap como true
          itemCount: controller.compras.length,
          itemBuilder: (context, index) => SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: SizedBox(
              height: 200, // Defina uma altura fixa para o ListView interno ou ajuste conforme necessário
              child: ListView.builder(
                shrinkWrap: true, // Defina shrinkWrap como true
                itemCount: controller.compras.length,
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Compra ${controller.compras[index].id.toString()} \nData: ${Tempo.formatarData(controller.compras[index].data)}\nUtilizador: ${controller.compras[index].utilizadorModel?.nome}"),

                        Text("${Mat.numeroParaDinheiro(controller.compras[index].totalPagar)}"),
                      ],
                    ),
                    // Aqui você pode adicionar mais widgets e personalizar a exibição de cada item do ListView
                    // utilizando os dados de produtoNaCompra
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget topPorFornecedor(){
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
                    child: Text("Compras por fornecedors(${controller.comprasPorFornecedor.length})",
                        style: TextStyle( fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                  subtitle: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: SizedBox(
                      height: 150, // Defina uma altura fixa para o ListView interno ou ajuste conforme necessário
                      child: ListView.builder(
                        shrinkWrap: true, // Defina shrinkWrap como true
                        itemCount: controller.comprasPorFornecedor.length,
                        itemBuilder: (context, index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${controller.comprasPorFornecedor.keys.elementAt(index)?.nome} "),
                                Text(Mat.numeroParaDinheiro(controller.comprasPorFornecedor.values.elementAt(index).toString())),
                              ],
                            ),
                            // Aqui você pode adicionar mais widgets e personalizar a exibição de cada item do ListView
                            // utilizando os dados de produtoNaCompra
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
                    child: Text("Compras por utilizador(${controller.comprasPorUtilizador.length})",
                        style: TextStyle( fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                  subtitle: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: SizedBox(
                      height: 150, // Defina uma altura fixa para o ListView interno ou ajuste conforme necessário
                      child: ListView.builder(
                        shrinkWrap: true, // Defina shrinkWrap como true
                        itemCount: controller.comprasPorUtilizador.length,
                        itemBuilder: (context, index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${controller.comprasPorUtilizador.keys.elementAt(index)?.nome} "),
                                Text(Mat.numeroParaDinheiro(controller.comprasPorUtilizador.values.elementAt(index).toString())),
                              ],
                            ),
                            // Aqui você pode adicionar mais widgets e personalizar a exibição de cada item do ListView
                            // utilizando os dados de produtoNaCompra
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
