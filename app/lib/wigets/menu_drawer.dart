import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey[100], // Define a cor de fundo do drawer
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text('Fabrício Gonga'),
              accountEmail: Text('925924797'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orangeAccent,
                child: Text(
                  'FG',
                  style: TextStyle(fontSize: 20.0,
                      color: Colors.white
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
                Modular.to.navigate("/dashboard");
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
              title: const Text('Usuarios'),
              onTap: () {
                Modular.to.navigate("/usuarios");
              },
            ),
            ListTile(
              leading: const Icon(Icons.query_stats),
              title: const Text('Relatorios'),
              onTap: () {
                Modular.to.navigate("/test");
              },
            ),
            const Divider(),
            ListTile(
              leading:const Icon(Icons.logout),
              title: const Text('Sair'),
              onTap: () async {
                SharedPreferences _prefs = await SharedPreferences.getInstance();
                await _prefs.setBool('logado', false);
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


