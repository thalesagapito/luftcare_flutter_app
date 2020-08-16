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

    return Container(
      width: 60,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            alignment: Alignment.center,
            child: icon,
          ),
          onTap: () {
            HapticFeedback.lightImpact();
            onTap();
          },
        ),
      ),
    );
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
