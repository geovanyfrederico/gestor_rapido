import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PINController extends GetXState {
  final FormPIN = GlobalKey<FormState>();

  final pin = TextEditingController();
  final confirmarpin = TextEditingController();

  void PIN() {
    print(pin.toString());

    Get.toNamed("/dashboard/geral");
  }
}
