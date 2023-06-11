import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gr/features/fornecedores/fornecedores_controller.dart';

import '../../models/fornecedor_model.dart';
import 'editar/fornecedor_editar_page.dart';


class FornecedoresPage extends StatefulWidget  {
  const FornecedoresPage({Key? key}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return FornecedoresListarView();
  }
}

class FornecedoresListarView extends State<FornecedoresPage> {
  final FornecedoresListarController controller = FornecedoresListarController();

  // Função de callback para receber o valor do filho
  void atualizado(bool atualizado) {
    if(atualizado){
      setState(() {});
    }
  }
  @override
  void initState() {
    super.initState();
    controller.buscarFornecedores().then((_) {
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
          Modular.to.navigate("/fornecedores/adicionar");
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
          child: controller.fornecedores.isEmpty ?
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
              const Text("Sem fornecedores",
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
                itemCount: controller.fornecedores.length,
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
                                  abrirModalEditarFornecedor(context, controller.fornecedores[index]);
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
                    title: Text(controller.fornecedores[index].nome),
                    subtitle: Text(controller.fornecedores[index].nif),
                    trailing: const Icon(Icons.arrow_right_alt_rounded),
                  ),
                ),
              )
          )

      ),
    );
  }
  abrirModalEditarFornecedor(BuildContext context, FornecedorModel fornecedor){
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return FornecedorEditarPage(fornecedor: fornecedor, callback: atualizado);
      },
    );
  }

}

