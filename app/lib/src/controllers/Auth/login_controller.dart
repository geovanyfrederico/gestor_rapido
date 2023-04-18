import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gr/src/service/usuario_service.dart';
import 'package:gr/theme/theme1.dart';

import '../../service/alert_service.dart';

class LoginController extends GetxController {
  final formulario = GlobalKey<FormState>();
  final telefone = TextEditingController();
  final pin = TextEditingController();

  Future<bool> login() async {
    // Verifica se os campos estão vazios.
    if(telefone.value.text.isEmpty || pin.value.text.isEmpty){
      AlertService.error('AutenticaçãO', "Preencha os campos obrigatórios.");
      return false;
    }

    // Verifica se o usuario e pin existem no banco de dados
    if(await UsuarioService.login(telefone.value.text, pin.value.text) != null) {
      Get.snackbar(
          'Autenticação',
          'Successo',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Theme1.lazur,
          colorText: Theme1.gray,
          maxWidth: Get.width * 0.9, // Define 80% da largura da tela
          margin: const EdgeInsets.only(bottom: 10),
          borderRadius: 1
      );
      return true;
    }
    Get.snackbar(
        'Autenticação',
        'Dados incorrectos',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Theme1.red,
        colorText: Theme1.gray,
        maxWidth: Get.width * 0.9, // Define 80% da largura da tela
        margin: const EdgeInsets.only(bottom: 10),
        borderRadius: 1
    );
    return false;
  }

}
