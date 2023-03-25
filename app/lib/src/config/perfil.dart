import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gr/src/config/app_theme.dart';
import 'package:gr/src/controllers/AuthController.dart';
import 'package:gr/theme/theme1.dart';
import 'package:gr/src/views/produtos/listar.dart';
import 'package:gr/src/views/contactos/listar.dart';
import 'package:gr/src/config/perfil.dart';
import 'package:gr/src/views/dashboard/geral.dart';
import 'package:gr/src/config/novoperfil.dart';
import 'package:gr/src/views/vendas/listar.dart';

class ConfigPerfilView extends StatelessWidget {
  final AuthController controller =
      Get.put(AuthController()); // Adicione o controller aqui
  ConfigPerfilView({super.key});

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
        title: Text('Perfil'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.1),
                        )
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage('assets/images/gestor.png')),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 4, color: Colors.white),
                          color: Theme1.primary),
                      child: Icon(Icons.photo_camera, color: Colors.white),
                    ),
                  )
                ]),
              ),
              Container(
                child: Center(
                  child: Text(
                    'Nome da Empresa',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  TextButton(
                    child: Text(
                      'Editar Perfil',
                      style: TextStyle(color: Theme1.primary),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConfigNovoperfilView()));
                    },
                  ),
                ],
              ),
              Divider(),
              Container(
                child: Text(
                  'Descrição da actividade a desenvolver',
                ),
              ),
              SizedBox(height: 100),
              Divider(),
              Container(
                child: Text(
                  'Informações da empresa',
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Column(
                  children: [
                    Text(
                      'Email:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('Email')
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Column(
                  children: [
                    Text(
                      'Localização:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('Localização')
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Column(
                  children: [
                    Text(
                      'NIF:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('NIF')
                  ],
                ),
              ),
              Divider(),
              Container(
                child: Text(
                  'Certificados',
                ),
              ),
              SizedBox(height: 100),
              Divider(),
            ],
          ),
        ),
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
                    icon: Icon(Icons.list),
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
