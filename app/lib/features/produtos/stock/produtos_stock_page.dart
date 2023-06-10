import 'package:flutter/material.dart';
import 'package:gr/features/produtos/stock/produtos_stock_controller.dart';
import 'package:gr/models/movimento_de_stock_model.dart';
import 'package:gr/models/produto_model.dart';


class ProdutosStockPage extends StatefulWidget {
  const   ProdutosStockPage({
    Key? key, required this.produto,  this.callback}) : super(key: key);

  final ProdutoModel produto;
  final Function(bool atualizado)? callback;
  @override
  ProdutosEditarState createState() => ProdutosEditarState();
}

class ProdutosEditarState extends State<ProdutosStockPage> {
  final ProdutosStockController controller =
  ProdutosStockController();

  @override
  void initState() {
    _init();
    super.initState();

  }
  Future<void> _init() async {
    await controller.init(widget.produto);
    setState(() {});
  }

  @override
  Widget build(BuildContext context)  {
    final screenHeight = MediaQuery.of(context).size.height;
    final targetHeight = screenHeight *0.6; // 80% da altura da tela

    return SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child:  Container(
          height: targetHeight,
          padding:  const EdgeInsets.only(left: 20, top: 40, right: 20, bottom: 20),
          child:  ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Center(
                      child: Text("Movimentos de Stock")
                  ),
                  SizedBox(height: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.movimentos.length,
                    itemBuilder: (context, index) {
                      final MovimentoDeStockModel movimento = controller.movimentos[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${movimento.tipo}: ${movimento.ref}"),
                              Text("${movimento.icon()} ${movimento.totalQtd.toString()}"),
                            ],
                          ),
                          // Aqui você pode adicionar mais widgets e personalizar a exibição de cada item do ListView
                          // utilizando os dados de produtoNaVenda
                        ],
                      );
                    },
                  )
                ],
              )
            ],
          ),
        )
    );


  }
}
