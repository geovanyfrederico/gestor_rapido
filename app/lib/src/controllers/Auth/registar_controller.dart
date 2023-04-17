import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gr/src/models/empresa_model.dart';
import 'package:gr/src/models/usuario_model.dart';
class RegistarController extends GetxController {
  final FormRegistar = GlobalKey<FormState>();
  final nomeDaEmpresa = TextEditingController();
  final nif = TextEditingController();
  final usuario = TextEditingController();
  final pin = TextEditingController();
  bool isLoading = false;
  Future<bool> registar() async {
    isLoading = true;
    // Cadastar empresa
    EmpresaModel empresaModel = EmpresaModel(
        nome: nomeDaEmpresa.value.text,
        nif: nif.value.text
    );
    UsuarioModel usuarioModel = UsuarioModel(
      nome: usuario.value.text,
      pin: pin.value.text,
    );

    try {
      await empresaModel.salvar();
      await usuarioModel.salvar();
      isLoading = false;
      return true;
    } catch (e) {
      isLoading = false;
      return false;
    }

  }
}
