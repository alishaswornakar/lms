// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String label;
  final String hintText;
  final bool isObscure;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    required this.controller,
    this.validator,
    required this.label,
    required this.hintText,
    this.isObscure = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      controller: controller,
      validator: validator,

      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
        hintText: hintText,

        suffixIcon: suffixIcon,
      ),
    );
  }
}
