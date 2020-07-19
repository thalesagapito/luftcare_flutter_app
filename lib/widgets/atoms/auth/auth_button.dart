import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final Color color;
  final Function onPressed;
  const AuthButton({this.color, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontWeight: FontWeight.w600);
    const text = const Text('Entrar', style: textStyle);
    final buttonColor = color ?? Theme.of(context).primaryColor;

    return Container(
      width: double.infinity,
      child: FlatButton(
        child: text,
        color: buttonColor,
        onPressed: onPressed,
      ),
    );
  }
}
