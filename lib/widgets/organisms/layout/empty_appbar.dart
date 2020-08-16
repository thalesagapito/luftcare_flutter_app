import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class EmptyAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Brightness brightness;

  const EmptyAppbar({Key key, @required this.brightness}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      brightness: brightness,
      backgroundColor: Colors.transparent,
      border: null,
    );
  }

  // 44 is a constant: kMinInteractiveDimensionCupertino
  @override
  Size get preferredSize => new Size.fromHeight(0);
}
