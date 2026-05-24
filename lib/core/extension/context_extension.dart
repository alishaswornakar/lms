import 'package:flutter/material.dart';

extension SnackBarExtension on BuildContext {
  void showSnackbar(String msg) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(msg)));
  }

  void showLoadingDialog() {
    showDialog(
      context: this,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            height: 60,
            width: 60,
            color: Colors.white,
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  void pop() {
    Navigator.of(this).pop();
  }
}
