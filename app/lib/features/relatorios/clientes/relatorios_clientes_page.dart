import 'package:gr/core/utils/alert_help.dart';
import 'package:gr/core/utils/mat.dart';
import 'package:gr/features/vendas/adicionar/vendas_adicionar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gr/features/vendas/adicionar/wigets/finalizar_modal/finalizar_modal_page.dart';
import 'package:gr/features/vendas/adicionar/wigets/produtos_no_carrinho_page.dart';
import 'package:gr/models/produto_model.dart';

import '../../../wigets/date_range_selector.dart';

class RelatoriosClientesPage extends StatefulWidget {
  const RelatoriosClientesPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return VendasAdicionarState();
  }
}

class VendasAdicionarState extends State<RelatoriosClientesPage> {
  final VendasAdicionarController controller = VendasAdicionarController();

  String? valorFilho;

  // Função de callback para receber o valor do filho
  void finalizarVenda(double troco ) {
    controller.finalizarVenda();
    Navigator.pop(context);
    setState(() {});
    AlertHelper.success(context, 'Troco: '+Mat.numeroParaDinheiro(troco), title: 'Venda concluida');
  }
  // Função de callback para receber o valor do filho
  void adicionarAoCarrinho(ProdutoModel produto) {
    controller.adicionar(produto);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => {Modular.to.navigate("/relatorios")},
        ),
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text('Relatorios de clientes'),
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey[100],
      body: SafeArea(
          child: Stack(
            children: [
              Container(),
              Positioned.fill(child: Center(
                child: Text("Aqui vai ficar o report do cliente"),
              ),),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                        child: DateRangeSelector()
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                              child: ElevatedButton(
                                  onPressed: () async => {
                                    if(controller.podeFinalizarVenda(context)){
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (BuildContext context) {
                                          return FinalizarModalPage(totalPagarDoCarrinho: controller.totalPagar, produtosDoCarrinho: controller.produtos, callback: finalizarVenda);
                                        },
                                      )
                                    }
                                  },
                                  child: const Text("Gerar Relatorio"),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 15,
                                    ),
                                    primary: Colors.orange,
                                    textStyle: const TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )))
                        ],
                      ),


                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
