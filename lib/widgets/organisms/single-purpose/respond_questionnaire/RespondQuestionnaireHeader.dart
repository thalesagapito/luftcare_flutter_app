import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:luftcare_flutter_app/widgets/atoms/toggleable_container.dart';
import 'package:luftcare_flutter_app/providers/symptom_questionnaire_provider.dart';

class RespondQuestionnaireHeader extends StatelessWidget {
  const RespondQuestionnaireHeader({
    Key key,
    @required this.goToPage,
    @required this.currentPage,
    @required this.questionCount,
  }) : super(key: key);

  final int currentPage;
  final int questionCount;
  final void Function(int) goToPage;

  static Color getHeaderColor(BuildContext ctx) =>
      Theme.of(ctx).primaryColor.withOpacity(0.8);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final headerColor = getHeaderColor(context);
    final questionnaireProvider = Provider.of<SymptomQuestionnaire>(context);
    final questionnaire = questionnaireProvider.questionnaire;
    final questionnaireName = questionnaire?.nameForPresentation;

    return Container(
      decoration: BoxDecoration(color: headerColor),
      width: double.infinity,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _buildTitle(questionnaireName, theme),
            _buildQuestionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String questionnaireName, ThemeData theme) {
    final text = questionnaireName ?? '';
    final padding = const EdgeInsets.fromLTRB(20, 8, 20, 5);
    return Padding(
      padding: padding,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: theme.textTheme.headline5.copyWith(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }

  BorderRadius _getButtonBorderRadius({bool isFirst, bool isLast}) {
    const roundedRadius = const Radius.circular(15);

    if (isFirst) return BorderRadius.horizontal(left: roundedRadius);
    if (isLast) return BorderRadius.horizontal(right: roundedRadius);
    return BorderRadius.circular(0);
  }

  Widget _buildQuestionButtons() {
    final buttons = List.generate(
      questionCount,
      (index) {
        final text = (index + 1).toString();
        final isToggled = currentPage == index;
        final borderRadius = _getButtonBorderRadius(
          isFirst: index == 0,
          isLast: index == questionCount - 1,
        );
        final textStyle = TextStyle(
          fontSize: 24,
          color: isToggled ? Colors.white : Colors.black87,
          fontWeight: isToggled ? FontWeight.w700 : FontWeight.w500,
        );

        return Container(
          width: 56,
          height: 64,
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
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
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
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
