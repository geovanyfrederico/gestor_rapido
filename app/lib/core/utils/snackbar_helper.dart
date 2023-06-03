import 'package:flutter/material.dart';

class SnackbarHelper {
  static void _showSnackBar(BuildContext context, String message, {TextAlign textAlign = TextAlign.center}) {
    ScaffoldMessenger.of(context).showSnackBar(

      SnackBar(
        content: Text(message, textAlign: textAlign),
      ),
    );
  }

  static void success(BuildContext context, String message, {TextAlign textAlign = TextAlign.center}) {
    _showSnackBar(context, message, textAlign: textAlign);
  }

  static void error(BuildContext context, String message, {TextAlign textAlign = TextAlign.center}) {
    _showSnackBar(context, message, textAlign: textAlign);
  }

  static void warning(BuildContext context, String message, {TextAlign textAlign = TextAlign.center}) {
    _showSnackBar(context, message, textAlign: textAlign);
  }

  static void info(BuildContext context, String message, {TextAlign textAlign = TextAlign.center}) {
    _showSnackBar(context, message, textAlign: textAlign);
  }
}
