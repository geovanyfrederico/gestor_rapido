import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ClienteController extends GetXState {
  final FormCliente = GlobalKey<FormState>();

  final nome = TextEditingController();
  final contacto = TextEditingController();
  final nif = TextEditingController();
  final morada = TextEditingController();

  void cliente() {
    print(nome.text);
    print(contacto.toString());

    Get.toNamed("/contactos/listar");
  }
}
