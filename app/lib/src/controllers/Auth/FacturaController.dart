import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FacturaController extends GetXState {
  final FormFactura = GlobalKey<FormState>();

  final nomeUsuario = TextEditingController();
  final nomeCliente = TextEditingController();
  final nif = TextEditingController();
  final morada = TextEditingController();

  void factura() {
    print(nomeUsuario.text);
    Get.toNamed("/vendas/listar");
  }
}
