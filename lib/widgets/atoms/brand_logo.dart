import 'package:flutter/material.dart';

class BrandLogo extends StatelessWidget {
  static const LIGHT_LOGO_PATH = 'assets/images/logo-white.png';
  static const DARK_LOGO_PATH = 'assets/images/logo-black.png';

  final double height;
  final Brightness brightness;
  const BrandLogo({
    Key key,
    this.height = 32,
    this.brightness,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (brightness == Brightness.dark)
      return Image.asset(DARK_LOGO_PATH, height: height);
    else if (brightness == Brightness.light)
      return Image.asset(LIGHT_LOGO_PATH, height: height);

    final theme = Theme.of(context);
    final isThemeDark = theme.brightness == Brightness.dark;
    final imagePath = isThemeDark ? LIGHT_LOGO_PATH : DARK_LOGO_PATH;
    return Image.asset(imagePath, height: height);
  }
}
