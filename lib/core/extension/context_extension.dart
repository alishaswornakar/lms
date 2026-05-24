import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

extension ContextExtesion on BuildContext {
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
            child: LoadingAnimationWidget.inkDrop(
              color: const Color.fromARGB(255, 203, 59, 255),
              size: 50,
            ),
          ),
        );
      },
    );
  }

  void pop() {
    Navigator.of(this).pop();
  }

  void pushReplacement(Widget page) {
    Navigator.pushReplacement(
      this,
      MaterialPageRoute(builder: (context) => page),
    );
  }
  
}
