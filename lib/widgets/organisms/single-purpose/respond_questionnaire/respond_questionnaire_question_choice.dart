import 'package:flutter/material.dart';

class RespondQuestionnaireQuestionChoice extends StatelessWidget {
  const RespondQuestionnaireQuestionChoice({
    Key key,
    @required this.text,
    @required this.onTap,
    @required this.isSelected,
  }) : super(key: key);

  final String text;
  final Function onTap;
  final bool isSelected;

  static final _borderRadius = BorderRadius.circular(10);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final selectedColor = theme.primaryColor;
    final decoration = _getContainerDecoration(theme);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: decoration,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: _buildChoiceText(theme)),
                _buildSelectedIndicator(theme),
              ],
            ),
            padding: const EdgeInsets.all(18),
          ),
          onTap: onTap,
          borderRadius: _borderRadius,
          splashColor: selectedColor.withOpacity(0.1),
          highlightColor: selectedColor.withOpacity(0.1),
        ),
      ),
    );
  }

  BoxDecoration _getContainerDecoration(ThemeData theme) {
    final cardColor = isSelected ? theme.primaryColor.withOpacity(0.2) : theme.cardColor;

    return BoxDecoration(
      borderRadius: _borderRadius,
      color: cardColor,
    );
  }

  Widget _buildChoiceText(ThemeData theme) {
    return Text(
      text,
      style: theme.textTheme.button.copyWith(
        color: theme.primaryColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildSelectedIndicator(ThemeData theme) {
    final primaryColor = theme.primaryColor;
    final bgColor = isSelected ? primaryColor : Colors.transparent;
    final checkColor = isSelected ? Colors.white : Colors.transparent;

    return Container(
      width: 20,
      height: 20,
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: primaryColor, width: 2),
      ),
      child: Icon(
        Icons.check,
        size: 14,
        color: checkColor,
      ),
    );
  }
}
