import 'package:flutter/material.dart';

class PreviousAndNextButtons extends StatelessWidget {
  final bool isPreviousVisible;
  final Function onPreviousTap;
  final Text prevText;
  final bool isNextVisible;
  final Function onNextTap;
  final Text nextText;

  const PreviousAndNextButtons({
    Key key,
    this.prevText = const Text('Anterior'),
    this.isPreviousVisible = true,
    this.onPreviousTap,
    this.nextText = const Text('Próxima'),
    this.isNextVisible = true,
    this.onNextTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emptyBox = const SizedBox.shrink();

    final prevButton = FlatButton(onPressed: onPreviousTap, child: prevText);
    final previousWidget = isPreviousVisible ? prevButton : emptyBox;

    final nextButton = FlatButton(onPressed: onNextTap, child: nextText);
    final nextWidget = isNextVisible ? nextButton : emptyBox;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        previousWidget,
        nextWidget,
      ],
    );
  }
}
