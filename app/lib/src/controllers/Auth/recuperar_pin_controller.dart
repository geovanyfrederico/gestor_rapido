import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:phone_form_field/phone_form_field.dart';

import '../../../theme/theme1.dart';
class RecuperarPinController extends GetxController {
  final formulario = GlobalKey<FormState>();
  final PhoneController telefone = PhoneController(null);
  final codigo = TextEditingController();
  late  bool codigoEnviado = false;
  Future<bool> enviarCodigo() async {
    codigoEnviado = true;
    Get.snackbar(
        'Successo',
        'Código enviado.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Theme1.spinColor,
        colorText: Theme1.gray,
        maxWidth: Get.width * 0.9, // Define 80% da largura da tela
        margin: const EdgeInsets.only(bottom: 10),
        borderRadius: 1
    );
    return true;
  }
  Future<bool> verificarCodigo() async {
    return true;
  }
}
