import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gr/src/config/app_theme.dart';
import 'package:gr/src/controllers/controlador_padrao.dart';
import 'package:gr/src/views/contactos/NovoCliente.dart';
import 'package:gr/src/views/contactos/NovoFornecedor.dart';
import 'package:gr/theme/theme1.dart';
import 'package:gr/src/views/produtos/listar.dart';
import 'package:gr/src/views/contactos/listar.dart';
import 'package:gr/src/config/perfil.dart';
import 'package:gr/src/views/dashboard/geral.dart';
import 'package:gr/src/views/vendas/listar.dart';

class ContactosListarView extends StatefulWidget {
  const ContactosListarView({super.key});

  @override
  State<StatefulWidget> createState() => Contactos();
}

class Contactos extends State<ContactosListarView> {
  bool numberInputIsValid = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DashboardGeralView()));
              },
            ),
            backgroundColor: Theme1.primary,
            title: Text('CONTACTOS'),
            bottom: const TabBar(tabs: [
              Tab(
                child: Text('Fornecedores'),
              ),
              Tab(
                child: Text('Clientes'),
              )
            ]),
          ),
          body: TabBarView(
            children: [
              Container(
                child: IconButton(
                  iconSize: 100,
                  splashColor: Colors.blue,
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ContactosNovoFornecedorView()));
                  },
                ),
              ),
              Container(
                child: IconButton(
                  iconSize: 100,
                  splashColor: Colors.blue,
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ContactosNovoClienteView()));
                  },
                ),
              ),
            ],
          ),
          extendBody: true,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Theme1.primary,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => VendasListarView()));
            },
            child: const Icon(Icons.add_shopping_cart),
          ),
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            color: Theme1.primary,
            child: IconTheme(
              data: IconThemeData(color: Theme1.primary),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.home),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashboardGeralView()));
                        },
                      ),
                      IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProdutosListarView()));
                        },
                      ),
                      IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.account_box),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ContactosListarView()));
                        },
                      ),
                      IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.person),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ConfigPerfilView()));
                        },
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
