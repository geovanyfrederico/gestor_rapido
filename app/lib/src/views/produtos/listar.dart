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
        title: Text('Produtos em Stok'),
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
          '${selecionada.length} Selecionados',
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
                  : Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                            )
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              tabela[produto].foto,
                            ),
                          )),
                    ),
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
  String foto;
  String nome;
  String descricao;
  double valor;

  Produtos({
    required this.descricao,
    required this.foto,
    required this.nome,
    required this.valor,
  });
}

class Repositorio {
  static List<Produtos> tabela = [
    Produtos(
        foto: 'assets/images/Magoga.png',
        nome: 'Magoga',
        valor: 200,
        descricao:
            ' A famosa “magoga” é a combinação de pão com frango, salada e maionese.'),
    Produtos(
        foto: 'assets/images/compal.png',
        nome: 'Compal em lata',
        valor: 500,
        descricao:
            ' É uma bebida com ingredientes de origem natural que concilia um sabor superior, com refrescância e naturalidade.'),
    Produtos(
        foto: 'assets/images/Croissant.png',
        nome: 'Croassã',
        valor: 700,
        descricao:
            'Croissant é um prato tradicional francês que ganhou uma série de redefinições em território brasileiro.'),
    Produtos(
        foto: 'assets/images/queque.png',
        nome: 'Queque',
        valor: 999,
        descricao:
            'Bolo pequeno e redondo, feito de farinha, gordura, ovos e açúcar. '),
    Produtos(
        foto: 'assets/images/Gasosa.png',
        nome: 'Gososa',
        valor: 200,
        descricao:
            'Um refrigerante surpreendente, quer pela sua qualidade, quer pela oferta alargada de sabores.'),
    Produtos(
        foto: 'assets/images/TOP_Gasosa.png',
        nome: 'Gasosa TOP',
        valor: 200,
        descricao:
            ' É uma verdadeira explosão de sabor, juventude e frescura.'),
  ];
}
