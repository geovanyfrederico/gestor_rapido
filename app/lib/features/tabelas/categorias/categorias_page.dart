import 'package:flutter/material.dart';
import 'package:gr/features/tabelas/categorias/categorias_controller.dart';

import '../../../wigets/menu_drawer.dart';

class CategoriasPage extends StatefulWidget {
  const CategoriasPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CategoriasView();
  }
}

class CategoriasView extends State<CategoriasPage> {
  final CategoriasController _controller = CategoriasController();

  @override
  void initState() {
    super.initState();
    _controller.index(context).then((_) {
      setState(() {});
    });
  }

  _eliminar(index, BuildContext context) {
    _controller.eliminar(index, context);
    setState(() {});
  }

  _finalizarAdicionar() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      drawer:  MenuDrawer(),
      appBar: AppBar(
        title: const Text('Categorias de produto'),
        backgroundColor: Colors.orange,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Adicionar Categoria ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 16),
                      Padding(
                          padding: EdgeInsets.only(bottom: 0),
                          child: TextField(
                              keyboardType: TextInputType.text,
                              maxLength: 100,
                              controller: _controller.nome,
                              decoration: InputDecoration(
                                focusColor: Colors.orange,
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.orange, width: 2.0),
                                ),
                                border: InputBorder.none,
                                hintText: 'Nome da categoria',
                                counterText: "",
                              ))),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(15),
                                primary: Colors.orange,
                                textStyle: const TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              onPressed: () async {
                                await _controller.adicionar(context)
                                    ? _finalizarAdicionar()
                                    : false;
                              },
                              child: const Text('Adicionar'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
      body: Center(
          child: _controller.categorias.isEmpty
              ? Center(
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 300,
                        height: 300,
                        child:
                            Image.asset('assets/images/ilustration/gr2.png')),
                    const Text("Sem categorias",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey))
                  ],
                ))
              : Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ListView.builder(
                    itemCount: _controller.categorias.length,
                    itemBuilder: (context, index) => Card(
                      elevation: 1,
                      margin: const EdgeInsets.only(
                          left: 10, top: 10, right: 10, bottom: 5),
                      child: ListTile(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Wrap(
                                children: [
                                  const ListTile(
                                    leading: Icon(Icons.edit),
                                    title: Text('Editar'),
                                  ),
                                  ListTile(
                                      leading: Icon(Icons.delete),
                                      title: Text('Eliminar'),
                                      onTap: () {
                                        _eliminar(index, context);
                                        Navigator.pop(
                                            context); // close the bottom sheet
                                      }),
                                ],
                              );
                            },
                          );
                        },
                        title: Text(_controller.categorias[index].nome),
                      ),
                    ),
                  ))),
    );
  }
}
