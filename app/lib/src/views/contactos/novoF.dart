import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gr/src/config/app_theme.dart';
import 'package:gr/src/controllers/AuthController.dart';
import 'package:gr/src/views/contactos/listar.dart';
import 'package:gr/theme/theme1.dart';

class ContactosNovoFView extends StatefulWidget {
  const ContactosNovoFView({super.key});

  @override
  State<StatefulWidget> createState() => Contactos();
}

class Contactos extends State<ContactosNovoFView> {
  bool numberInputIsValid = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme1.primary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ContactosListarView()));
          },
        ),
        title: Text('Cadastro de Fornecedores'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Nome',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Número telefonico',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'NIF',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Endereço',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        child: Text('Cadastrar'),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ContactosListarView()));
        },
      ),
    );
  }
}
