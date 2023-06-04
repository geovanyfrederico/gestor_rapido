import 'package:flutter/material.dart';

class SnackbarHelper {
  static void _showSnackBar(BuildContext context, String message, {Color backgroundColor = Colors.black, Color textColor = Colors.white}) {
    ScaffoldMessenger.of(context).showSnackBar(

      SnackBar(
        backgroundColor: backgroundColor,
        content: Text(message, textAlign: TextAlign.center, style: TextStyle(color: textColor)),
      ),
    );
  }

  static void success(BuildContext context, String message) {
    _showSnackBar(context, message, backgroundColor: Colors.green);
  }

  static void error(BuildContext context, String message) {
    _showSnackBar(context, message, backgroundColor: Colors.red);
  }

  static void warning(BuildContext context, String message) {
    _showSnackBar(context, message, backgroundColor: Colors.orange);
  }

  static void info(BuildContext context, String message) {
    _showSnackBar(context, message, backgroundColor: Colors.blue);
  }
}
