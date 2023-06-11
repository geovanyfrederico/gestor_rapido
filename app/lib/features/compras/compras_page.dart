import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gr/core/utils/mat.dart';
import 'package:gr/core/utils/tempo.dart';
import 'package:gr/features/compras/compras_controller.dart';
import 'package:gr/features/compras/visualizar/visualizar_modal_page.dart';
import 'package:gr/wigets/menu_drawer.dart';

import '../../models/compra_model.dart';

class ComprasPage extends StatefulWidget {
  const ComprasPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ComprasPageState();
  }

}
class ComprasPageState extends State<ComprasPage> {
  ComprasController controller = ComprasController();

  @override
  void initState() {
    super.initState();

  }
  void _eliminar(int? id, BuildContext context) {
    controller.eliminar(id, context).then((_) {
      setState(() {}); // Atualiza o estado para construir a lista após os dados terem sido buscados
    });
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:  MenuDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text('Compras'),
        actions: [

          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showModalBottomSheet(
                context: context, barrierColor: Colors.black.withAlpha(1),
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) {
                  return Container(
                    height: 80,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Center(
                        child: TextField(
                            keyboardType: TextInputType.text,
                            maxLength: 50,
                            autocorrect: false,
                            controller: controller.filtro,
                            // Every single time the text changes in a
                            // TextField, this onChanged callback is called
                            // and it passes in the value.
                            //
                            // Set the text of your controller to
                            // to the next value.
                            onChanged:(value) {
                              setState(() {

                              });
                            },
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                              border: InputBorder.none,
                              hintText: 'Escreva para pesquisar',
                              counterText: "",
                            )
                        )
                    ),
                  );
                },
              );
            },
          ),

        ],
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey[100],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.navigate("/compras/adicionar");
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: FutureBuilder<List<CompraModel>>(
          future: controller.buscar(),
          builder: (context, snapshot)  {
            if(snapshot.connectionState != ConnectionState.done){
              return const Center(child: CircularProgressIndicator());
            }
            // Erro
            if(snapshot.hasError){
              return const Center(child: Text("Ocorreu um erro ao buscar os compras."));
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
                              return VisualizarModalPage(compra: snapshot.data![index]);
                            },
                          );
                        },
                        title: Text("Compra "+snapshot.data![index].id.toString()),
                        subtitle: Text("Qtd: ${snapshot.data![index].totalQtd.toString()}\nData: ${Tempo.formatarData(snapshot.data![index].data.toString())}"),
                        trailing:  Text(Mat.numeroParaDinheiro(snapshot.data![index].totalPagar.toString()))
                    )),
              ),
            );
          },
        ),
      ),
    );
  }


}


