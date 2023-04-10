import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gr/src/models/empresa_model.dart';
class RegistarController extends GetxController {
  final FormRegistar = GlobalKey<FormState>();
  final nomeDaEmpresa = TextEditingController();
  final nif = TextEditingController();
  final usuario = TextEditingController();
  final pin = TextEditingController();
  registar() async {
    // Cadastar empresa
    EmpresaModel empresa = EmpresaModel(
        nome: nomeDaEmpresa.value.text,
        nif: nif.value.text
    );
    await empresa.salvar();
  }
}
