import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gr/src/config/app_theme.dart';
import 'package:gr/src/controllers/AuthController.dart';
import 'package:gr/src/views/contactos/novo.dart';
import 'package:gr/src/views/contactos/novoF.dart';
import 'package:gr/theme/theme1.dart';

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
                              builder: (context) => ContactosNovoFView()));
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
                              builder: (context) => ContactosNovoView()));
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
