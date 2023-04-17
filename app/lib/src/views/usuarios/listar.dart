import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gr/src/config/app_theme.dart';
import 'package:gr/src/controllers/controlador_padrao.dart';

class UsuariosListarView extends StatelessWidget {
  final ControladorPadrao controller =
      Get.put(ControladorPadrao()); // Adicione o controller aqui
  UsuariosListarView({super.key});

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
