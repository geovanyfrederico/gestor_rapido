import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:phone_form_field/phone_form_field.dart';
class RecuperarPinController extends GetxController {
  final formulario = GlobalKey<FormState>();
  late PhoneController telefone;
  final  codigo = TextEditingController();
  Future<bool> login() async {
    return true;
  }
  Future<bool> verificarCodigo() async {
    return true;
  }
}
