import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../wigets/menu_drawer.dart';


class TabelasPage extends StatefulWidget  {
  const TabelasPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ClientesListarView();
  }
}

class ClientesListarView extends State<TabelasPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      drawer:  MenuDrawer(),
      appBar: AppBar(
        title: const Text('Tabelas'),
        backgroundColor: Colors.orange,
      ),
      resizeToAvoidBottomInset:true,
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child:   ListView.builder(
                itemCount:1,
                itemBuilder: (context, index) => Card(
                  elevation: 1,
                  margin: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 5),
                  child: ListTile(
                    onTap: () {
                      Modular.to.navigate("/categorias");
                    },
                    title: Text("Categorias"),
                    subtitle: Text("Permite gerir categorias dos produtos"),
                    trailing: const Icon(Icons.arrow_right_alt_rounded),
                  ),
                ),
              )
          )

      ),
    );
  }
}

