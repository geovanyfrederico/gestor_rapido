import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'exemplo_controller.dart';

class ExemploPage extends StatefulWidget {
  @override
  _ExemploPageState createState() => _ExemploPageState();
}

class _ExemploPageState extends State<ExemploPage> {
  ExemploController controller = ExemploController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exemplo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => {
                  Modular.to.pushNamed('/dashboard'),
                },
                child: Text("Clicame"))
          ],
        ),
      ),
    );
  }
}
