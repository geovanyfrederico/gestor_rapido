import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gr/features/entrar/entrar_controller.dart';
import 'package:gr/features/recuperar_pin/recuperar_pin_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecuperarPinPage extends StatefulWidget {
  const RecuperarPinPage({Key? key}) : super(key: key);

  @override
  _RecuperarPinPageState createState() => _RecuperarPinPageState();
}


class _RecuperarPinPageState extends State<RecuperarPinPage> {
  final RecuperarPinController _controller = RecuperarPinController();
  final RecuperadoPinController _controllerRecuperado = RecuperadoPinController();
  late bool enviado = false;
  late bool codigoEnviado = false;
  late bool verificado = false;
  late SharedPreferences _prefs;
  @override
  void initState() {
    super.initState();
    codigoEnviado  = false;
    verificado = false;
  }

  Future<void> enviarCodigo(BuildContext context) async {
    await _controller.enviarCodigo(context) ? setState(() {codigoEnviado = true;}): null;
  }
  Future<void>  verificarCodigo(context) async{
    await _controller.verificarCodigo(context) ? inseririrNovoPin(context) : null;
  }
  Future<void>  inseririrNovoPin(context) async{
    setState(() {
      verificado = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[10],
        body: Container(
          padding: const EdgeInsets.only(top: 0, left: 40, right: 40),
          child: verificado ? novoPin(context) :  ListView(
            children: [
              SizedBox(
                  height: 220,
                  child: Image.asset('assets/images/ilustration/gr10.png')
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'ESQUECEU O PIN?',
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
                'Insira o seu numero de telefone para recuperar o pin',
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
                      padding: const EdgeInsets.only(bottom: 0),
                      child: TextField(
                          keyboardType: TextInputType.phone,
                          maxLength: 9,
                          controller: _controller.telefone,
                          enabled:   codigoEnviado ? false : true,
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
                          )
                      )
                  ),
                  codigoEnviado ?  Padding(
                      padding: const EdgeInsets.only(bottom: 0, top: 20),
                      child: TextField(
                          keyboardType: TextInputType.number,
                          maxLength: 4,
                          controller: _controller.codigo,
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
                            hintText: 'Código de verificação',
                            counterText: "",


                          )
                      )
                  ) : const SizedBox(height: 0) ,
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: SizedBox.expand(
                      child: ElevatedButton(
                          onPressed: () async => {
                            codigoEnviado ? verificarCodigo(context) : enviarCodigo(context)
                          },
                          child:   codigoEnviado ?  Text("Verificar") :  Text("Enviar Código")  ,
                          style: ElevatedButton.styleFrom(
                            primary: codigoEnviado ?  Colors.green :  Colors.orange  ,
                            textStyle: const TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    margin: const EdgeInsetsDirectional.only(top: 5),
                    alignment: Alignment.center,
                    child: SizedBox.expand(
                      child: TextButton(
                          onPressed: () => Modular.to.navigate('/entrar'),
                          child: const Text("Entrar"),
                          style: TextButton.styleFrom(
                            primary: Colors.orange[300],
                            textStyle: const TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
    );
  }


  Widget novoPin(BuildContext context){
    return  ListView(
      children: [
        SizedBox(
            height: 20,
        ),
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
          textAlign: TextAlign.center,
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
                    controller: _controllerRecuperado.novoPin,
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
                    controller: _controllerRecuperado.novoPinConfirmar,
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
                      await  _controllerRecuperado.mudarPin(context, _controller.telefone.value.text) ? Modular.to.navigate("/entrar") : null
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
    );
  }


}