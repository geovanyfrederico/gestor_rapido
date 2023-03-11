import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gr/src/models/task_model.dart';
import 'package:gr/src/repositories/AuthRespository.dart';

class AuthController extends GetxController {
  final formLogin = GlobalKey<FormState>();

  final userInput = TextEditingController();
  final pinInput = TextEditingController();

  final taskList = <Task>[].obs;
  final repository = AuthRepository();
  void login() async {
    if (formLogin.currentState!.validate()) {
      bool autenticado =   await repository.auth(userInput.text, pinInput.text);
      if (autenticado) {
        return Get.offNamed('/dashboards/geral');
      }
      Get.back();
    }

  }
}
