import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:templates/src/controllers/AuthController.dart';

class ComprasNovoView extends StatelessWidget {
  final AuthController controller =
      Get.put(AuthController()); // Adicione o controller aqui
  ComprasNovoView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Text(""));
  }
}
