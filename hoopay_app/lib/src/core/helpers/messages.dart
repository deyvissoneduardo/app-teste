import 'package:flutter/material.dart';

class Messages {
  final BuildContext context;
  Messages._(this.context);

  factory Messages.of(BuildContext context) {
    return Messages._(context);
  }

  void _showMessage(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void showError(String message) => _showMessage(message, Colors.red);

  void showSuccess(String message) => _showMessage(message, Colors.greenAccent);
  void showInfo(String message) => _showMessage(message, Colors.grey);
}
