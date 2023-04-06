import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gr/src/views/auth/entrar.dart';
import 'package:gr/src/views/auth/registar.dart';
import 'package:gr/src/views/compras/listar.dart';
import 'package:gr/src/views/compras/novo.dart';
import 'package:gr/src/views/contactos/NovoCliente.dart';
import 'package:gr/src/views/contactos/NovoFornecedor.dart';
import 'package:gr/src/views/contactos/listar.dart';
import 'package:gr/src/views/dashboard/geral.dart';
import 'package:gr/src/views/produtos/novo.dart';
import 'package:gr/src/views/produtos/listar.dart';
import 'package:gr/src/views/relatorios/clientes.dart';
import 'package:gr/src/views/relatorios/usuarios.dart';
import 'package:gr/src/views/relatorios/vendas.dart';
import 'package:gr/src/views/usuarios/listar.dart';
import 'package:gr/src/views/usuarios/novo.dart';
import 'package:gr/src/views/vendas/listar.dart';
import 'package:gr/src/views/vendas/nova.dart';
import 'package:gr/src/views/vendas/visualisar.dart';
import 'package:gr/src/config/perfil.dart';
import 'package:gr/src/config/novoperfil.dart';
import 'package:gr/src/config/app_theme.dart';
import 'package:gr/src/views/auth/newpageSenha.dart';
import 'package:gr/src/views/auth/senha.dart';

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
      initialRoute: '/auth/entrar',
      getPages: [
        GetPage(name: '/dashboards/geral', page: () => DashboardGeralView()),
        // Auth(Autenticacão)

        GetPage(name: '/auth/entrar', page: () => AuthEntrarView()),
        GetPage(name: '/auth/registar', page: () => AuthRegistarView()),
        // Compras
        GetPage(name: '/compras/listar', page: () => ComprasListarView()),
        GetPage(name: '/compras/novo', page: () => ComprasNovoView()),
        // Contactos
        GetPage(
            name: '/contactos/NovoCliente',
            page: () => ContactosNovoClienteView()),
        GetPage(
            name: '/contactos/NovoFornecedor',
            page: () => ContactosNovoFornecedorView()),
        GetPage(name: '/contactos/listar', page: () => ContactosListarView()),
        // Produtos
        GetPage(name: '/produtos/novo', page: () => ProdutosNovoView()),
        GetPage(name: '/produtos/listar', page: () => ProdutosListarView()),

        // Relatorios
        GetPage(
            name: '/relatorios/clientes', page: () => RelatoriosClientesView()),
        GetPage(
            name: '/relatorios/usuarios', page: () => RelatoriosUsuariosView()),
        GetPage(name: '/relatorios/vendas', page: () => RelatoriosVendasView()),
        // Usuarios
        GetPage(name: '/usuarios/listar', page: () => UsuariosListarView()),
        GetPage(name: '/usuarios/novo', page: () => UsuariosNovoView()),
        // Vendas
        GetPage(name: '/vendas/listar', page: () => VendasListarView()),
        GetPage(name: '/vendas/nova', page: () => VendasNovaView()),
        GetPage(name: '/vendas/visualisar', page: () => VendasVisualisarView()),
        //Perfil
        GetPage(name: '/config/perfil', page: () => ConfigPerfilView()),
        GetPage(name: '/config/novoperfil', page: () => ConfigNovoperfilView()),

        GetPage(name: '/auth/newpageSenha', page: () => OutraPage()),
        GetPage(name: '/auth/senha', page: () => AuthSenhaView()),
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
