import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:luftcare_flutter_app/providers/symptom_questionnaires_provider.dart';
import 'package:luftcare_flutter_app/widgets/atoms/centered_loading_indicator.dart';

class AvailableQuestionnaires extends StatefulWidget {
  const AvailableQuestionnaires({
    Key key,
    DateTime selectedDate,
  }) : super(key: key);

  @override
  _AvailableQuestionnairesState createState() =>
      _AvailableQuestionnairesState();
}

class _AvailableQuestionnairesState extends State<AvailableQuestionnaires> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('CHANGED DEPENDENCIES');
  }

  @override
  Widget build(BuildContext context) {
    final loadingWidget = Padding(
      child: CenteredLoadingIndicator(),
      padding: EdgeInsets.fromLTRB(0, 20, 0, 30),
    );

    final availableQuestionnaires =
        Provider.of<SymptomQuestionnaires>(context).questionnaires;

    print(availableQuestionnaires);

    return SingleChildScrollView(
      child: Column(
        children: [
          _Title(),
          _QuestionnaireListTile(),
          loadingWidget,
          Placeholder(fallbackHeight: 90),
          Placeholder(fallbackHeight: 90),
          Placeholder(fallbackHeight: 90),
          Placeholder(fallbackHeight: 90),
        ],
      ),
    );
  }
}

class _QuestionnaireListTile extends StatelessWidget {
  const _QuestionnaireListTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(10);
    final whiteRoundedDecoration = BoxDecoration(
      borderRadius: borderRadius,
      color: Colors.white,
    );

    return Container(
      decoration: whiteRoundedDecoration,
      margin: const EdgeInsets.all(10),
      child: Material(
        type: MaterialType.transparency,
        child: Ink(
          decoration: whiteRoundedDecoration,
          child: ListTile(
            title: Text('Question'),
            trailing: Text('5 perguntas'),
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
            onTap: () {},
          ),
        ),
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
      padding: EdgeInsets.fromLTRB(20, 20, 50, 0),
      child: FittedBox(
        child: Text(
          'Questionários disponíveis',
          textAlign: TextAlign.left,
          style: theme.textTheme.headline4,
        ),
      ),
    );
  }
}
