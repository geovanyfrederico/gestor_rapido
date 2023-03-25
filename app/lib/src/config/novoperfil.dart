import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:gr/src/controllers/AuthController.dart';
import 'package:gr/src/views/auth/entrar.dart';
import 'package:gr/theme/theme1.dart';

class ConfigNovoperfilView extends StatelessWidget {
  final AuthController controller =
      Get.put(AuthController()); // Adicione o controller aqui
  ConfigNovoperfilView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Theme1.cardTitleBg,
          padding: EdgeInsets.only(top: 60, left: 40, right: 40),
          child: Form(
            key: controller.formLogin,
            child: ListView(
              children: [
                SizedBox(
                    width: 128,
                    height: 128,
                    child: Image.asset('assets/images/gestor.png')),
                Text(
                  'Editar Perfil',
                  style: Theme1.h1TextStyle(),
                  textAlign: TextAlign.center,
                ),
                const Divider(),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 200,
                  height: 70,
                  child: TextFormField(
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      focusColor: Theme1.primary,
                      prefixIcon: Icon(Icons.person),
                      fillColor: Theme1.gray,
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme1.primary, width: 2.0),
                      ),
                      border: InputBorder.none,
                      labelText: 'Nome de usuário',
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
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      focusColor: Theme1.primary,
                      prefixIcon: Icon(Icons.email),
                      fillColor: Theme1.gray,
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme1.primary, width: 2.0),
                      ),
                      border: InputBorder.none,
                      labelText: 'Email',
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
                    obscureText: true,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    maxLength: 4,
                    decoration: const InputDecoration(
                      focusColor: Theme1.primary,
                      prefixIcon: Icon(Icons.lock),
                      fillColor: Theme1.gray,
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme1.primary, width: 2.0),
                      ),
                      border: InputBorder.none,
                      labelText: 'Pin',
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
                    obscureText: true,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    maxLength: 4,
                    decoration: const InputDecoration(
                      focusColor: Theme1.primary,
                      prefixIcon: Icon(Icons.lock),
                      fillColor: Theme1.gray,
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme1.primary, width: 2.0),
                      ),
                      border: InputBorder.none,
                      labelText: 'Confirmar Pin',
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
                      onPressed: () {
                        controller.login();
                        //Get.offNamed('/details');
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AuthEntrarView()));
                    },
                    child: Text(
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