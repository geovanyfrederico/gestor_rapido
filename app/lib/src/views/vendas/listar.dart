import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gr/src/config/app_theme.dart';
import 'package:gr/src/controllers/controlador_padrao.dart';
import 'package:gr/theme/theme1.dart';
import 'package:gr/src/views/dashboard/geral.dart';
import 'package:gr/src/views/produtos/listar.dart';
import 'package:gr/src/views/vendas/nova.dart';
import 'package:path/path.dart';

class VendasListarView extends StatelessWidget {
  final ControladorPadrao controller =
      Get.put(ControladorPadrao()); // Adicione o controller aqui
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
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
        ),

        itemBuilder: (BuildContext context, int produto) {
          return Container(
            color: Colors.black12,
            child: Column(
              children: [
                Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.1),
                        )
                      ],
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          tabela[produto].foto,
                        ),
                      )),
                ),
                Positioned(
                  child: Container(
                    child: Column(
                      children: [
                        Text(tabela[produto].nome),
                        Text(tabela[produto].valor.toString()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        padding: EdgeInsets.all(16),
        //  separatorBuilder: (_, __) => Divider(),
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
