import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gr/src/views/auth/recuperar_pin_view.dart';
import 'package:gr/src/views/auth/registar_view.dart';
import 'package:gr/src/views/dashboard/geral.dart';
import 'package:gr/theme/theme1.dart';
import 'package:getwidget/getwidget.dart';
import 'package:gr/src/controllers/Auth/login_controller.dart';
class EntrarView extends StatelessWidget {
  final LoginController controlador =
  Get.put(LoginController());
  EntrarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Theme1.cardTitleBg,
          padding: const EdgeInsets.only(top: 60, left: 40, right: 40),
          child: Form(
            key: controlador.formulario,
            child: ListView(
              children: [
                SizedBox(
                    width: 128,
                    height: 128,
                    child: Image.asset('assets/images/logo.png')),
                Text(
                  'GESTOR  RÁPIDO',
                  style: Theme1.h1TextStyle(),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 200,
                  height: 70,
                  child: TextFormField(
                    key: const Key('usuario'),
                    controller: controlador.telefone,
                    maxLength: 9,
                    keyboardType: TextInputType.phone,
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 200,
                  height: 70,
                  child: TextFormField(
                      controller: controlador.pin,
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
                        hintText: 'PIN',
                      )
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Get.to(RecuperarPinView());
                    },
                    style: Theme1.linkButtonStyle,
                    child: const Text(
                      'Recuperar pin',
                    ),
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
                        await controlador.login() ? Get.off(DashboardGeralView()) : null;
                      },
                      text: "Iniciar sessão",
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
                      Get.to(RegistarView());
                    },
                    child: const Text(
                      "Criar conta",
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
