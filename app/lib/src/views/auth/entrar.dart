import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:templates/src/config/app_theme.dart';
import 'package:templates/src/controllers/AuthController.dart';

class AuthEntrarView extends StatelessWidget {
  final AuthController controller = Get.put(AuthController()); // Adicione o controller aqui

  AuthEntrarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: Container(
        child: Row(
          children: [
            Text("Entrar no GestorRapido"),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {  },
                  child: Text('Google'),
                ),   ElevatedButton(
                  onPressed: () {  },
                  child: Text('Google'),
                )
              ],
            )
          ],
        ),
      ),

    );
  }
}
