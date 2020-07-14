import 'package:flutter/material.dart';

class BrandLogo extends StatelessWidget {
  final double height;
  const BrandLogo({Key key, this.height = 32}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isThemeDark = theme.brightness == Brightness.dark;
    final imagePath = isThemeDark
        ? 'assets/images/logo-white.png'
        : 'assets/images/logo-black.png';
    return Image.asset(imagePath, height: height);
  }
}
