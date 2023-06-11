import 'package:flutter/material.dart';
import 'package:gr/models/cliente_model.dart';
import 'cliente_editar_controller.dart';

class ClienteEditarPage extends StatefulWidget {
  const   ClienteEditarPage({
    Key? key, required this.cliente,  this.callback}) : super(key: key);

  final ClienteModel cliente;
  final Function(bool atualizado)? callback;
  @override
  ClienteEditarState createState() => ClienteEditarState();
}

class ClienteEditarState extends State<ClienteEditarPage> {
  final ClienteEditarController controller =
  ClienteEditarController();

  @override
  void initState() {
    super.initState();
    _init();

  }
  Future<void> _init() async {
    await controller.init(widget.cliente);
    setState(() {});
  }
  Future<void> _atualizar() async {
    final atualizado  = await controller.atualizar(context);
    widget.callback?.call(atualizado);
    setState(() {});
  }


  @override
  Widget build(BuildContext context)  {
    final screenHeight = MediaQuery.of(context).size.height;
    final targetHeight = screenHeight * 0.54; // 80% da altura da tela
    return SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child:  Container(
          height: targetHeight,
          padding:  const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          child:  ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          _atualizar();

                        },
                        child: const Text("Atualizar"),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          primary: Colors.orange,
                          textStyle: const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        )
    );


  }
}
