import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gr/src/config/app_theme.dart';
import 'package:gr/src/controllers/controlador_padrao.dart';
import 'package:gr/theme/theme1.dart';
import 'package:gr/src/views/produtos/novo.dart';
import 'package:gr/src/views/produtos/listar.dart';
import 'package:gr/src/views/contactos/listar.dart';
import 'package:gr/src/config/perfil.dart';
import 'package:gr/src/views/dashboard/geral.dart';
import 'package:gr/src/views/vendas/listar.dart';
import 'package:intl/intl.dart';
import 'package:gr/src/views/produtos/produtopage.dart';

class ProdutosListarView extends StatefulWidget {
  ProdutosListarView({super.key});

  @override
  State<ProdutosListarView> createState() => _ProdutosListarViewState();
}

class _ProdutosListarViewState extends State<ProdutosListarView> {
  final ControladorPadrao controller = Get.put(ControladorPadrao());
  final tabela = Repositorio.tabela;
  NumberFormat kwanza = NumberFormat.currency(name: 'Kz ');
  List<Produtos> selecionada = [];
  appbarDinamica() {
    if (selecionada.isEmpty) {
      return AppBar(
        backgroundColor: Theme1.primary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DashboardGeralView()));
          },
        ),
        title: Text('Stoks dos ProdutoS'),
      );
    } else {
      return AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black87,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              selecionada = [];
            });
          },
        ),
        title: Text(
          '${selecionada.length} Selecionadas',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        elevation: 1,
        actions: [
          IconButton(
            color: Colors.black87,
            icon: Icon(Icons.delete),
            onPressed: () {},
          )
        ],
      );
    }
  }

  mostrarDetalhes(Produtos produtos) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => ProdutosDetalhes(produto: produtos)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbarDinamica(),
        body: ListView.separated(
          itemBuilder: (BuildContext context, int produto) {
            return ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              leading: (selecionada.contains(tabela[produto]))
                  ? CircleAvatar(
                      backgroundColor: Theme1.primary,
                      child: Icon(Icons.check),
                    )
                  : Image.asset(tabela[produto].icone),
              title: Text(tabela[produto].nome),
              trailing: Text(kwanza.format(tabela[produto].valor)),
              selected: selecionada.contains(tabela[produto]),
              selectedTileColor: Colors.black12,
              selectedColor: Colors.black87,
              onLongPress: () {
                setState(() {
                  (selecionada.contains(tabela[produto]))
                      ? selecionada.remove(tabela[produto])
                      : selecionada.add(tabela[produto]);
                });
              },
              onTap: () {
                setState(() {
                  (selecionada.isEmpty)
                      ? mostrarDetalhes(tabela[produto])
                      : (selecionada.contains(tabela[produto]))
                          ? selecionada.remove(tabela[produto])
                          : selecionada.add(tabela[produto]);
                });
              },
            );
          },
          padding: EdgeInsets.all(16),
          separatorBuilder: (_, __) => Divider(),
          itemCount: tabela.length,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: selecionada.isEmpty
            ? FloatingActionButton.extended(
                backgroundColor: Theme1.primary,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProdutosNovoView()));
                },
                label: Text(
                  'Adicionar produto ao Stock',
                  style: TextStyle(
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                  ),
                ))
            : null);

    //=================================Repositorio===========================================
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
