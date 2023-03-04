import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:templates/src/config/app_theme.dart';
import 'package:templates/src/controllers/AuthController.dart';

class ProdutosListarView extends StatelessWidget {
  final AuthController controller =
      Get.put(AuthController()); // Adicione o controller aqui
  ProdutosListarView({super.key});
  final tabela = Repositorio.tabela;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
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
            leading: Text(tabela[produto].sigla),
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
        hoverColor: Colors.black,
        icon: Icon(Icons.add),
        onPressed: () {},
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
  String sigla;
  double valor;

  Produtos({
    required this.icone,
    required this.nome,
    required this.sigla,
    required this.valor,
  });
}

class Repositorio {
  static List<Produtos> tabela = [
    Produtos(icone: '', nome: 'Banana', sigla: 'Bn', valor: 200),
    Produtos(icone: '', nome: 'Pera', sigla: 'Pr', valor: 150),
    Produtos(icone: '', nome: 'Manga', sigla: 'Mg', valor: 700),
    Produtos(icone: '', nome: 'Gingibre', sigla: 'Gb', valor: 999),
    Produtos(icone: '', nome: 'Goiaba', sigla: 'Go', valor: 199),
    Produtos(icone: '', nome: 'Tomate', sigla: 'Tm', valor: 200),
  ];
}
