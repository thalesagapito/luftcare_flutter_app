import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:luftcare_flutter_app/helpers/custom_icons.dart';

class _MenuButton extends StatelessWidget {
  final Function onTap;
  _MenuButton(this.onTap);

  @override
  Widget build(BuildContext context) {
    final icon = Icon(CustomIcons.menu, size: 42, color: Colors.white);

    return InkWell(
        splashColor: Colors.black12,
        borderRadius: BorderRadius.circular(190),
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 0, 30, 0),
          child: icon,
        ),
        onTap: () {
          HapticFeedback.lightImpact();
          onTap();
        });
  }
}

class TopNavbar extends StatelessWidget implements PreferredSizeWidget {
  const TopNavbar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final openDrawer = Scaffold.of(context).openDrawer;

    return CupertinoNavigationBar(
      leading: _MenuButton(openDrawer),
      brightness: Brightness.dark,
      backgroundColor: Colors.transparent,
      border: null,
    );
  }

  // 44 is a constant: kMinInteractiveDimensionCupertino
  @override
  Size get preferredSize => new Size.fromHeight(44);
}
