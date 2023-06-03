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

  static void success(BuildContext context, String message, {String title = 'Success'}) {
    _showAlertDialog(context, title, message);
  }

  static void error(BuildContext context, String message, {String title = 'Error'}) {
    _showAlertDialog(context, title, message);
  }

  static void warning(BuildContext context, String message, {String title = 'Warning'}) {
    _showAlertDialog(context, title, message);
  }

  static void info(BuildContext context, String message, {String title = 'Info'}) {
    _showAlertDialog(context, title, message);
  }
}
