import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gr/features/usuarios/usuarios_controller.dart';
import 'package:gr/wigets/menu_drawer.dart';

import '../../models/usuario_model.dart';

class UsuariosPage extends StatefulWidget {
  const UsuariosPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return UsuariosPageState();
  }

}
class UsuariosPageState extends State<UsuariosPage> {
  UsuariosController controller = UsuariosController();

  @override
  void initState() {
    super.initState();
    controller.buscarUsuarios().then((_) {
      setState(() {}); // Atualiza o estado para construir a lista após os dados terem sido buscados
    });
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
        title: const Text('Utilizadores'),
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
          Modular.to.navigate("/usuarios/adicionar");
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(

        child: FutureBuilder<List<UsuarioModel>>(

          future: controller.buscarUsuarios(),
          builder: (context, snapshot) {
            if(snapshot.connectionState != ConnectionState.done){
              return const Center(child: CircularProgressIndicator());
            }
            // Erro
            if(snapshot.hasError){
              return const Center(child: Text("Ocorreu um erro ao buscar os usuários."));
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
                      child: Image.asset('assets/images/ilustration/concept.png')
                  ),
                  const Text("Sem usuarios",
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
              itemBuilder: (context, index) =>
                  Card(
                    elevation: 1,
                    margin: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 5),
                    child: ListTile(
                      contentPadding:const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10) ,
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (bcontext) {
                            return Wrap(
                              children: [
                                ListTile(
                                  leading: Icon(Icons.edit),
                                  title: Text('Editar'),
                                  onTap: (){
                                    log("Editar");
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.bar_chart),
                                  title: const Text('Relatorios'),
                                  onTap: () {
                                    log("Visualizar");
                                    Modular.to.navigate("/usuarios/visualizar?id=${snapshot.data![index].id}");
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.delete, color: Colors.red,),
                                  title: Text('Eliminar', style: TextStyle(
                                      color: Colors.red
                                  ),),
                                  onTap: () {
                                    log("eliminar");
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
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(snapshot.data![index].telefone),
                          Text(snapshot.data![index].tipoDescricao())
                        ],
                      ),
                      leading:CircleAvatar(
                        backgroundColor: Colors.orangeAccent,
                        child: Text(
                          "${snapshot.data![index].nome[0].toUpperCase()}",
                          style: TextStyle(fontSize: 20.0,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),

                  ),
            );
          },
        ),
      ),
    );
  }


}


