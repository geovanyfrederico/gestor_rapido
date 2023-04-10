import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gr/src/config/app_theme.dart';
import 'package:gr/src/controllers/AuthController.dart';
import 'package:gr/theme/theme1.dart';
import 'package:gr/src/views/dashboard/geral.dart';
import 'package:gr/src/views/produtos/listar.dart';
import 'package:gr/src/views/vendas/nova.dart';
import 'package:path/path.dart';

class VendasListarView extends StatelessWidget {
  final AuthController controller =
      Get.put(AuthController()); // Adicione o controller aqui
  VendasListarView({super.key});
  final tabela = Repositorio.tabela;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DashboardGeralView()));
          },
        ),
        title: Text(
          'Realizar Venda',
          style: TextStyle(color: Theme1.primary),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int produto) {
          return ListTile(
            leading: Image.asset(tabela[produto].icone),
            title: Text(tabela[produto].nome),
            trailing: Text(tabela[produto].valor.toString()),
          );
        },
        padding: EdgeInsets.all(16),
        separatorBuilder: (_, __) => Divider(),
        itemCount: tabela.length,
      ),
      floatingActionButton: IconButton(
          iconSize: 100,
          icon: Icon(Icons.shopping_cart),
          onPressed: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => VendasNovaView()))
              }),
    );
  }
}
