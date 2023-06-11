import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gr/features/clientes/clientes_controller.dart';

import '../../models/cliente_model.dart';
import 'editar/cliente_editar_page.dart';


class ClientesPage extends StatefulWidget  {
  const ClientesPage({Key? key}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return ClientesListarView();
  }
}

class ClientesListarView extends State<ClientesPage> {
  final ClientesListarController controller = ClientesListarController();

  // Função de callback para receber o valor do filho
  void atualizado(bool atualizado) {
    if(atualizado){

      setState(() {});
    }
  }
  @override
  void initState() {
    super.initState();
    controller.buscarClientes().then((_) {
      setState(() {});
    });
  }
  _eliminar(index, BuildContext context) async {
    await controller.eliminar(index, context);
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:true,
      backgroundColor: Colors.grey[100],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.navigate("/clientes/adicionar");
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
          child: controller.clientes.isEmpty ?
          Center(child:
          Column(
            crossAxisAlignment:CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 300,
                  height: 300,
                  child: Image.asset('assets/images/ilustration/concept.png')
              ),
              const Text("Sem clientes",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey
                  ))
            ],
          )
          ) :
          Padding(
              padding: const EdgeInsets.only(top: 10),
              child:   ListView.builder(
                itemCount: controller.clientes.length,
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
                              ListTile(
                                onTap: () {

                                  Navigator.pop(context);
                                  abrirModalEditarCliente(context, controller.clientes[index]);
                                },
                                leading: Icon(Icons.edit),
                                title: Text('Editar'),
                              ),
                              ListTile(
                                  leading: Icon(Icons.delete),
                                  title: Text('Eliminar'),
                                  onTap: () {
                                    _eliminar(index, context);
                                    Navigator.pop(context); // close the bottom sheet
                                  }
                              ),
                            ],
                          );
                        },
                      );
                    },
                    title: Text(controller.clientes[index].nome),
                    subtitle: Text(controller.clientes[index].nif),
                    trailing: const Icon(Icons.arrow_right_alt_rounded),
                  ),
                ),
              )
          )

      ),
    );
  }
  abrirModalEditarCliente(BuildContext context, ClienteModel cliente){
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return ClienteEditarPage(cliente: cliente, callback: atualizado);
      },
    );
  }

}

