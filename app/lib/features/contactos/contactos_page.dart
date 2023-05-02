import 'package:flutter/material.dart';
import 'package:gr/wigets/menu_drawer.dart';
import 'package:gr/features/clientes/clientes_page.dart';
class ContactosPage extends StatefulWidget {
  const ContactosPage({Key? key}) : super(key: key);
  @override
  _ContactosPageState createState() => _ContactosPageState();
}

class _ContactosPageState extends State<ContactosPage> {
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
            indicatorColor:  Colors.orangeAccent,
            tabs: [
              Tab(
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [Icon(Icons.person), Text("Clientes")],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [Icon(Icons.person), Text("Fornecedores")],
                ),
              )
            ],
          ),
          title: const Text('Contactos'),
        ),
        body:   TabBarView(
          children: [
            ClientesPage(),
            Center( child: Text("Page 2"))
          ],
        ),
      ),
    );
  }
}

