import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:templates/src/views/auth/entrar.dart';
import 'package:templates/src/views/auth/registar.dart';
import 'package:templates/src/views/compras/listar.dart';
import 'package:templates/src/views/compras/novo.dart';
import 'package:templates/src/views/contactos/novo.dart';
import 'package:templates/src/views/contactos/listar.dart';
import 'package:templates/src/views/produtos/novo.dart';
import 'package:templates/src/views/produtos/listar.dart';
import 'package:templates/src/views/relatorios/clientes.dart';
import 'package:templates/src/views/relatorios/usuarios.dart';
import 'package:templates/src/views/relatorios/vendas.dart';
import 'package:templates/src/views/usuarios/listar.dart';
import 'package:templates/src/views/usuarios/novo.dart';
import 'package:templates/src/views/vendas/listar.dart';
import 'package:templates/src/views/vendas/nova.dart';
import 'package:templates/src/views/vendas/visualisar.dart';
import 'package:templates/src/config/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Gestor Rápido',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: AppTheme.textTheme,
        platform: TargetPlatform.iOS,
      ),
      initialRoute: '/contactos/novo',
      getPages: [
        GetPage(name: '/auth/entrar', page: () => AuthEntrarView()),
        GetPage(name: '/auth/registar', page: () => AuthRegistarView()),
        GetPage(name: '/compras/listar', page: () => ComprasListarView()),
        GetPage(name: '/compras/novo', page: () => ComprasNovoView()),
        GetPage(name: '/contactos/novo', page: () => ContactosNovoView()),
        GetPage(name: '/contactos/listar', page: () => ContactosListarView()),
        GetPage(name: '/produtos/novo', page: () => ProdutosNovoView()),
        GetPage(name: '/produtos/listar', page: () => ProdutosListarView()),
        GetPage(
            name: '/relatorios/clientes', page: () => RelatoriosClientesView()),
        GetPage(
            name: '/relatorios/usuarios', page: () => RelatoriosUsuariosView()),
        GetPage(name: '/relatorios/vendas', page: () => RelatoriosVendasView()),
        GetPage(name: '/usuarios/listar', page: () => UsuariosListarView()),
        GetPage(name: '/usuarios/novo', page: () => UsuariosNovoView()),
        GetPage(name: '/vendas/listar', page: () => VendasListarView()),
        GetPage(name: '/vendas/nova', page: () => VendasNovaView()),
        GetPage(name: '/vendas/visualisar', page: () => VendasVisualisarView()),
      ],
    );
  }
}
/*

├── autenticacao
 ├── entrar.dart
 └── registar.dart
├── compras
 ├── listar.dart
 └── novo.dart
├── contactos
 ├── listar.dart
 └── novo.dart
├── inutil
 ├── home_view.dart
 ├── init_view.dart
 ├── task_form_view.dart
 └── task_list_view.dart
├── produtos
 ├── listar.dart
 └── novo.dart
├── relatorios
 ├── clientes.dart
 ├── usuarios.dart
 └── vendas.dart
├── usuarios
 ├── listar.dart
 └── novo.dart
└── vendas
    ├── listar.dart
    ├── nova.dart
    └── visualisar.dart
 */
