import 'package:flutter/material.dart';

class ToggleableContainer extends StatelessWidget {
  final BorderRadius borderRadius;
  final Color toggledColor;
  final bool isToggled;
  final Widget child;
  final Function onTap;

  const ToggleableContainer({
    Key key,
    this.borderRadius,
    this.toggledColor,
    this.isToggled = false,
    @required this.child,
    @required this.onTap,
  }) : super(key: key);

  List<BoxShadow> _getToggledShadow(Color toggledColor) => [
        BoxShadow(
          blurRadius: 6,
          spreadRadius: 2.5,
          offset: Offset.fromDirection(90, 2),
          color: toggledColor.withOpacity(0.4),
        ),
      ];

  List<BoxShadow> _getNotToggledShadow(Color notToggledColor) => [
        BoxShadow(
          blurRadius: 5,
          offset: Offset.fromDirection(90, 3),
          color: notToggledColor.withOpacity(0.2),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final actualToggledColor = toggledColor ?? theme.accentColor;
    final cardColor = isToggled ? actualToggledColor : theme.cardColor;
    final boxShadow = isToggled
        ? _getToggledShadow(actualToggledColor)
        : _getNotToggledShadow(theme.primaryColor);
    final actualBorderRadius = borderRadius ?? BorderRadius.circular(12);
    final decoration = BoxDecoration(
      borderRadius: actualBorderRadius,
      boxShadow: boxShadow,
      color: cardColor,
    );

    return Container(
      decoration: decoration,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          child: child,
          onTap: onTap,
          borderRadius: actualBorderRadius,
          splashColor: actualToggledColor.withOpacity(0.6),
          highlightColor: actualToggledColor.withOpacity(0.2),
        ),
      ),
    );
  }
}
