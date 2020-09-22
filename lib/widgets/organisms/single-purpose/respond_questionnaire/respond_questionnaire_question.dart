import 'package:flutter/material.dart';
import 'package:luftcare_flutter_app/models/graphql/api.graphql.dart';
import 'package:luftcare_flutter_app/widgets/organisms/single-purpose/respond_questionnaire/respond_questionnaire_question_choice.dart';

class RespondQuestionnaireQuestion extends StatelessWidget {
  const RespondQuestionnaireQuestion({
    Key key,
    @required this.question,
    @required this.selectedChoiceId,
    @required this.onChoiceSelected,
  }) : super(key: key);

  final Questionnaire$Query$Questionnaire$Questions question;
  final void Function(String choiceId) onChoiceSelected;
  final String selectedChoiceId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final choices = question.possibleChoices ?? [];

    return Container(
        decoration: _getFloatingCardDecoration(theme),
        margin: const EdgeInsets.fromLTRB(6, 0, 6, 10),
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: _QuestionText(
                questionText: question.text,
                questionNumber: question.presentationOrder,
              ),
            ),
            Expanded(
              child: ListView(
                physics: ClampingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                children: choices
                    .map((c) => RespondQuestionnaireQuestionChoice(
                          text: c.text,
                          onTap: () => onChoiceSelected(c.id),
                          isSelected: c.id == selectedChoiceId,
                        ))
                    .toList(),
              ),
            ),
          ],
        ));
  }

  BoxDecoration _getFloatingCardDecoration(ThemeData theme) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: theme.primaryColor.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 8,
        ),
      ],
    );
  }
}

class _QuestionText extends StatelessWidget {
  const _QuestionText({
    Key key,
    @required this.questionText,
    @required this.questionNumber,
  }) : super(key: key);

  final String questionText;
  final int questionNumber;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        questionText,
        textAlign: TextAlign.justify,
        style: theme.textTheme.headline6.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }
}
