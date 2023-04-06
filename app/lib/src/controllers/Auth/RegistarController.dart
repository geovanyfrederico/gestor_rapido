import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegistarController extends GetxController {
  final FormRegistar = GlobalKey<FormState>();
  final nomeDaEmpresa = TextEditingController();
  final nif = TextEditingController();
  final usuario = TextEditingController();
  final pin = TextEditingController();
  registar() async {
    print(nif.text);

    Get.toNamed("/auth/entar");
  }
}
