import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gr/src/views/auth/entrar_view.dart';
import 'package:gr/src/views/auth/recuperar_pin_codigo_view.dart';
import 'package:gr/src/views/auth/recuperar_pin_view.dart';
import 'package:gr/src/views/auth/registar_view.dart';
import 'package:gr/src/views/compras/listar.dart';
import 'package:gr/src/views/compras/novo.dart';
import 'package:gr/src/views/contactos/NovoCliente.dart';
import 'package:gr/src/views/contactos/NovoFornecedor.dart';
import 'package:gr/src/views/contactos/listar.dart';
import 'package:gr/src/views/dashboard/geral.dart';

import 'package:gr/src/views/dashboard/info.dart';
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
        GetPage(name: '/dashboard/geral', page: () => DashboardGeralView()),
        GetPage(name: '/dashboard/info', page: () => DashboardInfoView()),

        // Auth(Autenticacão)

        GetPage(name: '/auth/entrar', page: () => EntrarView()),
        GetPage(name: '/auth/registar', page: () => RegistarView()),
        GetPage(name: '/auth/recuperar/pin', page: () => RecuperarPinView()),
        GetPage(name: '/auth/recuperar/pin/codigo', page: () => RecuperarPinCodigoView()),
        // Compras
        GetPage(name: '/compras/listar', page: () => ComprasListarView()),
        GetPage(name: '/compras/novo', page: () => ComprasNovoView()),
        // Contactos
        GetPage(
            name: '/contactos/NovoCliente',
            page: () => const ContactosNovoClienteView()),
        GetPage(
            name: '/contactos/NovoFornecedor',
            page: () => const ContactosNovoFornecedorView()),
        GetPage(name: '/contactos/listar', page: () => const ContactosListarView()),
        // Produtos
        GetPage(name: '/produtos/novo', page: () => const ProdutosNovoView()),
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
      ],
    );
  }
}
