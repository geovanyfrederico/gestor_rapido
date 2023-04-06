import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegistrarController extends GetxController {
  final formLogin = GlobalKey<FormState>();

  final nif = TextEditingController();
  final pinInput = TextEditingController();



  void login() async {
        return Get.offNamed('/dashboards/geral');
    }
  }


