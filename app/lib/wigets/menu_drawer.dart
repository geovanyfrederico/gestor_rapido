import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gr/models/empresa_model.dart';
import 'package:gr/models/utilizador_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/utils/Testos.dart';
import '../models/utilizador_model.dart';

class MenuDrawer extends StatefulWidget{
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return  MenuDrawerState();
  }

}
class MenuDrawerState extends State<MenuDrawer> {
  late SharedPreferences _prefs;
  late String utilizadorNome = "Gestor Rapido";
  late String utilizadorTipo = "";
  late String empresaNome = "Gestor Rapido";

  // Initialize shared preferences
  Future<void> initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    utilizadorNome =  _prefs.getString("utilizadorNome")!;
    utilizadorTipo =  UtilizadorModel.tipoDescricaoStatico(_prefs.getInt("utilizadorTipo")?.toInt()) ;
    EmpresaModel empresa = await EmpresaModel.findFirst();
    empresaNome = empresa.nome;
    setState(() {

    });
    // Check if user has completed onboarding
  }

  @override
  void initState() {
    initPrefs();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey[100], // Define a cor de fundo do drawer
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("\n${empresaNome}\n$utilizadorNome"),
              accountEmail: Text(utilizadorTipo),
              currentAccountPicture: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: CircleAvatar(

                  backgroundColor: Colors.orangeAccent,
                  child: Text(
                    Testos.siglas(utilizadorNome),
                    style: TextStyle(fontSize: 20.0,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.orange, // Define a cor do cabeçalho
              ),
            ),


            ListTile(
              leading: const Icon(Icons.apps),
              title: const Text('Início'),
              onTap: () {
                Modular.to.navigate("/dashboard");
              },
            ),
            ListTile(
              leading: const Icon(Icons.fastfood),
              title: const Text('Produtos'),
              onTap: () {
                Modular.to.navigate("/produtos");
              },
            ),
            ListTile(
              leading: const Icon(Icons.point_of_sale),
              title: const Text('Vendas'),
              onTap: () {
                Modular.to.navigate("/vendas");
              },
            ),
            ListTile(
              leading: const Icon(Icons.storefront_sharp),
              title: const Text('Compras'),
              onTap: () {
                Modular.to.navigate("/compras");
              },
            ),
            ListTile(
              leading: const Icon(Icons.import_contacts),
              title: const Text('Contactos'),
              onTap: () {
                Modular.to.navigate("/contactos");
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Utilizadores'),
              onTap: () {
                Modular.to.navigate("/utilizadores");
              },
            ),
            ListTile(
              leading: const Icon(Icons.query_stats),
              title: const Text('Relatorios'),
              onTap: () {
                Modular.to.navigate("/relatorios");
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.store),
              title: const Text('Empresa'),
              onTap: () {
                Modular.to.navigate("/empresa");
              },
            ),
            const Divider(),
            ListTile(
              leading:const Icon(Icons.logout),
              title: const Text('Sair'),
              onTap: () async {
                SharedPreferences _prefs = await SharedPreferences.getInstance();
                await _prefs.setBool('logado', false);
                await _prefs.remove('utilizadorNome');
                await _prefs.remove('utilizadorTipo');
                Modular.to.navigate("/entrar");
              },
            ),
            ListTile(
              leading:const Icon(Icons.help),
              title: const Text('Ajuda'),
              onTap: () {
                Modular.to.navigate("/dashboard");
              },
            ),
          ],
        ),
      ),
    );
  }


}


