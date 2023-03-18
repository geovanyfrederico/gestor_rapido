import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:gr/src/controllers/AuthController.dart';
import 'package:gr/src/views/auth/entrar.dart';
import 'package:gr/theme/theme1.dart';

class AuthSenhaView extends StatelessWidget {
  final AuthController controller =
      Get.put(AuthController()); // Adicione o controller aqui
  AuthSenhaView({super.key});
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Theme1.cardTitleBg,
            padding: EdgeInsets.only(top: 60, left: 40, right: 40),
            child: Form(
                key: controller.formLogin,
                child: ListView(children: [
                  SizedBox(
                      width: 128,
                      height: 128,
                      child: Image.asset('assets/images/gestor.png')),
                  Text(
                    'Repor o teu Pin',
                    style: Theme1.h1TextStyle(),
                    textAlign: TextAlign.center,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Como pretende recuperar o teu Pin?',
                    style: Theme1.h3TextStyle(),
                    textAlign: TextAlign.center,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RadioListTile(
                        value: 1,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value == value;
                          });
                        },
                        activeColor: Theme1.primary,
                        title: Text("Radio 1"),
                        subtitle: Text("Sub title Radio 1"),
                      ),
                      RadioListTile(
                        value: 2,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value == value;
                          });
                        },
                        activeColor: Theme1.primary,
                        title: Text("Radio 2"),
                        subtitle: Text("Sub title Radio 2"),
                      ),
                      RadioListTile(
                        value: 3,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value == value;
                          });
                        },
                        activeColor: Theme1.primary,
                        title: Text("Radio 3"),
                        subtitle: Text("Sub title Radio 3"),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 60,
                    alignment: Alignment.center,
                    child: SizedBox.expand(
                      child: GFButton(
                        onPressed: () {
                          controller.login();
                          //Get.offNamed('/details');
                        },
                        text: "Continuar",
                        color: Theme1.primary,
                        size: GFSize.LARGE,
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AuthEntrarView()));
                      },
                      child: Text(
                        "Cancelar",
                        style: TextStyle(color: Theme1.primary),
                      ),
                    ),
                  ),
                ]))));
  }

  void setState(Null Function() param0) {}
}
