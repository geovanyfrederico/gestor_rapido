import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:templates/src/config/app_theme.dart';
import 'package:templates/src/controllers/AuthController.dart';
import 'package:templates/src/views/inutil/task_list_view.dart';

import '../produtos/listar.dart';

class AuthEntrarView extends StatelessWidget {
  final AuthController controller =
      Get.put(AuthController()); // Adicione o controller aqui

  AuthEntrarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: const Text(
              'Gestor Rápido',
              style: TextStyle(fontSize: 25),
            )),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  style: new TextStyle(color: Colors.white, fontSize: 25),
                  decoration: InputDecoration(
                      labelText: "User",
                      labelStyle: TextStyle(color: Colors.white)),
                ),
                Divider(),
                TextFormField(
                  autofocus: true,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  style: new TextStyle(color: Colors.white, fontSize: 25),
                  decoration: InputDecoration(
                      labelText: "PIN",
                      labelStyle: TextStyle(color: Colors.white)),
                ),
                Divider(),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 25, right: 25),
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(32))),
                  child: TextButton(
                    child: Center(
                        child: Text(
                      'ENTRAR',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.deepPurple,
                        fontSize: 20,
                      ),
                    )),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProdutosListarView()));
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
