import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:gr/src/views/auth/entrar_view.dart';
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
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Get.to(EntrarView());
          },
        ),
        title: const Center(child: Text('Recuperar Senha')),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 60, left: 40, right: 40),
        child: Form(
<<<<<<< HEAD:app/lib/src/views/auth/newpageSenha.dart
            key: controlador.FormVerificar,
            child: ListView(children: [
              Text(
=======
            key: controlador.formulario,
            child:  ListView(children: [
              const  Text(
>>>>>>> 2fe34d72e838b7bdc82c2afdadbeb7e6b6a7e3c1:app/lib/src/views/auth/recuperar_pin_codigo_view.dart
                'Insere o código de 6 dígitos enviado para:',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const    Text(
                'E-mail/Numero',
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const  SizedBox(
                height: 16,
              ),
              const   Text(
                'Insere o código',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const    SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: controlador.codigo,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                ),
              ),
              const   SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                alignment: Alignment.center,
                child: SizedBox.expand(
                  child: GFButton(
                    onPressed: () {
                      controlador.verificarCodigo();
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
