import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SenhaController extends GetXState {
  final FormSenha = GlobalKey<FormState>();
  final FormVerificar = GlobalKey<FormState>();

  final email = TextEditingController();
  final senhaVerificacao = TextEditingController();

  senha() {
    Get.toNamed('/auth/newpageSenha');
  }

  verificar() {
    Get.toNamed("/dashboard/seguranca");
  }
}
