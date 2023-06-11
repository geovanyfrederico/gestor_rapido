import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gr/core/utils/snackbar_helper.dart';
import 'package:gr/features/produtos/adicionar/produtos_adicionar_controller.dart';
import 'package:image_picker/image_picker.dart';
class ProdutosAdicionarPage extends StatefulWidget  {
  const ProdutosAdicionarPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ProdutosAdicionarState();
  }
}
class ProdutosAdicionarState extends State<ProdutosAdicionarPage> {
  final ProdutosAdicionarController controller = ProdutosAdicionarController();
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
          onPressed: () => {
            Modular.to.navigate("/produtos")

          },
        ),
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text('Adicionar produto'),
      ),
      resizeToAvoidBottomInset:true,
      backgroundColor: Colors.grey[100],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.salvar(context);
          setState(() {

          });
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.save),
      ),
      body:  SafeArea(
          child:  Container(
            padding:  const EdgeInsets.only(left: 20, top: 40, right: 20, bottom: 20),
            child:  ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Center(
                      child: GestureDetector(
                          onTap:() async {
                            PickedFile? pickedFile = await ImagePicker().getImage(
                              source: ImageSource.gallery,
                              maxWidth: 1800,
                              maxHeight: 1800,
                            );
                            if (pickedFile != null) {
                              setState(() {
                                controller.foto = File(pickedFile.path);
                              });
                            }
                            SnackbarHelper.success(context, 'Adicionar foto');
                          },
                          child:     Padding(
                              padding:  const EdgeInsets.only(bottom: 20),
                              child:
                              CircleAvatar(
                                  radius: 60,
                                  backgroundImage:controller.foto != null ? AssetImage(controller.foto!.path) : const AssetImage("assets/images/produto/padrao.png"),
                                  backgroundColor: Colors.transparent
                              )
                          )
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: TextField(
                            keyboardType: TextInputType.text,
                            maxLength: 50,
                            autocorrect: false,
                            controller: controller.nome,
                            // Every single time the text changes in a
                            // TextField, this onChanged callback is called
                            // and it passes in the value.
                            //
                            // Set the text of your controller to
                            // to the next value.
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
                            // Every single time the text changes in a
                            // TextField, this onChanged callback is called
                            // and it passes in the value.
                            //
                            // Set the text of your controller to
                            // to the next value.
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
                            // Every single time the text changes in a
                            // TextField, this onChanged callback is called
                            // and it passes in the value.
                            //
                            // Set the text of your controller to
                            // to the next value.
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
                            // Every single time the text changes in a
                            // TextField, this onChanged callback is called
                            // and it passes in the value.
                            //
                            // Set the text of your controller to
                            // to the next value.
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
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}

