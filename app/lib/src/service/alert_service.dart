import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../theme/theme1.dart';

class AlertService{
  static SnackPosition position = SnackPosition.BOTTOM;
  static Future<void> error(String titulo, String mensagem) async {
    Get.snackbar(
        titulo,
        mensagem,
        snackPosition:position,
        backgroundColor: Theme1.red,
        colorText: Theme1.gray,
        maxWidth: Get.width * 0.9, // Define 80% da largura da tela
        margin: const EdgeInsets.only(bottom: 10),
        borderRadius: 1
    );
  }
  static Future<void> success(String titulo, String mensagem) async {
    Get.snackbar(
        titulo,
        mensagem,
        snackPosition:position,
        backgroundColor: Theme1.red,
        colorText: Theme1.gray,
        maxWidth: Get.width * 0.9, // Define 80% da largura da tela
        margin: const EdgeInsets.only(bottom: 10),
        borderRadius: 1
    );
  }
}
