import 'package:flutter/material.dart';
import 'package:luftcare_flutter_app/models/graphql/api.graphql.dart';

class RespondQuestionnaireQuestion extends StatelessWidget {
  const RespondQuestionnaireQuestion({
    Key key,
    @required this.question,
  }) : super(key: key);

  final Questionnaire$Query$SymptomQuestionnaire$Questions question;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = question.toJson().toString();
    final floatingCardDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: theme.primaryColor.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 8,
        )
      ],
    );

    return Container(
      decoration: floatingCardDecoration,
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      padding: const EdgeInsets.all(20),
      child: Text(text),
    );
  }
}
