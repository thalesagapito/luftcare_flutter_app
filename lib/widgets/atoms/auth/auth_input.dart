import 'package:flutter/material.dart';

class AuthInput extends StatelessWidget {
  final IconData icon;
  final TextFormField textField;

  const AuthInput(this.icon, this.textField);

  static InputDecoration decoration(String labelText, ThemeData theme) {
    return InputDecoration(
      labelText: labelText,
      focusColor: theme.primaryColor,
      border: OutlineInputBorder(),
    );
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          const margin = 20.0;
          const iconSize = 60.0;
          final inputWidth = constraints.maxWidth;
          final textFieldWidth = inputWidth - iconSize - margin;
          final sideIcon = _AuthInputIcon(icon: icon, iconSize: iconSize);
          final tfWrapper = Container(width: textFieldWidth, child: textField);

          return Container(
            constraints: BoxConstraints(maxWidth: inputWidth),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[sideIcon, tfWrapper],
            ),
          );
        },
      );
}

class _AuthInputIcon extends StatelessWidget {
  final double iconSize;
  final IconData icon;

  const _AuthInputIcon({
    Key key,
    this.icon,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final innerIconSize = iconSize * 0.5;
    final iconPadding = EdgeInsets.only(bottom: iconSize * 0.07);
    final iconColor = Theme.of(context).primaryColor;
    final iconDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: iconColor.withOpacity(0.15),
    );

    return Container(
      width: iconSize,
      height: iconSize,
      padding: iconPadding,
      decoration: iconDecoration,
      alignment: Alignment.center,
      child: Icon(icon, color: iconColor, size: innerIconSize),
    );
  }
}
