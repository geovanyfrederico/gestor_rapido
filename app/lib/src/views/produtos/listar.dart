import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:templates/src/config/app_theme.dart';
import 'package:templates/src/controllers/AuthController.dart';
import 'package:templates/src/views/produtos/novo.dart';

class ProdutosListarView extends StatelessWidget {
  final AuthController controller =
      Get.put(AuthController()); // Adicione o controller aqui
  ProdutosListarView({super.key});
  final tabela = Repositorio.tabela;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          iconSize: 40,
          splashColor: Colors.black,
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text('ProdutoS'),
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
      floatingActionButton: IconButton(
        iconSize: 100,
        splashColor: Colors.blue,
        icon: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProdutosNovoView()));
        },
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
