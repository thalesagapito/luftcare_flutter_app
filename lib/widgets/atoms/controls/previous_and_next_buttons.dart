import 'package:flutter/material.dart';

class PreviousAndNextButtons extends StatelessWidget {
  final bool isPreviousVisible;
  final Function onPreviousTap;
  final bool isNextVisible;
  final Function onNextTap;

  const PreviousAndNextButtons({
    Key key,
    this.isPreviousVisible = true,
    this.onPreviousTap,
    this.isNextVisible = true,
    this.onNextTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emptyBox = const SizedBox.shrink();

    final prevText = const Text('Anterior');
    final prevButton = FlatButton(onPressed: onPreviousTap, child: prevText);
    final previousWidget = isPreviousVisible ? prevButton : emptyBox;

    final nextText = const Text('Próxima');
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
