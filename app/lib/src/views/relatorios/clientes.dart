import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gr/src/config/app_theme.dart';
import 'package:gr/src/controllers/AuthController.dart';
import 'package:gr/src/views/dashboard/geral.dart';
import 'package:gr/theme/theme1.dart';

class RelatoriosClientesView extends StatelessWidget {
  final AuthController controller =
      Get.put(AuthController()); // Adicione o controller aqui
  RelatoriosClientesView({super.key});

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
