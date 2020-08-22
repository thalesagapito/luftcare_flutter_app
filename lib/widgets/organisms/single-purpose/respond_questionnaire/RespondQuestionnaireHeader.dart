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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final headerColor = theme.primaryColor.withOpacity(0.8);
    final questionnaireProvider = Provider.of<SymptomQuestionnaire>(context);
    final questionnaire = questionnaireProvider.questionnaire;
    final questionnaireName = questionnaire?.nameForPresentation;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
        color: headerColor,
      ),
      padding: const EdgeInsets.only(bottom: 40),
      width: double.infinity,
      child: SafeArea(
        child: Column(
          children: [
            _buildTitle(questionnaireName, theme),
            SizedBox(height: 10),
            _buildQuestionButtons(),
          ],
        ),
        bottom: false,
      ),
    );
  }

  Widget _buildQuestionButtons() {
    final buttons = List.generate(
      questionCount,
      (index) {
        final text = (index + 1).toString();
        final isToggled = currentPage == index;
        final textStyle = TextStyle(
          fontSize: 28,
          color: isToggled ? Colors.white : Colors.black87,
          fontWeight: isToggled ? FontWeight.w700 : FontWeight.w500,
        );

        return Container(
          width: 50,
          height: 80,
          padding: const EdgeInsets.only(bottom: 10),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: ToggleableContainer(
            isToggled: isToggled,
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
          padding: const EdgeInsets.symmetric(horizontal: 10),
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: constraints.maxWidth),
            child: Row(
              children: buttons,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(String questionnaireName, ThemeData theme) => Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 5),
        child: Text(
          questionnaireName ?? '',
          textAlign: TextAlign.center,
          style: theme.textTheme.headline5.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
}
