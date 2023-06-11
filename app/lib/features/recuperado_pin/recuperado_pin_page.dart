import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gr/features/recuperado_pin/recuperado_pin_controller.dart';

class RecuperadoPinPage extends StatefulWidget {
  const RecuperadoPinPage({Key? key, required String telefone}) : super(key: key);

  @override
  _RecuperadoPinPageState createState() => _RecuperadoPinPageState();
}


class _RecuperadoPinPageState extends State<RecuperadoPinPage> {
  final RecuperadoPinController _controller = RecuperadoPinController();


  @override
  void initState() {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[10],
        body: Container(
          padding: const EdgeInsets.only(top: 0, left: 40, right: 40),
          child:  ListView(
            children: [
              SizedBox(
                  height: 220,
                  child: Image.asset('assets/images/ilustration/gr1.png')
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'NOVO PIN',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Agora vamos definir um novo pin',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children:  [
                  Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextField(
                          keyboardType: TextInputType.number,
                          maxLength: 4,
                          controller: _controller.novoPin,
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
                            hintText: 'Pin',
                            counterText: "",
                          )
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: TextField(
                          keyboardType: TextInputType.number,
                          maxLength: 4,
                          controller: _controller.novoPinConfirmar,
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
                            hintText: 'Confirmar Pin',
                            counterText: "",
                          )
                      )
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: SizedBox.expand(
                      child: ElevatedButton(
                          onPressed: () async => {
                            await  _controller.mudarPin(context) ? Modular.to.popAndPushNamed("/entrar") : null
                          },
                          child:   const Text("Finalizar")  ,
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange  ,
                            textStyle: const TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                            ),
                          )
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

