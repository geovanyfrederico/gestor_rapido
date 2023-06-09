import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gr/wigets/menu_drawer.dart';

import 'relatorios_controller.dart';

class RelatoriosPage extends StatefulWidget {
  const RelatoriosPage({Key? key}) : super(key: key);

  @override
  _RelatoriosPageState createState() => _RelatoriosPageState();
}

class _RelatoriosPageState extends State<RelatoriosPage> {
  RelatoriosController controller = RelatoriosController();

  @override
  void initState() {
    super.initState();
    controller.init().then((value) => {
      setState(() {})
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        drawer:  MenuDrawer(),
        appBar: AppBar(
          title: const Text('Relatorios'),
          backgroundColor: Colors.orange,
        ),
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(10),
            children: [
              _buildRelatorioCard("Geral", "Visualize um relatório geral de como está sua gestão", image: 'gr1', link:"geral"),
              _buildRelatorioCard("Clientes", "Veja um relatório detalhado sobre seus clientes",image: 'gr7', link:"clientes"),
              _buildRelatorioCard("Vendas", "Acompanhe as informações de vendas e faturamento",image: 'gr3', link:"vendas"),
              _buildRelatorioCard("Utilizadores", "Analise o desempenho dos operadores da sua empresa",image: 'gr4', link:"utilizadores"),
              _buildRelatorioCard("Produto", "Obtenha insights sobre os seus produtos mais vendidos",image: 'gr9', link:"produtos"),
              _buildRelatorioCard("Compras", "Avalie os registros de compras e fornecedores",image: 'gr7', link:"compras"),
              _buildRelatorioCard("Por Fornecedor", "Veja um relatório específico para cada fornecedor",image: 'gr6', link:"fornecedor"),
            ],
          ),
        )
    );
  }
  Widget _buildRelatorioCard(String titulo, String subtitulo, {String image = 'gr1', String link = ""} ){
    return GestureDetector(
        onTap: (){
          Modular.to.pushNamed('/relatorios/$link');
        },
        child: Card(
          child: Padding( padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  child: Image.asset(
                    'assets/images/ilustration/$image.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "${titulo}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600],

                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '${subtitulo}',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );

  }
}

