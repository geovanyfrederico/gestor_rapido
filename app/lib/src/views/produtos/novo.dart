import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:templates/src/config/app_theme.dart';
import 'package:templates/src/controllers/AuthController.dart';

class ProdutosNovoView extends StatefulWidget {
  const ProdutosNovoView({super.key});

  @override
  State<StatefulWidget> createState() => Produtos();
}

class Produtos extends State<ProdutosNovoView> {
  bool numberInputIsValid = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
        keyboardType: TextInputType.number,
        style: Theme.of(context).textTheme.headline4,
        decoration: InputDecoration(
          icon: const Icon(Icons.attach_money),
          labelText: 'Enter an integer:',
          errorText: numberInputIsValid ? null : 'Please enter an integer!',
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ));
  }
}
