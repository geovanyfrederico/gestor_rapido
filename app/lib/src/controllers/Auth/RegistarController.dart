import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistarController extends GetxController {
  final FormRegistar = GlobalKey<FormState>();
  final nomeDaEmpresa = TextEditingController();
  final nif = TextEditingController();
  final usuario = TextEditingController();
  final pin = TextEditingController();
  void registar() async {
    // print(nif.text);

    Get.toNamed("/dashboards/geral");
  }
}
