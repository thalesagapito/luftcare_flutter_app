import 'package:flutter/material.dart';

class PrevAndNextButtons extends StatelessWidget {
  final bool isPrevVisible;
  final Function onPrevTap;
  final Text prevText;
  final bool isNextVisible;
  final Function onNextTap;
  final Text nextText;

  const PrevAndNextButtons({
    Key key,
    this.prevText = const Text('Anterior'),
    this.isPrevVisible = true,
    this.onPrevTap,
    this.nextText = const Text('Próxima'),
    this.isNextVisible = true,
    this.onNextTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emptyBox = const SizedBox.shrink();

    final prevButton = FlatButton(onPressed: onPrevTap, child: prevText);
    final PrevWidget = isPrevVisible ? prevButton : emptyBox;

    final nextButton = FlatButton(onPressed: onNextTap, child: nextText);
    final nextWidget = isNextVisible ? nextButton : emptyBox;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PrevWidget,
        nextWidget,
      ],
    );
  }
}
