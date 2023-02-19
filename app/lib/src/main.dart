import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:templates/src/views/auth/entrar.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Gestor Rápido',
      initialRoute: '/auth/entrar',
      getPages: [
        GetPage(name: '/auth/entrar', page: () =>  AuthEntrarView()),
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
