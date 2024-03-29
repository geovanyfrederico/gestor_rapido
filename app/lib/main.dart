import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gr/features/clientes/adicionar/clientes_adicionar_page.dart';
import 'package:gr/features/contactos/contactos_page.dart';
import 'package:gr/features/dasboard/dasboard_page.dart';
import 'package:gr/features/entrar/entrar_page.dart';
import 'package:gr/features/fornecedores/adicionar/fornecedores_adicionar_page.dart';
import 'package:gr/features/onboarding/onboarding_screen.dart';
import 'package:gr/features/produtos/adicionar/produtos_adicionar_page.dart';
import 'package:gr/features/produtos/produtos_page.dart';
import 'package:gr/features/recuperar_pin/recuperar_pin_page.dart';
import 'package:gr/features/registrar/registar_page.dart';
import 'package:gr/features/relatorios/clientes/relatorios_clientes_page.dart';
import 'package:gr/features/relatorios/relatorios_page.dart';
import 'package:gr/features/relatorios/utilizadores/relatorios_utilizadores_page.dart';
import 'package:gr/features/tabelas/categorias/categorias_page.dart';
import 'package:gr/features/utilizadores/adicionar/utilizadores_adicionar_page.dart';
import 'package:gr/features/utilizadores/utilizadores_page.dart';
import 'package:gr/features/vendas/adicionar/vendas_adicionar_page.dart';
import 'package:gr/features/vendas/vendas_page.dart';
import 'exemplo_page.dart';
import 'features/compras/adicionar/compras_adicionar_page.dart';
import 'features/compras/compras_page.dart';
import 'features/empresa/empresa_page.dart';
import 'features/relatorios/compras/relatorios_compras_page.dart';
import 'features/relatorios/fornecedores/relatorios_fornecedores_page.dart';
import 'features/relatorios/vendas/relatorios_vendas_page.dart';
import 'features/tabelas/tabelas_page.dart';

void main() async {
  return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My Smart App',
      debugShowCheckedModeBanner: false,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    ); //added by extension
  }
}

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/',
        child: (context, args) => OnboardingScreen(),
        transition: TransitionType.fadeIn),
    ChildRoute('/test',
        child: (context, args) => ExemploPage(),
        transition: TransitionType.fadeIn),
    ChildRoute('/dashboard',
        child: (context, args) => DashboardPage(),
        transition: TransitionType.fadeIn),
    //Contactos
    ChildRoute('/contactos',
        child: (context, args) => ContactosPage(),
        transition: TransitionType.fadeIn),
    //Produtos
    ChildRoute('/produtos',
        child: (context, args) => ProdutosPage(),
        transition: TransitionType.fadeIn),
    ChildRoute('/produtos/adicionar',
        child: (context, args) => ProdutosAdicionarPage(),
        transition: TransitionType.fadeIn),
    //Vendas
    ChildRoute('/vendas',
        child: (context, args) => VendasPage(),
        transition: TransitionType.fadeIn),
    ChildRoute('/vendas/adicionar',
        child: (context, args) => VendasAdicionarPage(),
        transition: TransitionType.fadeIn),
    ChildRoute('/compras',
        child: (context, args) => ComprasPage(),
        transition: TransitionType.fadeIn),
    ChildRoute('/compras/adicionar',
        child: (context, args) => ComprasAdicionarPage(),
        transition: TransitionType.fadeIn),
    //Clientes
    ChildRoute('/clientes/adicionar',
        child: (context, args) => ClientesAdicionarPage(),
        transition: TransitionType.fadeIn),
    //Forncedores
    ChildRoute('/fornecedores/adicionar',
        child: (context, args) => FornecedoresAdicionarPage(),
        transition: TransitionType.fadeIn),

    //Utilizadors
    ChildRoute('/utilizadores',
        child: (context, args) => UtilizadorsPage(),
        transition: TransitionType.fadeIn),
    ChildRoute('/utilizadores/adicionar',
        child: (context, args) => UtilizadorsAdicionarPage(),
        transition: TransitionType.fadeIn),
    //Autenticacao
    ChildRoute('/registar',
        child: (context, args) => RegistarPage(),
        transition: TransitionType.fadeIn),
    ChildRoute('/entrar',
        child: (context, args) => EntrarPage(),
        transition: TransitionType.fadeIn),
    ChildRoute('/recuperar',
        child: (context, args) => RecuperarPinPage(),
        transition: TransitionType.fadeIn),
    //outros
    ChildRoute('/tabelas',
        child: (context, args) => TabelasPage(),
        transition: TransitionType.fadeIn),
    ChildRoute('/categorias',
        child: (context, args) => CategoriasPage(),
        transition: TransitionType.fadeIn),
    ChildRoute('/relatorios',
        child: (context, args) => RelatoriosPage(),
        transition: TransitionType.fadeIn),
    ChildRoute('/relatorios/clientes',
        child: (context, args) => RelatoriosClientesPage(),
        transition: TransitionType.fadeIn),
    ChildRoute('/relatorios/fornecedor',
        child: (context, args) => RelatoriosFornecedoresPage(),
        transition: TransitionType.fadeIn),
    ChildRoute('/relatorios/vendas',
        child: (context, args) => RelatoriosVendasPage(),
        transition: TransitionType.fadeIn),
    ChildRoute('/relatorios/compras',
        child: (context, args) => RelatoriosComprasPage(),
        transition: TransitionType.fadeIn),
    ChildRoute('/relatorios/utilizadores',
        child: (context, args) => RelatoriosUtilizadoresPage(),
        transition: TransitionType.fadeIn),
    ChildRoute('/empresa',
        child: (context, args) => EmpresaPage(),
        transition: TransitionType.fadeIn),
  ];
}
