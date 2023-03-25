import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gr/main.dart';
import 'package:gr/src/controllers/AuthController.dart';
import 'package:gr/src/views/produtos/listar.dart';
import 'package:gr/theme/theme1.dart';
import 'package:getwidget/getwidget.dart';
import 'package:gr/src/views/produtos/listar.dart';
import 'package:gr/src/views/contactos/listar.dart';
import 'package:gr/src/config/perfil.dart';
import 'package:gr/src/views/dashboard/geral.dart';
import 'package:gr/src/views/vendas/listar.dart';
import 'package:gr/src/views/relatorios/vendas.dart';

class DashboardGeralView extends StatefulWidget {
  DashboardGeralView({super.key});

  @override
  State<DashboardGeralView> createState() => _DashboardGeralViewState();
}

class _DashboardGeralViewState extends State<DashboardGeralView> {
  final AuthController controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme1.primary,
        leading: IconButton(
          iconSize: 40,
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text('Gestor Rápido'),
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(18),
            height: 270,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                color: Theme1.primary),
            child: GridTile(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 25.0, right: 30, left: 30),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              '16/03',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '8000',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25.0, right: 30, left: 30),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              '15/03',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '8500',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25.0, right: 30, left: 30),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              '14/03',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '7000',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25.0, right: 30, left: 30),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              '13/03',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '7500',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25.0, right: 30, left: 30),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              '12/03',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '8000',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25.0, right: 30, left: 30),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              '11/03',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '600',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25.0, right: 30, left: 30),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              '10/03',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '3000',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25.0, right: 30, left: 30),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              '09/03',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '8000',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25.0, right: 30, left: 30),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              '08/03',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '5000',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25.0, right: 30, left: 30),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              '07/03',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '7000',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25.0, right: 30, left: 30),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              '06/03',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '8000',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25.0, right: 30, left: 30),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              '05/03',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '300',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              footer: Padding(
                padding: const EdgeInsets.all(70.0),
                child: Center(
                    child: Column(
                  children: [
                    Text(
                      '10 000',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    Text(
                      'Dia de Hoje',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )),
              ),
              header: Text(
                'Rendimentos Durante a Semana',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            child: Text(
              'Visão Geral',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Theme1.primary),
            ),
          ),
          Divider(),
          Container(
            height: 60,
            alignment: Alignment.center,
            child: SizedBox.expand(
              child: GFButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RelatoriosVendasView()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Histórico das Vendas",
                      style: TextStyle(fontSize: 20, color: Theme1.primary),
                    ),
                  ],
                ),
                color: Color.fromARGB(255, 239, 235, 235),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            height: 60,
            alignment: Alignment.center,
            child: SizedBox.expand(
              child: GFButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Kilapes",
                      style: TextStyle(fontSize: 20, color: Theme1.primary),
                    ),
                  ],
                ),
                color: Color.fromARGB(255, 239, 235, 235),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            height: 60,
            alignment: Alignment.center,
            child: SizedBox.expand(
              child: GFButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "",
                      style: TextStyle(fontSize: 20, color: Theme1.primary),
                    ),
                  ],
                ),
                color: Color.fromARGB(255, 239, 235, 235),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            height: 60,
            alignment: Alignment.center,
            child: SizedBox.expand(
              child: GFButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "",
                      style: TextStyle(fontSize: 20, color: Theme1.primary),
                    ),
                  ],
                ),
                color: Color.fromARGB(255, 239, 235, 235),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            height: 60,
            alignment: Alignment.center,
            child: SizedBox.expand(
              child: GFButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "",
                      style: TextStyle(fontSize: 20, color: Theme1.primary),
                    ),
                  ],
                ),
                color: Color.fromARGB(255, 239, 235, 235),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            height: 60,
            alignment: Alignment.center,
            child: SizedBox.expand(
              child: GFButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "",
                      style: TextStyle(fontSize: 20, color: Theme1.primary),
                    ),
                  ],
                ),
                color: Color.fromARGB(255, 239, 235, 235),
              ),
            ),
          ),
        ],
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme1.primary,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => VendasListarView()));
        },
        child: const Icon(Icons.shopping_cart),
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
                    icon: Icon(Icons.sports_hockey_sharp),
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
    );
  }
}
/*body: Container(
        height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 480,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme1.primary),
                  child: Center(
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '7500',
                        style: TextStyle(fontSize: 30),
                      ),
                      Text('Dia de Hoje'),
                    ],
                  )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme1.primary),
                  child: Center(child: Text('Qualquer Coisa')),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme1.primary),
                  child: Center(child: Text('Qualquer Coisa')),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme1.primary),
                  child: Center(child: Text('Qualquer Coisa')),
                ),
              ),
            ),
          ],
        ),
      ), */
