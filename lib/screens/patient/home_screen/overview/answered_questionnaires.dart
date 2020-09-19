import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:luftcare_flutter_app/helpers/score_colors.dart';
import 'package:luftcare_flutter_app/models/graphql/api.graphql.dart';
import 'package:luftcare_flutter_app/providers/questionnaire_response_provider.dart';
import 'package:luftcare_flutter_app/providers/questionnaire_responses_provider.dart';
import 'package:luftcare_flutter_app/widgets/atoms/layout/rounded_list_tile_wrapper.dart';
import 'package:luftcare_flutter_app/widgets/organisms/helpers/current_user_builder.dart';
import 'package:luftcare_flutter_app/screens/patient/home_screen/overview/overview_list.dart';

class AnsweredQuestionnaires extends StatelessWidget {
  const AnsweredQuestionnaires({@required this.selectedDate});

  final DateTime selectedDate;

  DateTime _getMidnightDateTime(DateTime dateTime) =>
      new DateTime(dateTime.year, dateTime.month, dateTime.day, 0, 0, 0);

  DateTime _getBeforeMidnightDateTime(DateTime dateTime) =>
      new DateTime(dateTime.year, dateTime.month, dateTime.day, 23, 59, 59);

  String _getTrailingText(Responses$Query$QuestionnaireResponses$Results response) {
    return DateFormat.Hm().format(response.responseDate);
  }

  _showDialog(Responses$Query$QuestionnaireResponses$Results response, BuildContext ctx) {
    final closeText = const Text('Fechar');
    final title = const Text('Resumo da resposta');
    final onClose = () => Navigator.of(ctx).pop();
    final questionsAndAnswersList = _getQuestionsAndAnswersList(response);

    showDialog(
      context: ctx,
      builder: (_) => AlertDialog(
        title: title,
        scrollable: true,
        content: Column(
          children: questionsAndAnswersList,
        ),
        actions: [FlatButton(onPressed: onClose, child: closeText)],
      ),
    );
  }

  _getQuestionsAndAnswersList(Responses$Query$QuestionnaireResponses$Results response) {
    return QuestionnaireResponse.getResponseSummary(response: response)
        .map((qa) => _QuestionAndAnswerTile(questionText: qa.item1, answerText: qa.item2))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return CurrentUserBuilder(
      builder: (currentUser) {
        final documentNode = QuestionnaireResponses.responsesQueryDocumentNode;
        final queryVariables = ResponsesArguments(
          id: currentUser.id,
          responseDateAfter: _getMidnightDateTime(selectedDate),
          responseDateBefore: _getBeforeMidnightDateTime(selectedDate),
        ).toJson();
        final queryOptions = QueryOptions(documentNode: documentNode, variables: queryVariables);

        return Query(
          options: queryOptions,
          builder: (result, {fetchMore, refetch}) {
            final response = QuestionnaireResponses.getResponsesFromQueryResult(result);
            final questionnaireResponses = response?.results ?? [];

            final responseTiles = questionnaireResponses
                .map(
                  (response) => RoundedListTileWrapper(
                    title: Text(response.questionnaire.nameForPresentation),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(_getTrailingText(response)),
                        _ScoreBadge(response),
                      ],
                    ),
                    onTap: () => _showDialog(response, context),
                  ),
                )
                .toList();

            return OverviewList(
              title: 'Questionários respondidos',
              children: responseTiles,
              hasError: result.hasException,
              isLoading: result.loading,
              errorText: 'Ocorreu um erro ao buscar as respostas',
              emptyChildrenText: 'Nenhuma resposta encontrada',
            );
          },
        );
      },
    );
  }
}

class _ScoreBadge extends StatelessWidget {
  const _ScoreBadge(this.response);
  final Responses$Query$QuestionnaireResponses$Results response;

  @override
  Widget build(BuildContext context) {
    final scoreColor = ScoreColors.getColorFromEnum(response.score.color);
    final containerColor = scoreColor.withOpacity(0.2);
    final text = response.score.value.toString();

    return Container(
      margin: const EdgeInsets.only(left: 8),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      child: Text(text, style: TextStyle(color: scoreColor, fontWeight: FontWeight.w700)),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: containerColor),
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
      dense: false,
      enabled: true,
      title: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(questionText, style: theme.textTheme.button),
      ),
      subtitle: Text(
        answerText,
        style: textTheme.button.copyWith(color: theme.primaryColor, fontWeight: FontWeight.w700),
      ),
    );
  }
}
