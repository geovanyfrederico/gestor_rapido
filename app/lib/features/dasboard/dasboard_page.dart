import 'package:flutter/material.dart';
import 'package:gr/wigets/menu_drawer.dart';

import '../../core/utils/mat.dart';
import '../../core/utils/tempo.dart';
import '../../models/venda_model.dart';
import '../vendas/visualizar/visualizar_modal_page.dart';
import 'dasboard_controller.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  DashboardController controller = DashboardController();

  @override
  void initState() {
    super.initState();
    controller.init().then((value) => {
      setState(() {})
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      drawer:  MenuDrawer(),
      appBar: AppBar(
        title: const Text('Resumo de Vendas'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: Colors.orange,

                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children:  [
                          Text(
                            'Hoje',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          SizedBox(height: 8.0),
                          Text(controller.vendasDiariasDinheiro,
                            style: TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children:  [
                          Text(
                            'Esta semana',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8.0),
                          Text( controller.vendasSemanaisDinheiro,
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            'Mês',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8.0),
                          Text(controller.vendasMensaisDinheiro,
                            style: const TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32.0),
            const Text(
              'Últimas Vendas',
              style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: FutureBuilder<List<VendaModel>>(
                future: controller.ultimasVendas(),
                builder: (context, snapshot)  {
                  if(snapshot.connectionState != ConnectionState.done){
                    return const Center(child: CircularProgressIndicator());
                  }
                  // Erro
                  if(snapshot.hasError){
                    return const Center(child: Text("Ocorreu um erro ao buscar os vendas."));
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
                        const Text("Sem vendas",
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
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => Card(
                      elevation: 1,
                      margin: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 5),
                      child: Padding(
                          padding:EdgeInsets.all(5) ,
                          child:
                          ListTile(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return VisualizarModalPage(venda: snapshot.data![index]);
                                  },
                                );
                              },
                              title: Text("Venda "+snapshot.data![index].id.toString()),
                              subtitle: Text("Qtd: ${snapshot.data![index].totalQtd.toString()}\nData: ${Tempo.formatarData(snapshot.data![index].data.toString())}"),
                              trailing:  Text(Mat.numeroParaDinheiro(snapshot.data![index].totalPagar.toString()))
                          )),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

