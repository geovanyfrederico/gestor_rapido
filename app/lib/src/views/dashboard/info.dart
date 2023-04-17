import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gr/src/config/app_theme.dart';
import 'package:gr/src/controllers/controlador_padrao.dart';
import 'package:gr/src/views/dashboard/geral.dart';
import 'package:gr/theme/theme1.dart';

class DashboardInfoView extends StatelessWidget {
  final ControladorPadrao controller =
      Get.put(ControladorPadrao()); // Adicione o controller aqui
  DashboardInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            color: Colors.black,
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DashboardGeralView()));
            },
          ),
          title: Text('Ajuda'),
        ),
        body: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Centro de Ajuda...',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Text('OLá... obrigado por escolher o nosso aplicativo...'),
            Text(
                'Como gerir um micro negocio em Angola de forma rápida, dinâmica e segura?'),
            Text(
                'Tendo em conta a situação problemática acima citada, e consequentemente o problema que se levantou, foi crucial e tão importante criarmos o Gestor Rápido: um Caderno de contas Digital para micro-negócios em Angola'),
            Text(
                'Este aplicativo é uma ferramenta do futuro criada para dinamizar o processo de cálculo e de gestão de pequenos negócios facilitaremos o negócio de muitos microempresários.')
          ],
        ));
  }
}
