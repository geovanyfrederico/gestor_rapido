import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gr/features/usuarios/usuarios_controller.dart';
import 'package:gr/wigets/menu_drawer.dart';


class UsuariosVisualizarPage extends StatefulWidget  {
  const UsuariosVisualizarPage({Key? key}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return UsuariosVisualizarState();
  }
}

class UsuariosVisualizarState extends State<UsuariosVisualizarPage> {
  final UsuariosController controller = UsuariosController();
  @override
  void initState() {
    super.initState();
    controller.buscarUsuarios();

  }
  _showBottomModal(context) {

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => {
          Modular.to.navigate("/usuarios")
        },
        ),
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text('Usuarios'),
      ),
      resizeToAvoidBottomInset:true,
      backgroundColor: Colors.grey[100],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showBottomModal(context);
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
          child: ListView.builder(
            itemCount: controller.usuarios.length,
            itemBuilder: (context, index) => Card(
              elevation: 1,
              margin: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 5),
              child: ListTile(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Wrap(
                        children:  [
                          const ListTile(
                            leading: Icon(Icons.visibility),
                            title: Text('Visualizar'),
                          ),
                          const  ListTile(
                            leading: Icon(Icons.edit),
                            title: Text('Editar'),
                          ),
                          ListTile(
                              leading: Icon(Icons.delete),
                              title: Text('Eliminar'),
                              onTap: () {
                                //controller.delete(index);
                                Navigator.pop(context); // close the bottom sheet
                              }
                          ),
                        ],
                      );
                    },
                  );
                },
                title: Text(controller.usuarios[index].nome),
                subtitle: Text(controller.usuarios[index].telefone),
                trailing: const Icon(Icons.arrow_right_alt_rounded),
              ),
            ),
          )
      ),
    );
  }
}

