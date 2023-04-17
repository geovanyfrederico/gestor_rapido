import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:gr/theme/theme1.dart';
import 'package:gr/src/controllers/Auth/recuperar_pin_controller.dart';

class RecuperarPinCodigoView extends StatelessWidget {
  final RecuperarPinController controlador =
  Get.put(RecuperarPinController()); // Adicione o controller aqui
  RecuperarPinCodigoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Au()));
          },
        ),
        title: Center(child: Text('Recuperar Senha')),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 60, left: 40, right: 40),
        child: Form(
            key: controlador.formulario,
            child: ListView(children: [
              Text(
                'Insere o código de 6 dígitos enviado para:',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                '"E-mail/Numero"',
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Insere o código',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: controlador.senhaVerificacao,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                alignment: Alignment.center,
                child: SizedBox.expand(
                  child: GFButton(
                    onPressed: () {
                      controlador.verificar();
                    },
                    text: "Confirmar",
                    color: Theme1.primary,
                    size: GFSize.LARGE,
                  ),
                ),
              ),
            ])),
      ),
    );
  }
}
