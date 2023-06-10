import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gr/core/utils/mat.dart';
import 'package:gr/features/produtos/editar/produtos_editar_controller.dart';
import 'package:gr/core/utils/tempo.dart';
import 'package:gr/models/produto_model.dart';


class ProdutosEditarPage extends StatefulWidget {
  const ProdutosEditarPage({
    Key? key, required this.produto}) : super(key: key);

  final ProdutoModel produto;
  @override
  VisualizarModalState createState() => VisualizarModalState();
}

class VisualizarModalState extends State<ProdutosEditarPage> {
  final ProdutosEditarController controller =
  ProdutosEditarController();

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
    final targetHeight = screenHeight *0.9; // 80% da altura da tela

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child:  SizedBox(
          height: targetHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                  elevation: 1,
                  margin: const EdgeInsets.only(
                      left: 10, top: 10, right: 10, bottom: 5),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        onTap: () {

                        },
                        title:  Text("Editar ${controller.produto.nome}",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [


                          ],
                        ),
                      )
                  )
              ),

            ],
          )
      ),
    );


  }
}
