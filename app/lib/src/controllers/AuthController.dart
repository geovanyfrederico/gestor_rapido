import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final formLogin = GlobalKey<FormState>();

  final userInput = TextEditingController();
  final pinInput = TextEditingController();

  void login() async {
    return Get.offNamed('/dashboard/geral');
  }
}
