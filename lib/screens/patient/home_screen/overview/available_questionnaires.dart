import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:luftcare_flutter_app/widgets/atoms/centered_loading_indicator.dart';
import 'package:luftcare_flutter_app/providers/symptom_questionnaires_provider.dart';
import 'package:luftcare_flutter_app/screens/patient/respond_questionnaire_screen/respond_questionnaire_screen.dart';

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

  void _openQuestionnaire(String id, BuildContext context) {
    final navigator = Navigator.of(context);
    final args = RespondQuestionnaireScreenArgs(questionnaireId: id);
    navigator.pushNamed(RespondQuestionnaireScreen.RouteName, arguments: args);
  }

  Widget _buildLoadingWidget() => Padding(
        child: CenteredLoadingIndicator(),
        padding: EdgeInsets.fromLTRB(0, 20, 0, 30),
      );

  Widget _buildWidget(questionnaire, BuildContext context) =>
      _QuestionnaireListTile(
        questionCount: questionnaire.questions.length,
        name: questionnaire.nameForPresentation,
        onTap: () => _openQuestionnaire(questionnaire.id, context),
      );

  @override
  Widget build(BuildContext context) {
    final questionnairesProvider = Provider.of<SymptomQuestionnaires>(context);
    final questionnaires = questionnairesProvider.questionnaires;
    final isLoading = !questionnairesProvider.alreadyQueried;
    final questionnairesWidgets = questionnaires
        .map((questionnaire) => _buildWidget(questionnaire, context))
        .toList();

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
  final Function onTap;
  final int questionCount;

  const _QuestionnaireListTile({
    Key key,
    @required this.name,
    @required this.onTap,
    @required this.questionCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(10);
    final whiteRoundedDecoration = BoxDecoration(
      borderRadius: borderRadius,
      color: Colors.white,
    );

    return Container(
      decoration: whiteRoundedDecoration.copyWith(
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            offset: Offset.fromDirection(90, 3),
            color: Theme.of(context).primaryColor.withOpacity(0.2),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Material(
        type: MaterialType.transparency,
        child: Ink(
          decoration: whiteRoundedDecoration,
          child: ListTile(
            onTap: onTap,
            title: Text(name),
            trailing: Text('$questionCount pergunta(s)'),
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
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
      padding: EdgeInsets.fromLTRB(20, 0, 50, 10),
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
