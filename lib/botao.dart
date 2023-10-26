import 'package:flutter/material.dart';

class Botao extends StatelessWidget {

  final String text;
  VoidCallback onPressed;
  Botao({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Theme.of(context).primaryColor,
      onPressed: onPressed,
      child: Text(text),

    );
  }
}