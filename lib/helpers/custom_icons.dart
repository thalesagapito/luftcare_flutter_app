import 'package:flutter/widgets.dart';

class CustomIcons {
  CustomIcons._();

  static const String _iconFont = 'CupertinoIcons';
  static const String _iconFontPackage = 'cupertino_icons';

  static const IconData home_filled = IconData(
    0xf448,
    fontFamily: _iconFont,
    fontPackage: _iconFontPackage,
  );

  static const IconData list = IconData(
    0xf453,
    fontFamily: _iconFont,
    fontPackage: _iconFontPackage,
  );

  static const IconData list_filled = IconData(
    0xf454,
    fontFamily: _iconFont,
    fontPackage: _iconFontPackage,
  );

  static const IconData refresh_thin = IconData(
    0xf49d,
    fontFamily: _iconFont,
    fontPackage: _iconFontPackage,
    matchTextDirection: true,
  );

  static const IconData menu = IconData(
    0xf421,
    fontFamily: _iconFont,
    fontPackage: _iconFontPackage,
    matchTextDirection: true,
  );
}
