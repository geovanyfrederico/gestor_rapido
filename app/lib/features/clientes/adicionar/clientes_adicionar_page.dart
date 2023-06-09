import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'clientes_adicionar_controller.dart';
class ClientesAdicionarPage extends StatefulWidget  {
  const ClientesAdicionarPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ClientesAdicionarState();
  }
}
class ClientesAdicionarState extends State<ClientesAdicionarPage> {
  final ClientesAdicionarController controller = ClientesAdicionarController();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => {
            Modular.to.navigate("/contactos")
          },
        ),
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text('Adicionar clientes'),
      ),
      resizeToAvoidBottomInset:true,
      backgroundColor: Colors.grey[100],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.salvar(context);
          setState(() {

          });
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.save),
      ),
      body:  SafeArea(
          child:  ListView(
            padding:  const EdgeInsets.only(left: 20, top: 40, right: 20, bottom: 20),
            children: [
              Column(
                children:  [
                  Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextField(
                          keyboardType: TextInputType.text,
                          maxLength: 50,
                          autocorrect: false,
                          controller: controller.nome,
                          // Every single time the text changes in a
                          // TextField, this onChanged callback is called
                          // and it passes in the value.
                          //
                          // Set the text of your controller to
                          // to the next value.
                          decoration: const InputDecoration(
                            focusColor: Colors.orange,
                            filled: true,
                            contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.orange, width: 2.0),
                            ),
                            border: InputBorder.none,
                            hintText: 'Nome *',
                            counterText: "",
                            prefixIcon: Icon(Icons.person),
                          )
                      )
                  ),
                  Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: TextField(
                          keyboardType: TextInputType.text,

                          controller: controller.nif,
                          // Every single time the text changes in a
                          // TextField, this onChanged callback is called
                          // and it passes in the value.
                          //
                          // Set the text of your controller to
                          // to the next value.
                          obscureText: false,
                          decoration: const InputDecoration(
                            focusColor: Colors.orange,
                            filled: true,
                            contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.orange, width: 2.0),
                            ),
                            border: InputBorder.none,
                            hintText: 'NIF',
                            counterText: "",
                            prefixIcon: Icon(Icons.store),
                          )
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextField(
                          keyboardType: TextInputType.phone,
                          maxLength: 9,
                          controller: controller.telefone,
                          // Every single time the text changes in a
                          // TextField, this onChanged callback is called
                          // and it passes in the value.
                          //
                          // Set the text of your controller to
                          // to the next value.
                          decoration: const InputDecoration(
                            focusColor: Colors.orange,
                            filled: true,
                            contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.orange, width: 2.0),
                            ),
                            border: InputBorder.none,
                            hintText: 'Telefone',
                            counterText: "",
                            prefixIcon: Icon(Icons.phone),
                          )
                      )
                  ),

                  Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: TextField(
                          keyboardType: TextInputType.text,

                          controller: controller.endereco,
                          // Every single time the text changes in a
                          // TextField, this onChanged callback is called
                          // and it passes in the value.
                          //
                          // Set the text of your controller to
                          // to the next value.
                          obscureText: false,
                          decoration: const InputDecoration(
                            focusColor: Colors.orange,
                            filled: true,
                            contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.orange, width: 2.0),
                            ),
                            border: InputBorder.none,
                            hintText: 'Endereço',
                            counterText: "",
                            prefixIcon: Icon(Icons.add_location),
                          )
                      )
                  ),
                ],
              )
            ],
          )
      ),
    );
  }
}

