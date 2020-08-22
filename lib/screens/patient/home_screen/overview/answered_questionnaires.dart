import 'package:flutter/material.dart';

class AnsweredQuestionnaires extends StatelessWidget {
  const AnsweredQuestionnaires({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final answeredQuestionnaires = [];
    final hasNoAnsweredQuestionnaires = answeredQuestionnaires.length == 0;

    if (hasNoAnsweredQuestionnaires) return Container();

    return SingleChildScrollView(
      child: Column(
        children: [
          _Title(),
          _AnsweredQuestionnairesList(),
          Placeholder(fallbackHeight: 90),
          Placeholder(fallbackHeight: 90),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 50, 0),
      child: FittedBox(
        child: Text(
          'Questionários respondidos',
          textAlign: TextAlign.left,
          style: theme.textTheme.headline4,
        ),
      ),
    );
  }
}

class _AnsweredQuestionnairesList extends StatelessWidget {
  const _AnsweredQuestionnairesList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 50, 0),
      child: FittedBox(
        child: Text(
          'Questionários respondidos',
          textAlign: TextAlign.left,
          style: theme.textTheme.headline4,
        ),
      ),
    );
  }
}
