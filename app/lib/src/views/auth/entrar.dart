import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:templates/src/controllers/AuthController.dart';

class AuthEntrarView extends StatelessWidget {
  final AuthController controller = Get.put(AuthController()); // Adicione o controller aqui

  AuthEntrarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task list'),
      ),
      body: const Center(child: Text("Olá mano"),)

    );
  }
}
