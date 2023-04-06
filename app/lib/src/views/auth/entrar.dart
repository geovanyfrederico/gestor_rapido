import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gr/src/controllers/AuthController.dart';
import 'package:gr/theme/theme1.dart';
import 'package:getwidget/getwidget.dart';
import 'package:gr/src/views/auth/registar.dart';
import 'package:gr/src/views/auth/senha.dart';

class AuthEntrarView extends StatelessWidget {
  final AuthController controller =
      Get.put(AuthController()); // Adicione o controller aqui
  AuthEntrarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Theme1.cardTitleBg,
          padding: const EdgeInsets.only(top: 60, left: 40, right: 40),
          child: Form(
            key: controller.formLogin,
            child: ListView(
              children: [
                SizedBox(
                    width: 128,
                    height: 128,
                    child: Image.asset('assets/images/gestor.png')),
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
                    controller: controller.userInput,
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
                      labelText: 'Usuário',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Insira um usuário';
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
                    controller: controller.pinInput,
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
                        return 'Insira um pin';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AuthSenhaView()));
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
                      onPressed: () {
                        controller.login();
                        //Get.offNamed('/details');
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AuthRegistarView()));
                    },
                    child: Text(
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
/* return Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Image.asset(
              'assets/images/gestor.png',
              height: 50,
            ),
          ),
        ),
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
*/
