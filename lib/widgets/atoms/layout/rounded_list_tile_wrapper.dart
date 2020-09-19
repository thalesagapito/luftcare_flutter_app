import 'package:flutter/material.dart';

class RoundedListTileWrapper extends StatelessWidget {
  final Widget title;
  final Widget trailing;
  final void Function() onTap;

  const RoundedListTileWrapper({
    Key key,
    @required this.title,
    @required this.trailing,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(10);
    final whiteRoundedDecoration = BoxDecoration(
      borderRadius: borderRadius,
      color: Colors.white,
    );

    return Container(
      decoration: whiteRoundedDecoration.copyWith(
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            offset: Offset.fromDirection(90, 3),
            color: Theme.of(context).primaryColor.withOpacity(0.2),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Material(
        type: MaterialType.transparency,
        child: Ink(
          decoration: whiteRoundedDecoration,
          child: ListTile(
            onTap: onTap,
            title: title,
            trailing: trailing,
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
          ),
        ),
      ),
    );
  }
}
