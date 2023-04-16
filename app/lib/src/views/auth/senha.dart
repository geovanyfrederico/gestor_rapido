import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:gr/src/controllers/Auth/SenhaController.dart';
import 'package:gr/src/views/auth/entrar.dart';
import 'package:gr/theme/theme1.dart';

class AuthSenhaView extends StatelessWidget {
  final SenhaController controlador =
      Get.put(SenhaController()); // Adicione o controller aqui
  AuthSenhaView({super.key});
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme1.cardTitleBg,
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Form(
          key: controlador.FormSenha,
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: Text(
                      'Cancelar',
                      style: TextStyle(color: Theme1.primary),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AuthEntrarView()));
                    },
                  ),
                ],
              ),
              SizedBox(
                  width: 500, child: Image.asset('assets/images/Senha.png')),
              SizedBox(
                height: 20,
              ),
              Text(
                'Esqueceu Sua Senha?',
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
                'Por favor, informe o E-mail ou o numéro de telefone assoaciado a sua conta. E enviaremos um codigo de verificação para a recuperação da sua conta ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: controlador.email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                alignment: Alignment.center,
                child: SizedBox.expand(
                  child: GFButton(
                    onPressed: () {
                      controlador.senha();
                    },
                    text: "Continuar",
                    color: Theme1.primary,
                    size: GFSize.LARGE,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
