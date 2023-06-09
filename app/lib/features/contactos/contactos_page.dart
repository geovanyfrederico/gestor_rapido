import 'package:flutter/material.dart';
import 'package:gr/core/constantes.dart';
import 'package:gr/features/clientes/clientes_page.dart';
import 'package:gr/features/fornecedores/fornecedores_page.dart';
import 'package:gr/wigets/menu_drawer.dart';

import 'contactos_controller.dart';

class ContactosPage extends StatefulWidget {
  const ContactosPage({Key? key}) : super(key: key);
  @override
  _ContactosPageState createState() => _ContactosPageState();
}

class _ContactosPageState extends State<ContactosPage> {
  final ContactosController controller = ContactosController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer:  MenuDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.orange,
          centerTitle: true,
          bottom:  TabBar(
            onTap: (int i) {
              setState(() {
                controller.tab = i;
              });

            },
            indicatorColor:  Colors.orangeAccent,
            tabs: [
              Tab(
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [Icon(Icons.person), Text(Constantes.clientes)],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [Icon(Icons.person), Text(Constantes.fornecedores)],
                ),
              )
            ],
          ),
          title: Text(controller.titulo()),
        ),
        body:   TabBarView(
          children: [
            ClientesPage(),
            FornecedoresPage(),
          ],
        ),
      ),
    );
  }
}

