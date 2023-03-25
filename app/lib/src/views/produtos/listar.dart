import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gr/src/config/app_theme.dart';
import 'package:gr/src/controllers/AuthController.dart';
import 'package:gr/theme/theme1.dart';
import 'package:gr/src/views/produtos/novo.dart';
import 'package:gr/src/views/produtos/listar.dart';
import 'package:gr/src/views/contactos/listar.dart';
import 'package:gr/src/config/perfil.dart';
import 'package:gr/src/views/dashboard/geral.dart';
import 'package:gr/src/views/vendas/listar.dart';

class ProdutosListarView extends StatelessWidget {
  final AuthController controller =
      Get.put(AuthController()); // Adicione o controller aqui
  ProdutosListarView({super.key});
  final tabela = Repositorio.tabela;

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
        title: Text('ProdutoS'),
        actions: [
          IconButton(
            iconSize: 40,
            splashColor: Theme1.primary,
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProdutosNovoView()));
            },
          )
        ],
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int produto) {
          return ListTile(
            leading: Image.asset(tabela[produto].icone),
            title: Text(tabela[produto].nome),
            trailing: Text(tabela[produto].valor.toString()),
          );
        },
        padding: EdgeInsets.all(16),
        separatorBuilder: (_, __) => Divider(),
        itemCount: tabela.length,
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

    /* Scaffold(
      body: Center(
        child: Row(
          children: [TextField()],
        ),
      ),
    );*/
  }
}

class Produtos {
  String icone;
  String nome;
  double valor;

  Produtos({
    required this.icone,
    required this.nome,
    required this.valor,
  });
}

class Repositorio {
  static List<Produtos> tabela = [
    Produtos(icone: 'assets/images/Banana.png', nome: 'Banana', valor: 200),
    Produtos(icone: 'assets/images/Pera.png', nome: 'Pera', valor: 150),
    Produtos(icone: 'assets/images/Manga.png', nome: 'Manga', valor: 700),
    Produtos(icone: 'assets/images/Gingibre.png', nome: 'Gingibre', valor: 999),
    Produtos(icone: 'assets/images/Goiaba.png', nome: 'Goiaba', valor: 199),
    Produtos(icone: 'assets/images/Tomate.png', nome: 'Tomate', valor: 200),
  ];
}
