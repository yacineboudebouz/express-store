import 'package:flutter/material.dart';

class ErrorIconWidget extends StatelessWidget {
  const ErrorIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "assets/error.png",
        height: 100,
        width: 100,
      ),
    );
  }
}
