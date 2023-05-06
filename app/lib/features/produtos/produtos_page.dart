import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gr/features/produtos/produtos_controller.dart';
import 'package:gr/wigets/menu_drawer.dart';

import '../../core/utils/mat.dart';
import '../../models/produto_model.dart';
import '../../models/usuario_model.dart';

class ProdutosPage extends StatefulWidget {
  const ProdutosPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ProdutosPageState();
  }

}
class ProdutosPageState extends State<ProdutosPage> {
  ProdutosController controller = ProdutosController();

  @override
  void initState() {
    super.initState();

  }
  void _eliminar(int? id) {
    controller.eliminar(id).then((_) {
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
      drawer: const MenuDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text('Produtos'),
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
          Modular.to.navigate("/produtos/adicionar");
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: FutureBuilder<List<ProdutoModel>>(
          future: controller.buscar(),
          builder: (context, snapshot) {
            if(snapshot.connectionState != ConnectionState.done){
              return const Center(child: CircularProgressIndicator());
            }
            // Erro
            if(snapshot.hasError){
              return const Center(child: Text("Ocorreu um erro ao buscar os produtos."));
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
                  const Text("Sem produtos",
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
                child: ListTile(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Wrap(
                            children: [
                              ListTile(
                                leading: const Icon(Icons.visibility),
                                title: const Text('Visualizar'),
                                onTap: () {
                                  Modular.to.navigate("/usuarios/visualizar");
                                },
                              ),
                              const ListTile(
                                leading: Icon(Icons.edit),
                                title: Text('Editar'),
                              ),
                              ListTile(
                                leading: Icon(Icons.delete),
                                title: Text('Eliminar'),
                                onTap: () {
                                  _eliminar(snapshot.data![index].id);
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    title: Text(snapshot.data![index].nome),
                    subtitle: Text(snapshot.data![index].codigo),
                    leading: const Icon(Icons.person, size: 40),
                    trailing:  Text(Mat.numeroParaDinheiro(snapshot.data![index].preco.toString()))
                ),
              ),
            );
          },
        ),
      ),
    );
  }


}


