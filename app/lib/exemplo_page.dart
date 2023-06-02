import 'package:flutter/material.dart';

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
                onPressed: () => {controller.iniciar(), controller.iniciar2()},
                child: Text("Clicame"))
          ],
        ),
      ),
    );
  }
}
