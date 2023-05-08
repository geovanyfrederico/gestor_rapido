import 'dart:developer';
import 'dart:io';
import 'package:gr/features/vendas/adicionar/vendas_adicionar_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gr/core/utils/snackbar_helper.dart';
class VendasAdicionarPage extends StatefulWidget  {
  const VendasAdicionarPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return VendasAdicionarState();
  }
}
class VendasAdicionarState extends State<VendasAdicionarPage> {
  final VendasAdicionarController controller = VendasAdicionarController();
  File? imageFile;
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
            Modular.to.navigate("/vendas")
          },
        ),
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text('Adicionar vendas'),
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
                  children:  [
                    GestureDetector(
                        onTap:() async {
                          PickedFile? pickedFile = await ImagePicker().getImage(
                            source: ImageSource.gallery,
                            maxWidth: 1800,
                            maxHeight: 1800,
                          );
                          if (pickedFile != null) {
                            setState(() {
                              imageFile = File(pickedFile.path);
                            });
                          }
                          SnackbarHelper.success(context, 'Adicionar foto');
                        },
                        child:     Padding(
                            padding:  EdgeInsets.only(bottom: 20),
                            child:
                            CircleAvatar(
                                radius: 70,
                                backgroundImage:NetworkImage('https://via.placeholder.com/150'),
                                backgroundColor: Colors.transparent
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
                              hintText: 'Nome',
                              counterText: "",
                              prefixIcon: Icon(Icons.shopping_cart),
                            )
                        )
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: TextField(

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
                              hintText: 'Preço',
                              counterText: "",
                              prefixIcon: Icon(Icons.attach_money),
                            )
                        )
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: TextField(
                            keyboardType: TextInputType.phone,
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
                              prefixIcon: Icon(Icons.phone),
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

