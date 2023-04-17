import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FornecedorController extends GetXState {
  final FormFornecedor = GlobalKey<FormState>();

  final nome = TextEditingController();
  final contacto = TextEditingController();
  final nif = TextEditingController();
  final morada = TextEditingController();

  void fornecedor() {
    print(nome.text);
    print(contacto.toString());

    Get.toNamed("/contactos/listar");
  }
}
