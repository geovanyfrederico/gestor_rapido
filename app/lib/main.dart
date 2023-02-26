import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:templates/src/views/auth/entrar.dart';
import 'package:templates/src/views/auth/registar.dart';
import 'package:templates/src/views/contactos/novo.dart';
import 'package:templates/src/views/produtos/novo.dart';
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
        GetPage(name: '/contactos/novo', page: () => ContactosNovoView()),
        GetPage(name: '/produtos/novo', page: () => ProdutosNovoView()),
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
