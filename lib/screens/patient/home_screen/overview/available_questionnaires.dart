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
  void didChangeDependencies() async {
    super.didChangeDependencies();
    final questionnairesProvider = Provider.of<SymptomQuestionnaires>(context);
    if (questionnairesProvider.alreadyQueried) return;

    await questionnairesProvider.getQuestionnaires(context);
  }

  Widget _buildLoadingWidget() => Padding(
        child: CenteredLoadingIndicator(),
        padding: EdgeInsets.fromLTRB(0, 20, 0, 30),
      );

  Widget _buildWidget(questionnaire) => _QuestionnaireListTile(
        questionCount: questionnaire.questions.length,
        name: questionnaire.nameForPresentation,
      );

  @override
  Widget build(BuildContext context) {
    final questionnairesProvider = Provider.of<SymptomQuestionnaires>(context);
    final questionnaires = questionnairesProvider.questionnaires;
    final isLoading = !questionnairesProvider.alreadyQueried;
    final questionnairesWidgets = questionnaires.map(_buildWidget).toList();

    return SingleChildScrollView(
      child: Column(
        children: [
          _Title(),
          if (isLoading) _buildLoadingWidget(),
          if (!isLoading) ...questionnairesWidgets,
        ],
      ),
    );
  }
}

class _QuestionnaireListTile extends StatelessWidget {
  final String name;
  final int questionCount;

  const _QuestionnaireListTile({
    Key key,
    this.name,
    this.questionCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(10);
    final whiteRoundedDecoration = BoxDecoration(
      borderRadius: borderRadius,
      color: Colors.white,
    );

    return Container(
      decoration: whiteRoundedDecoration,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Material(
        type: MaterialType.transparency,
        child: Ink(
          decoration: whiteRoundedDecoration,
          child: ListTile(
            title: Text(name),
            trailing: Text('$questionCount pergunta(s)'),
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
      padding: EdgeInsets.fromLTRB(20, 20, 50, 10),
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
