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
      body: Container(
        color: Colors.amber,
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
        child: ListView(
          children: [
            SizedBox(
                width: 128,
                height: 128,
                child: Image.asset('assets/images/gestor.png')),
            Text(
              'Gestor Rápido',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'E-mail',
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: Text(
                  'Recuperar Senha...',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(stops: [
                  0,
                  1
                ], colors: [
                  Color.fromARGB(255, 236, 186, 19),
                  Color.fromARGB(255, 112, 82, 4),
                ]),
                // borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: SizedBox.expand(
                child: TextButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Entrar',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      Image.asset(
                        'assets/images/gestor.png',
                        height: 35,
                      ),
                    ],
                  ),
                  onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProdutosListarView()))
                  },
                ),
              ),
            ),
          ],
        ),
      ),
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