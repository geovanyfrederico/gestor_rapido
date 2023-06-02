import 'dart:developer';

import 'package:flutter/cupertino.dart';

class ExemploController extends ChangeNotifier {
  Future<void> iniciar() async {
    funcao1();
    await funcao2();
    funcao3();
  }

  Future<void> iniciar2() async {
    funcao11();
  }

  void funcao11() {
    log("funcao11");
  }

  void funcao1() {
    log("funcao1");
  }

  Future<bool> funcao2() async {
    log("funcao2");
    for (int i = 0; i < 100000; i++) {}
    return true;
  }

  void funcao3() {
    log("funcao3");
  }
}
