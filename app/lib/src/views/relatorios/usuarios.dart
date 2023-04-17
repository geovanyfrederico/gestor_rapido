import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gr/src/config/app_theme.dart';
import 'package:gr/src/controllers/controlador_padrao.dart';
import 'package:gr/src/views/dashboard/geral.dart';
import 'package:gr/theme/theme1.dart';

class RelatoriosUsuariosView extends StatelessWidget {
  final ControladorPadrao controller =
      Get.put(ControladorPadrao()); // Adicione o controller aqui
  RelatoriosUsuariosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme1.primary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DashboardGeralView()));
          },
        ),
        title: Center(child: Text('Historico')),
      ),
      body: Text('Relatorio'),
    );
  }
}
