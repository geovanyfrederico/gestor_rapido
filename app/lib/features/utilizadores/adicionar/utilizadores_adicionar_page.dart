import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gr/features/utilizadores/adicionar/utilizadores_adicionar_controller.dart';
import 'package:gr/models/utilizador_model.dart';
class UtilizadorsAdicionarPage extends StatefulWidget  {
  const UtilizadorsAdicionarPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return UtilizadorsAdicionarState();
  }
}
class UtilizadorsAdicionarState extends State<UtilizadorsAdicionarPage> {
  final UtilizadorsAdicionarController controller = UtilizadorsAdicionarController();
  String dropdownValue = 'Vendedor';
  List<String> options = ['Administrador', 'Vendedor', 'Gerente'];
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
            Modular.to.navigate("/utilizadores")
          },
        ),
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text('Adicionar utilizadores'),
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
          child:  Container(
            padding:  const EdgeInsets.only(left: 20, top: 40, right: 20, bottom: 20),
            child:  ListView(
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
                              hintText: 'Nome',
                              counterText: "",
                              prefixIcon: Icon(Icons.person),
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
                            keyboardType: TextInputType.number,
                            maxLength: 4,
                            controller: controller.pin,
                            // Every single time the text changes in a
                            // TextField, this onChanged callback is called
                            // and it passes in the value.
                            //
                            // Set the text of your controller to
                            // to the next value.
                            obscureText: true,
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
                              hintText: 'Pin',
                              counterText: "",
                              prefixIcon: Icon(Icons.key),
                            )
                        )
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      width: 10000,
                      color: Colors.grey[300],
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          onChanged: ( newValue) {

                            switch (newValue){
                              case 'Administrador':
                                controller.tipo.text = UtilizadorModel.tipoAdministrador.toString();
                                break;
                              case 'Vendedor':
                                controller.tipo.text = UtilizadorModel.tipoVendedor.toString();
                                break;
                              case 'Gerente':
                                controller.tipo.text = UtilizadorModel.tipoGerente.toString();
                                break;
                            }
                            setState(() {
                               dropdownValue = newValue!;
                            });
                          },
                          items: options.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                          underline: Container(
                            height: 0,
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}

