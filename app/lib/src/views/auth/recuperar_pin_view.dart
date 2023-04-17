import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:gr/src/views/auth/entrar_view.dart';
import 'package:gr/theme/theme1.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:gr/src/controllers/Auth/recuperar_pin_controller.dart';

class RecuperarPinView extends StatelessWidget {
  final RecuperarPinController controlador =
  Get.put(RecuperarPinController()); // Adicione o controller aqui
  RecuperarPinView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme1.cardTitleBg,
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Form(
          key: controlador.formulario,
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: 200, child: Image.asset('assets/images/Senha.png')),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Esqueceu o pin?',
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
              SizedBox(
                  width: 200,
                  height: 70,
                  child: PhoneFormField(
                    key: const Key('telefone'),
                    showFlagInInput:false,
                    controller: controlador.telefone,     // controller & initialValue value
                    initialValue: null,   // can't be supplied simultaneously
                    selectorNavigator: const DialogNavigator(),
                    defaultCountry: 'AO', // default
                    decoration: const InputDecoration(
                      focusColor: Theme1.primary,
                      fillColor: Theme1.gray,
                      filled: true,
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Theme1.primary, width: 2.0),
                      ),
                      border: InputBorder.none,
                      hintText: 'TELEFONE',
                    ),
                    // default
                    enabled: true,          // default
                    autofocus: true,       // default

                    // ... + other textfield params
                  )
              ),

              SizedBox(
                width: 200,
                height: 70,
                child: TextFormField(
                    controller: controlador.codigo,
                    enabled: controlador.codigoEnviado,
                    obscureText: true,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    maxLength: 4,
                    decoration: const InputDecoration(
                      focusColor: Theme1.primary,
                      fillColor: Theme1.gray,
                      filled: true,
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Theme1.primary, width: 2.0),
                      ),
                      border: InputBorder.none,
                      hintText: 'CÓDIGO',
                    )
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                alignment: Alignment.center,
                child: SizedBox.expand(
                  child: GFButton(
                    onPressed: () {
                      controlador.enviarCodigo();
                    },
                    text: "Enviar código",
                    color: Theme1.primary,
                    size: GFSize.LARGE,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
