import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:gr/theme/theme1.dart';
import '../../controllers/controlador_padrao.dart';

class PINSeguranca extends StatelessWidget {
  final ControladorPadrao controlador =
      Get.put(ControladorPadrao()); // Adicione o controller aqui
  PINSeguranca({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 60, left: 40, right: 40),
        child: Form(
            key: controlador.FormPIN,
            child: ListView(children: [
              Text(
                'Certifica-te de que o PIN inserido seja seguro e fácil de lembrar...',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Digite a nova Senha',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 200,
                height: 70,
                child: TextFormField(
                  controller: controlador.confirmarpin,
                  obscureText: true,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  maxLength: 4,
                  decoration: const InputDecoration(
                    focusColor: Theme1.primary,
                    prefixIcon: Icon(Icons.lock),
                    fillColor: Theme1.gray,
                    filled: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme1.primary, width: 2.0),
                    ),
                    border: InputBorder.none,
                    labelText: 'Pin',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Insira um pin';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Confirmar nova Senha',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 200,
                height: 70,
                child: TextFormField(
                  controller: controlador.pin,
                  obscureText: true,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  maxLength: 4,
                  decoration: const InputDecoration(
                    focusColor: Theme1.primary,
                    prefixIcon: Icon(Icons.lock),
                    fillColor: Theme1.gray,
                    filled: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme1.primary, width: 2.0),
                    ),
                    border: InputBorder.none,
                    labelText: 'Pin',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Insira um pin';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                alignment: Alignment.center,
                child: SizedBox.expand(
                  child: GFButton(
                    onPressed: () {
                      controlador.PIN();
                    },
                    text: "Guardar PIN",
                    color: Theme1.primary,
                    size: GFSize.LARGE,
                  ),
                ),
              ),
            ])),
      ),
    );
  }
}
