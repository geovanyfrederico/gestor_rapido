import 'package:flutter/material.dart';
import 'package:untitled/config/themeUi.dart';


class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>  Drawer(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeader(context),
          _builderMenuItems(context),

        ],
      ),
    ),
  );

  Widget _buildHeader(BuildContext context) => Container(
    padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top
    ),
  );
  Widget _builderMenuItems(BuildContext context)=> Wrap(
    runSpacing: 10,
    children:  [
      ListTile(
        leading: Icon(Icons.home_outlined),
        title: Text("Inicio"),
        onTap: (){},
      ),
      ListTile(
        leading: Icon(Icons.home_outlined),
        title: Text("Contactos"),
        onTap: (){},
      ),
      ListTile(
        leading: Icon(Icons.home_outlined),
        title: Text("Produtos"),
        onTap: (){},
      ),
      ListTile(
        leading: Icon(Icons.home_outlined),
        title: Text("Vendas"),
        onTap: (){},
      ),
      ListTile(
        leading: Icon(Icons.home_outlined),
        title: Text("Compras"),
        onTap: (){},
      ),
      const Divider(color: ThemeUi.border_color),
      ListTile(
        leading: Icon(Icons.report),
        title: Text("Relatorio Vendas"),
        onTap: (){},
      ),
      ListTile(
        leading: Icon(Icons.home_outlined),
        title: Text("Relatorio Compras"),
        onTap: (){},
      ),
      const Divider(color: ThemeUi.border_color),
      ListTile(
        leading: Icon(Icons.logout),
        title: Text("Terminar sessão"),
        onTap: (){},
      ),
    ],
  );
}

