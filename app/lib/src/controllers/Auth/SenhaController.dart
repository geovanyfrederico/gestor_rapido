import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SenhaController extends GetXState {
  final FormSenha = GlobalKey<FormState>();

  final email = TextEditingController();
  final senhaVerificacao = TextEditingController();

  void senha() {
    print(email.text);

    Get.toNamed("/auth/newpageSenha");
  }

  verificar() {
    Get.toNamed("/auth/entrar ");
  }
}
