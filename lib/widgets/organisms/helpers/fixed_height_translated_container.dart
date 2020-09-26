import 'dart:core';
import 'package:flutter/material.dart';

class FixedHeightTranslatedContainer extends StatelessWidget {
  final Widget child;
  final double maxHeight;
  final double yTranslate;

  const FixedHeightTranslatedContainer({
    Key key,
    @required this.maxHeight,
    @required this.yTranslate,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: maxHeight,
      child: OverflowBox(
        alignment: Alignment.topCenter,
        maxHeight: maxHeight + yTranslate?.abs(),
        child: Container(
          transform: Matrix4.translationValues(0, yTranslate, 0),
          child: child,
        ),
      ),
    );
  }
}
