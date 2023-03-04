import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:templates/src/config/app_theme.dart';
import 'package:templates/src/controllers/AuthController.dart';

class ContactosListarView extends StatelessWidget {
  final AuthController controller =
      Get.put(AuthController()); // Adicione o controller aqui
  ContactosListarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contactos"),
      ),
      body: Column(children: <Widget>[
        Container(
          margin: EdgeInsets.all(20),
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.all(Radius.circular(32))),
          child: ElevatedButton(
              onPressed: () {},
              child: Icon(Icons.person),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                overlayColor:
                    MaterialStateProperty.resolveWith<Color?>((states) {
                  if (states.contains(MaterialState.pressed))
                    return Colors.blue;
                }),
              )),
        )
      ]),
    );
  }
}
