import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gr/src/controllers/controlador_padrao.dart';

class ComprasListarView extends StatelessWidget {
  final ControladorPadrao controller =
      Get.put(ControladorPadrao()); // Adicione o controller aqui
  ComprasListarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [TextField()],
        ),
      ),
    );
  }
}
