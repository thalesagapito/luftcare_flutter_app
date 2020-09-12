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

  final Questionnaire$Query$SymptomQuestionnaire$Questions question;
  final void Function(String choiceId) onChoiceSelected;
  final String selectedChoiceId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final choices = question.possibleChoices ?? [];

    return Container(
      decoration: _getFloatingCardDecoration(theme),
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _QuestionText(
            questionText: question.text,
            questionNumber: question.presentationOrder,
          ),
          SizedBox(height: 15),
          ...choices
              .map((c) => RespondQuestionnaireQuestionChoice(
                    text: c.text,
                    onTap: () => onChoiceSelected(c.id),
                    isSelected: c.id == selectedChoiceId,
                  ))
              .toList(),
        ],
      ),
    );
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

    final number = (questionNumber ?? 0).toString();
    final text = '$number. $questionText';

    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        text,
        textAlign: TextAlign.justify,
        style: theme.textTheme.headline6,
      ),
    );
  }
}
