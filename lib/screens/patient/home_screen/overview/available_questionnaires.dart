import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:luftcare_flutter_app/providers/symptom_questionnaires_provider.dart';
import 'package:luftcare_flutter_app/widgets/atoms/layout/rounded_list_tile_wrapper.dart';
import 'package:luftcare_flutter_app/screens/patient/home_screen/overview/overview_list.dart';
import 'package:luftcare_flutter_app/screens/patient/respond_questionnaire/respond_questionnaire_screen.dart';

class AvailableQuestionnaires extends StatelessWidget {
  const AvailableQuestionnaires({DateTime selectedDate});

  void _openQuestionnaire(String id, BuildContext context) {
    final navigator = Navigator.of(context);
    final args = RespondQuestionnaireScreenArgs(questionnaireId: id);
    navigator.pushNamed(RespondQuestionnaireScreen.RouteName, arguments: args);
  }

  @override
  Widget build(BuildContext context) {
    final documentNode = SymptomQuestionnaires.questionnairesQueryDocumentNode;
    final queryOptions = QueryOptions(documentNode: documentNode);

    return SingleChildScrollView(
      child: Query(
        options: queryOptions,
        builder: (result, {fetchMore, refetch}) {
          final response = SymptomQuestionnaires.getQuestionnairesFromQueryResult(result);
          final questionnaires = response?.results ?? [];

          final questionnaireTiles = questionnaires.map((questionnaire) {
            final questionCount = questionnaire.questions.length;
            final questionWord = questionCount <= 1 ? 'pergunta' : 'perguntas';
            final trailingText = '$questionCount $questionWord';
            final onTap = () => _openQuestionnaire(questionnaire.id, context);

            return RoundedListTileWrapper(
              title: Text(questionnaire.nameForPresentation),
              trailing: Text(trailingText),
              onTap: onTap,
            );
          }).toList();

          return OverviewList(
            title: 'Questionários disponíveis',
            children: questionnaireTiles,
            hasError: result.hasException,
            isLoading: result.loading,
            errorText: 'Ocorreu um erro ao buscar os questionários',
            emptyChildrenText: 'Nenhum questionário encontrado',
          );
        },
      ),
    );
  }
}
