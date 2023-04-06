import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PerfilController extends GetXState {
  final FormPerfil = GlobalKey<FormState>();
  final nomeDaEmpresa = TextEditingController();
  final nomeUsuario = TextEditingController();
  final email = TextEditingController();
  final contacto = TextEditingController();
  final localidade = TextEditingController();
  final actividade = TextEditingController();
  perfil() {
    print(nomeDaEmpresa.text);
    print(nomeUsuario.text);

    Get.toNamed("/config/perfil");
  }
}
