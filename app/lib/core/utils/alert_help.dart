import 'package:flutter/material.dart';

class AlertHelper {
  static void _showAlertDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void success(BuildContext context, String message, {String title = 'Sucesso'}) {
    _showAlertDialog(context, title, message);
  }

  static void error(BuildContext context, String message, {String title = 'Erro'}) {
    _showAlertDialog(context, title, message);
  }

  static void warning(BuildContext context, String message, {String title = 'Atenção'}) {
    _showAlertDialog(context, title, message);
  }

  static void info(BuildContext context, String message, {String title = 'Informação'}) {
    _showAlertDialog(context, title, message);
  }
}
