import 'package:flutter/material.dart';
import '../theme/theme1.dart';
class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme1.gray, // Define a cor de fundo do drawer
        child: ListView(
          padding: EdgeInsets.zero,

          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text('Fabrício Gonga'),
              accountEmail: Text('925924797'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Theme1.primaryDark,
                child: Text(
                  'FG',
                  style: TextStyle(fontSize: 20.0,
                      color: Theme1.nearlyWhite),
                ),
              ),
              decoration: BoxDecoration(
                color: Theme1.primary, // Define a cor do cabeçalho
              ),
            ),
            ListTile(
              leading: const Icon(Icons.apps),
              title: const Text('Início'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.fastfood),
              title: const Text('Produtos'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.point_of_sale),
              title: const Text('Vendas'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.import_contacts),
              title: const Text('Contactos'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.inventory),
              title: const Text('Compras'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.query_stats),
              title: const Text('Relatorios'),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading:const Icon(Icons.logout),
              title: const Text('Sair'),
              onTap: () {},
            ),
            ListTile(
              leading:const Icon(Icons.help),
              title: const Text('Ajuda'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}


