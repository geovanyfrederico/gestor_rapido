import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:gr/src/views/auth/entrar_view.dart';
import 'package:gr/theme/theme1.dart';
import 'package:gr/src/controllers/Auth/registar_controller.dart';
import 'package:phone_form_field/phone_form_field.dart';


class RegistarView extends StatelessWidget {
  final RegistarController controlador =
  Get.put(RegistarController()); // Adicione o controller aqui
  RegistarView
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Theme1.cardTitleBg,
          padding: const EdgeInsets.only(top: 60, left: 25, right: 25),
          child: Form(
            key: controlador.formulario,
            child: ListView(
              children: [
                SizedBox(
                    width: 128,
                    height: 128,
                    child: Image.asset('assets/images/logo.png')),
                Text(
                  'Criar uma nova conta',
                  style: Theme1.h1TextStyle(),
                  textAlign: TextAlign.center,
                ),
                const Divider(),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                    width: 200,
                    height: 70,
                    child: PhoneFormField(
                      key: const Key('telefone'),

                      showFlagInInput:false,
                      controller: null,     // controller & initialValue value
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
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: 200,
                  height: 70,
                  child: TextFormField(
                    key: const Key('pin'),
                    controller: controlador.pin,
                    obscureText: true,
                    keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
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
                      hintText: 'PIN',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),

                SizedBox(
                  width: 200,
                  height: 70,
                  child: TextFormField(
                    key: const Key('empresa'),
                    controller: controlador.nomeDaEmpresa,
                    obscureText: false,
                    keyboardType: TextInputType.text,
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
                      hintText: 'NOME DA EMPRESA',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: 200,
                  height: 70,
                  child: TextFormField(
                    key: const Key('nif'),
                    controller: controlador.nif,
                    keyboardType: TextInputType.text,
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
                      hintText: 'NIF',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  alignment: Alignment.center,
                  child: SizedBox.expand(
                    child: GFButton(
                      onPressed: () async {
                        await controlador.registar() ? Get.off(EntrarView()) : null;
                      },
                      text: "Cadastre-se",
                      color: Theme1.primary,
                      size: GFSize.SMALL,
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      Get.to(EntrarView());
                    },
                    child: const Text(
                      "Já tem uma conta?",
                      style: TextStyle(color: Theme1.primary),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

}

