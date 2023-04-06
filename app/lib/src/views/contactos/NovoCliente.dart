import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gr/src/config/app_theme.dart';
import 'package:gr/src/controllers/AuthController.dart';
import 'package:gr/src/views/contactos/listar.dart';
import 'package:gr/theme/theme1.dart';
import 'package:gr/src/controllers/Auth/ClienteController.dart';

class ContactosNovoClienteView extends StatefulWidget {
  const ContactosNovoClienteView({super.key});

  @override
  State<StatefulWidget> createState() => Contactos();
}

class Contactos extends State<ContactosNovoClienteView> {
  final ClienteController controlador = Get.put(ClienteController());
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
        title: Text('Cadastro de Clientes'),
      ),
      body: Container(
        padding: const EdgeInsets.all(50),
        child: Form(
          key: controlador.FormCliente,
          child: ListView(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: controlador.nome,
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
                controller: controlador.contacto,
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
                controller: controlador.nif,
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
                controller: controlador.morada,
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
      ),
      floatingActionButton: ElevatedButton(
        child: Text('Cadastrar'),
        onPressed: () {
          controlador.cliente();
        },
      ),
    );
  }
}
