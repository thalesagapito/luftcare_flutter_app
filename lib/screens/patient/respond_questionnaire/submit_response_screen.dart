import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:luftcare_flutter_app/helpers/error_handlers.dart';
import 'package:luftcare_flutter_app/models/graphql/api.graphql.dart';
import 'package:luftcare_flutter_app/widgets/organisms/layout/empty_appbar.dart';
import 'package:luftcare_flutter_app/widgets/atoms/centered_loading_indicator.dart';
import 'package:luftcare_flutter_app/providers/symptom_questionnaire_response_provider.dart';
import 'package:luftcare_flutter_app/widgets/organisms/single-purpose/submit_response/view_score.dart';

class SubmitResponseScreenArgs {
  final SymptomQuestionnaireResponseInput responseInput;
  final Questionnaire$Query$SymptomQuestionnaire questionnaire;

  SubmitResponseScreenArgs({
    @required this.responseInput,
    @required this.questionnaire,
  });

  static SubmitResponseScreenArgs getArgsFromContext(BuildContext context) {
    final route = ModalRoute.of(context);
    return route.settings.arguments;
  }

  static Questionnaire$Query$SymptomQuestionnaire getQuestionnaire(SubmitResponseScreenArgs args) {
    if (args.questionnaire == null) throw new ArgumentError.notNull('questionnaire');
    return args.questionnaire;
  }

  static SymptomQuestionnaireResponseInput getResponseInput(SubmitResponseScreenArgs args) {
    if (args.responseInput == null) throw new ArgumentError.notNull('responseInput');
    return args.responseInput;
  }
}

class SubmitResponseScreen extends StatelessWidget {
  static const RouteName = '/submit-response';

  const SubmitResponseScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = SubmitResponseScreenArgs.getArgsFromContext(context);
    final responseInput = SubmitResponseScreenArgs.getResponseInput(args);
    final questionnaire = SubmitResponseScreenArgs.getQuestionnaire(args);

    return Scaffold(
      appBar: EmptyAppbar(brightness: Brightness.light),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Mutation(
          options: MutationOptions(
            documentNode: CreateResponseMutation().document,
            fetchPolicy: FetchPolicy.noCache,
          ),
          builder: (runMutation, result) {
            final mutationArgs = CreateResponseArguments(response: responseInput).toJson();
            final onSubmit = () => runMutation(mutationArgs);

            final errorMessage = (result.exception ?? '').toString();
            if (result.hasException) return ErrorScreen(errorDescription: errorMessage);
            if (result.loading) return CenteredLoadingIndicator();
            if (result.data == null)
              return _ConfirmSubmitScreen(
                onSubmit: onSubmit,
                questionnaire: questionnaire,
                responseInput: responseInput,
              );

            final data = CreateResponse$Mutation.fromJson(result.data);
            final score = data.createSymptomQuestionnaireResponse.score;
            return ViewScore(score: score);
          },
        ),
      ),
    );
  }
}

class _ConfirmSubmitScreen extends StatelessWidget {
  const _ConfirmSubmitScreen({
    @required this.onSubmit,
    @required this.responseInput,
    @required this.questionnaire,
  });

  final void Function() onSubmit;
  final SymptomQuestionnaireResponseInput responseInput;
  final Questionnaire$Query$SymptomQuestionnaire questionnaire;

  @override
  Widget build(BuildContext context) {
    final goBack = () => Navigator.of(context).pop();
    final questionsAndAnswersList = SymptomQuestionnaireResponse.getQuestionsAndAnswersList(
      questionnaire: questionnaire,
      response: responseInput,
    ).map((qa) => _QuestionAndAnswerTile(questionText: qa.item1, answerText: qa.item2)).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Resumo do Questionário',
              style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          Expanded(child: ListView(children: questionsAndAnswersList)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlatButton(onPressed: goBack, child: Text('Voltar')),
              FlatButton(onPressed: onSubmit, child: Text('Enviar')),
            ],
          )
        ],
      ),
    );
  }
}

class _QuestionAndAnswerTile extends StatelessWidget {
  const _QuestionAndAnswerTile({
    Key key,
    @required this.answerText,
    @required this.questionText,
  }) : super(key: key);

  final String answerText;
  final String questionText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      enabled: true,
      title: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(questionText, style: theme.textTheme.button),
      ),
      subtitle: Text(
        answerText,
        style: textTheme.button.copyWith(color: theme.primaryColor, fontWeight: FontWeight.w700),
      ),
      dense: false,
    );
  }
}
