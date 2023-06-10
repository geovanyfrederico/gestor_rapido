import 'package:flutter/material.dart';
import 'package:gr/features/produtos/editar/produtos_editar_controller.dart';

import 'package:gr/models/produto_model.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/utils/snackbar_helper.dart';


class ProdutosEditarPage extends StatefulWidget {
  const   ProdutosEditarPage({
    Key? key, required this.produto,  this.callback}) : super(key: key);

  final ProdutoModel produto;
  final Function(bool atualizado)? callback;
  @override
  ProdutosEditarState createState() => ProdutosEditarState();
}

class ProdutosEditarState extends State<ProdutosEditarPage> {
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
  Future<void> _atualizar() async {
    final atualizado  = await controller.atualizar(context);
    widget.callback?.call(atualizado);
    setState(() {});
  }


  @override
  Widget build(BuildContext context)  {
    final screenHeight = MediaQuery.of(context).size.height;
    final targetHeight = screenHeight * 0.7; // 80% da altura da tela
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
                  Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextField(
                          keyboardType: TextInputType.text,
                          maxLength: 50,
                          autocorrect: false,
                          controller: controller.nome,
                          decoration: const InputDecoration(
                            focusColor: Colors.orange,
                            filled: true,
                            contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.orange, width: 2.0),
                            ),
                            border: InputBorder.none,
                            hintText: 'Nome *',
                            counterText: "",
                            prefixIcon: Icon(Icons.shopping_cart),
                          )
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextField(
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          maxLength: 50,
                          autocorrect: false,
                          controller: controller.preco,
                          decoration: const InputDecoration(
                            focusColor: Colors.orange,
                            filled: true,
                            contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.orange, width: 2.0),
                            ),
                            border: InputBorder.none,
                            hintText: 'Preço *',
                            counterText: "",
                            prefixIcon: Icon(Icons.attach_money),
                          )
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextField(
                          keyboardType: TextInputType.text,
                          maxLength: 50,
                          autocorrect: false,
                          controller: controller.codigo,
                          decoration: const InputDecoration(
                            focusColor: Colors.orange,
                            filled: true,
                            contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.orange, width: 2.0),
                            ),
                            border: InputBorder.none,
                            hintText: 'Código',
                            counterText: "",
                            prefixIcon: Icon(Icons.qr_code),
                          )
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextField(
                          keyboardType: TextInputType.number,
                          maxLength: 9,
                          controller: controller.stock,
                          decoration: const InputDecoration(
                            focusColor: Colors.orange,
                            filled: true,
                            contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.orange, width: 2.0),
                            ),
                            border: InputBorder.none,
                            hintText: 'Stock Inicial',
                            counterText: "",
                            prefixIcon: Icon(Icons.inbox_sharp),
                          )
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextField(
                          keyboardType: TextInputType.text,
                          maxLength: 255,
                          controller: controller.motivo,
                          decoration: const InputDecoration(
                            focusColor: Colors.orange,
                            filled: true,
                            contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.orange, width: 2.0),
                            ),
                            border: InputBorder.none,
                            hintText: 'Motivo de atualização de stock',
                            counterText: "",
                            prefixIcon: Icon(Icons.inbox_sharp),
                          )
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Center(
                          child: Container(
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                Icon(Icons.info, color: Colors.grey[500], size: 15),
                                SizedBox(width: 5),
                                Text(
                                  "Editar o stock irá criar um novo movimento de stock",
                                  style: TextStyle(color: Colors.grey[500]),
                                ),
                              ],
                            ),
                          )

                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          _atualizar();

                        },
                        child: const Text("Atualizar"),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          primary: Colors.orange,
                          textStyle: const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        )
    );


  }
}
