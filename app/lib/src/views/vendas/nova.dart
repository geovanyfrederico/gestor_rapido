import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:gr/src/config/app_theme.dart';
import 'package:gr/src/controllers/controlador_padrao.dart';
import 'package:gr/theme/theme1.dart';
import 'package:gr/src/views/vendas/listar.dart';
import 'package:gr/src/views/produtos/listar.dart';
import 'package:gr/src/controllers/outros/FacturaController.dart';

class VendasNovaView extends StatelessWidget {
  final FacturaController controlador =
      Get.put(FacturaController()); // Adicione o controller aqui
  VendasNovaView({super.key});
  final tabela = Repositorio.tabela;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme1.primary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => VendasListarView()));
          },
        ),
        title: Text('Imprimir Factura'),
      ),
      body: Container(
        padding: const EdgeInsets.all(50),
        child: Form(
          // key: controlador.FormCliente,
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Factura Recibo',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Divider(),
              Text(
                'Atendente',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextField(
                controller: controlador.nomeUsuario,
                decoration: InputDecoration(
                  labelText: 'Nome',
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'Cliente',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextField(
                controller: controlador.nomeCliente,
                decoration: InputDecoration(
                  labelText: 'Nome',
                ),
              ),
              TextField(
                controller: controlador.nif,
                decoration: InputDecoration(
                  labelText: 'NIF',
                ),
              ),
              TextField(
                controller: controlador.morada,
                decoration: InputDecoration(
                  labelText: 'Endereço',
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Factura Nº: 4356123'),
                  Text('Data: 27/04/2004'),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Produtos',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Banana'),
                  Text('200'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Pera'),
                  Text('150'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Manga'),
                  Text('700'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Gingibre'),
                  Text('999'),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Text('Total Factura:'), Text('120000')],
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                alignment: Alignment.center,
                child: SizedBox.expand(
                  child: GFButton(
                    onPressed: () {
                      controlador.factura();
                      //Get.offNamed('/details');
                    },
                    text: "Imprimir Factura",
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
