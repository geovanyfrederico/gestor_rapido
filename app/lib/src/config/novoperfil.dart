import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:gr/src/controllers/Auth/PerfilController.dart';
import 'package:gr/src/views/auth/entrar.dart';
import 'package:gr/theme/theme1.dart';
import 'package:gr/src/config/perfil.dart';

class ConfigNovoperfilView extends StatelessWidget {
  final PerfilController controlador =
      Get.put(PerfilController()); // Adicione o controller aqui
  ConfigNovoperfilView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Theme1.cardTitleBg,
          padding: EdgeInsets.only(top: 15, left: 40, right: 40, bottom: 40),
          child: Form(
            key: controlador.FormPerfil,
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: Text(
                        'Cancelar',
                        style: TextStyle(color: Theme1.primary),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ConfigPerfilView()));
                      },
                    ),
                  ],
                ),
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
                      labelText: 'Nome da Empresa',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 200,
                  height: 70,
                  child: TextFormField(
                    controller: controlador.nomeUsuario,
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
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 200,
                  height: 70,
                  child: TextFormField(
                    controller: controlador.email,
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
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 200,
                  height: 70,
                  child: TextFormField(
                    controller: controlador.contacto,
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      focusColor: Theme1.primary,
                      prefixIcon: Icon(Icons.phone),
                      fillColor: Theme1.gray,
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme1.primary, width: 2.0),
                      ),
                      border: InputBorder.none,
                      labelText: 'Numero Telefonico',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 200,
                  height: 70,
                  child: TextFormField(
                    controller: controlador.localidade,
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
                      labelText: 'Localidade',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 200,
                  height: 70,
                  child: TextFormField(
                    controller: controlador.actividade,
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
                      labelText: 'Actividade a Desenvolver',
                    ),
                    maxLines: 20,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 60,
                  alignment: Alignment.center,
                  child: SizedBox.expand(
                    child: GFButton(
                      onPressed: () {
                        controlador.perfil();
                        //Get.offNamed('/details');
                      },
                      text: "Editar Perfil",
                      color: Theme1.primary,
                      size: GFSize.SMALL,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          )),
    );
  }
}
