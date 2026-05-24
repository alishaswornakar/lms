// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class PrimaryBtn extends StatelessWidget {
  const PrimaryBtn({
    super.key,
    this.onPressed,
    required this.child,
    this.isLoading = false,
  });
  final void Function()? onPressed;
  final Widget child;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: FilledButton(
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 6,
                children: [CircularProgressIndicator(), child],
              )
            : child,
      ),
    );
  }
}
