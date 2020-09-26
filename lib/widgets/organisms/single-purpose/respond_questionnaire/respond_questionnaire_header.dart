import 'package:flutter/material.dart';
import 'package:luftcare_flutter_app/widgets/atoms/toggleable_container.dart';

class RespondQuestionnaireHeader extends StatelessWidget {
  const RespondQuestionnaireHeader({
    Key key,
    @required this.goToPage,
    @required this.currentPage,
    @required this.questionCount,
    @required this.questionnaireName,
  }) : super(key: key);

  final int currentPage;
  final int questionCount;
  final String questionnaireName;
  final void Function(int page) goToPage;

  static Color getHeaderColor(BuildContext ctx) => Theme.of(ctx).primaryColor.withOpacity(0.8);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final headerColor = getHeaderColor(context);

    return Container(
      decoration: BoxDecoration(
        color: headerColor,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      padding: const EdgeInsets.only(bottom: 30),
      width: double.infinity,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _buildTitle(questionnaireName, theme),
            if (questionCount > 1) _buildQuestionButtons(textTheme),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String questionnaireName, ThemeData theme) {
    final text = questionnaireName ?? '';
    final padding = const EdgeInsets.fromLTRB(20, 16, 20, 12);
    return Padding(
      padding: padding,
      child: FittedBox(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: theme.textTheme.headline5.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  BorderRadius _getButtonBorderRadius({bool isFirst, bool isLast}) {
    const roundedRadius = const Radius.circular(12);

    if (isFirst && isLast) return BorderRadius.all(roundedRadius);
    if (isFirst) return BorderRadius.horizontal(left: roundedRadius);
    if (isLast) return BorderRadius.horizontal(right: roundedRadius);
    return BorderRadius.circular(0);
  }

  Widget _buildQuestionButtons(TextTheme textTheme) {
    final buttons = List.generate(
      questionCount,
      (index) {
        final text = (index + 1).toString();
        final isToggled = currentPage == index;
        final borderRadius = _getButtonBorderRadius(
          isFirst: index == 0,
          isLast: index == questionCount - 1,
        );
        final textStyle = textTheme.headline6.copyWith(
          color: isToggled ? Colors.white : Colors.black87,
          fontWeight: isToggled ? FontWeight.w700 : FontWeight.w500,
        );

        return Container(
          width: 50,
          height: 48,
          child: ToggleableContainer(
            isToggled: isToggled,
            borderRadius: borderRadius,
            onTap: () => goToPage(index),
            child: Center(child: Text(text, style: textStyle)),
          ),
        );
      },
    );

    return LayoutBuilder(
      builder: (context, constraints) => Container(
        width: constraints.maxWidth,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 10),
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: constraints.maxWidth),
            child: Row(
              children: buttons,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
        ),
      ),
    );
  }
}
