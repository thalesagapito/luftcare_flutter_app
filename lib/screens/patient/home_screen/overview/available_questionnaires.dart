import 'package:load/load.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:luftcare_flutter_app/helpers/error_handlers.dart';
import 'package:luftcare_flutter_app/widgets/atoms/centered_loading_indicator.dart';
import 'package:luftcare_flutter_app/providers/symptom_questionnaires_provider.dart';
import 'package:luftcare_flutter_app/screens/patient/respond_questionnaire_screen/respond_questionnaire_screen.dart';

class AvailableQuestionnaires extends StatefulWidget {
  const AvailableQuestionnaires({
    Key key,
    DateTime selectedDate,
  }) : super(key: key);

  @override
  _AvailableQuestionnairesState createState() => _AvailableQuestionnairesState();
}

class _AvailableQuestionnairesState extends State<AvailableQuestionnaires> {
  void _openQuestionnaire(String id, BuildContext context) {
    final navigator = Navigator.of(context);
    final args = RespondQuestionnaireScreenArgs(questionnaireId: id);
    navigator.pushNamed(RespondQuestionnaireScreen.RouteName, arguments: args);
  }

  Widget _buildLoadingWidget() => Padding(
        child: CenteredLoadingIndicator(),
        padding: EdgeInsets.fromLTRB(0, 40, 0, 30),
      );

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        documentNode: SymptomQuestionnaires.getDocumentNode(),
        fetchPolicy: FetchPolicy.cacheAndNetwork,
      ),
      builder: (result, {fetchMore, refetch}) {
        if (result.loading) return _buildLoadingWidget();
        if (result.hasException) return ErrorScreen();

        final response = SymptomQuestionnaires.getQuestionnairesFromQueryResult(result);
        final questionnaires = response.results;
        final hasNoQuestionnaires = questionnaires?.length == 0;

        if (hasNoQuestionnaires) return _NoQuestionnaireFound(refetch: refetch);

        final questionnairesWidgets = questionnaires
            .map((questionnaire) => _QuestionnaireListTile(
                  name: questionnaire.nameForPresentation,
                  questionCount: questionnaire.questions.length,
                  onTap: () => _openQuestionnaire(questionnaire.id, context),
                ))
            .toList();

        return SingleChildScrollView(
          child: Column(
            children: [
              _Title(),
              ...questionnairesWidgets,
            ],
          ),
        );
      },
    );
  }
}

class _NoQuestionnaireFound extends StatelessWidget {
  const _NoQuestionnaireFound({Key key, @required this.refetch}) : super(key: key);

  final Future<QueryResult> Function() refetch;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: Text(
            'Nenhum questionário disponível no momento',
            textAlign: TextAlign.center,
            style: textTheme.headline6,
          ),
        ),
        FlatButton(
          onPressed: () async {
            showLoadingDialog(tapDismiss: false);
            try {
              await refetch();
            } catch (e) {
              print(e);
            } finally {
              hideLoadingDialog();
            }
          },
          child: Text('Buscar novamente'),
        ),
      ],
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
