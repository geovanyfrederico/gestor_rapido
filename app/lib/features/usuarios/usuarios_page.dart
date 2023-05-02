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
                  subtitle: Text(snapshot.data![index].telefone),
                  trailing: const Icon(Icons.arrow_right_alt_rounded),
                ),
              ),
            );
          },
        ),
      ),
    );
  }


}


