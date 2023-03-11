import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gr/src/controllers/AuthController.dart';
import 'package:gr/theme/theme1.dart';
import 'package:getwidget/getwidget.dart';
class DashboardGeralView extends StatelessWidget {
  final AuthController controller =
  Get.put(AuthController()); // Adicione o controller aqui
  DashboardGeralView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
         child: Text("Dentro"),
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
