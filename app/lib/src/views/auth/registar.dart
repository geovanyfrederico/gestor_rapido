import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:gr/src/views/auth/entrar.dart';
import 'package:gr/theme/theme1.dart';
import 'package:gr/src/controllers/Auth/registar_controller.dart';

class AuthRegistarView extends StatelessWidget {
  final RegistarController controlador =
  Get.put(RegistarController()); // Adicione o controller aqui
  AuthRegistarView
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Theme1.cardTitleBg,
          padding: const EdgeInsets.only(top: 60, left: 40, right: 40),
          child: Form(
            key: controlador.FormRegistar,
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
                  height: 30,
                ),
                SizedBox(
                  width: 200,
                  height: 70,
                  child: TextFormField(
                    controller: controlador.nomeDaEmpresa,
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      focusColor: Theme1.primary,
                      prefixIcon: Icon(Icons.store),
                      fillColor: Theme1.gray,
                      filled: true,
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Theme1.primary, width: 2.0),
                      ),
                      border: InputBorder.none,
                      labelText: 'Nome da empresa',
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
                    controller: controlador.nif,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      focusColor: Theme1.primary,
                      prefixIcon: Icon(Icons.contact_page),
                      fillColor: Theme1.gray,
                      filled: true,
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Theme1.primary, width: 2.0),
                      ),
                      border: InputBorder.none,
                      labelText: 'NIF',
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
                    controller: controlador.usuario,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
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
                        labelText: 'Nome do Usuário'),
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
                  height: 10,
                ),
                Container(
                  height: 60,
                  alignment: Alignment.center,
                  child: SizedBox.expand(
                    child: GFButton(
                      onPressed: () async {
                        bool  cadastrado =   await controlador.registar();
                        cadastrado ? GFToast.showToast(
                            'BOM',
                            context,
                            toastPosition: GFToastPosition.BOTTOM,
                            textStyle: const TextStyle(fontSize: 16, color: GFColors.DARK),
                            backgroundColor: GFColors.LIGHT,
                            trailing: const Icon(
                              Icons.notifications,
                              color: GFColors.SUCCESS,
                            )
                        ) : GFToast.showToast(
                            'MAU',
                            context,
                            toastPosition: GFToastPosition.BOTTOM,
                            textStyle: const TextStyle(fontSize: 16, color: GFColors.DARK),
                            backgroundColor: GFColors.LIGHT,
                            trailing: const Icon(
                              Icons.notifications,
                              color: GFColors.SUCCESS,
                            )
                        );
                      },
                      text: controlador.isLoading ? "Cadastrando...." :"Cadastre-se",
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

