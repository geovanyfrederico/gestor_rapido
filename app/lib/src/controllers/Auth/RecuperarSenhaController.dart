import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RecuperarSenhaController extends GetXState {
  final FormSenha = GlobalKey<FormState>();

  final novaSenha = TextEditingController();
  final repetirNovaSenha = TextEditingController();

  void Senha() {
    print(novaSenha.text);

    Get.toNamed("/contactos/listar");
  }
}
