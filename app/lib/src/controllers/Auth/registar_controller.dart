import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gr/src/helpers/matematica.dart';
import 'package:gr/src/models/empresa_model.dart';
import 'package:gr/src/models/usuario_model.dart';
import 'package:gr/src/service/alert_service.dart';
import 'package:gr/src/service/sms_service.dart';
import 'package:gr/theme/theme1.dart';
class RegistarController extends GetxController {
  final formulario = GlobalKey<FormState>();
  final nomeDaEmpresa = TextEditingController();
  final nif = TextEditingController();
  final nome = TextEditingController();
  final telefone = TextEditingController();
  final pin = TextEditingController();

  Future<bool> registar() async {
    if(nomeDaEmpresa.value.text.isEmpty
        || nif.value.text.isEmpty
        || pin.value.text.isEmpty || nome.text.isEmpty || telefone.text.isEmpty
    ){
      AlertService.error('Autenticação', "Preencha os campos obrigatórios.");
      return false;
    }
    // Cadastar empresa
    EmpresaModel empresaModel = EmpresaModel(
        nome: nomeDaEmpresa.value.text,
        nif: nif.value.text
    );
    UsuarioModel usuarioModel = UsuarioModel(
      nome: nome.value.text,
      pin: pin.value.text,
      telefone: telefone.value.text,
    );
    try {
      await empresaModel.salvar();
      await usuarioModel.salvar();
      // Envia uma mensagem de boas vindas.
      SmsService.send(telefone.value.text, "Bem vindo ao Gestor Rápido, código de verificação: ${Matematica.gerarNumerosAleatorios(5)}");
      Get.snackbar(
          'Autenticação',
          'Successo. Entre com seu nome e pin',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Theme1.lazur,
          colorText: Theme1.gray,
          maxWidth: Get.width * 0.9, // Define 80% da largura da tela
          margin: const EdgeInsets.only(bottom: 10),
          borderRadius: 1
      );
      return true;
    } catch (e) {
      Get.snackbar(
          'Autenticação',
          'Erro ao criar empresa',
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
}
