import 'package:flutter/material.dart';
import 'package:gr/wigets/menu_drawer.dart';

import 'empresa_controller.dart';
class EmpresaPage extends StatefulWidget  {
  const EmpresaPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return EmpresaPageState();
  }
}
class EmpresaPageState extends State<EmpresaPage> {
  final EmpresaController controller = EmpresaController();
  @override
  void initState() {
    super.initState();
    iniciar();
  }
  Future<void> iniciar() async{
    await controller.init();
    setState(() {


    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:  MenuDrawer(),
      appBar: AppBar(

        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text('Gerir empresa'),
      ),
      resizeToAvoidBottomInset:false,
      backgroundColor: Colors.grey[100],
      floatingActionButton: Container(
        width: 130,
        height: 40,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.orange
          ),
          onPressed: () {
            controller.atualizar(context);
            setState(() {

            });
          },
          child:  Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.save),
                Text(" Atualizar")
              ],
            ),
          ),
        ),
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
                            hintText: 'NIF *',
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

