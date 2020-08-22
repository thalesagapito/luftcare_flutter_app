import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:luftcare_flutter_app/models/graphql/api.graphql.dart';

class SymptomQuestionnaire with ChangeNotifier {
  Questionnaire$Query$SymptomQuestionnaire _questionnaire;
  bool _finishedQuery = false;

  Questionnaire$Query$SymptomQuestionnaire get questionnaire => _questionnaire;

  bool get finishedQuery => _finishedQuery;

  void setQuestionnaire(questionnaire) {
    _questionnaire = questionnaire;
    _finishedQuery = true;
    notifyListeners();
  }

  Future<Questionnaire$Query$SymptomQuestionnaire> getQuestionnaire(
      BuildContext context, String id) async {
    final client = GraphQLProvider.of(context).value;
    final questionnaireQuery = QueryOptions(
      documentNode: QuestionnaireQuery().document,
      variables: {'id': id},
    );

    final QueryResult result = await client.query(questionnaireQuery);

    if (result.hasException) {
      final OperationException exception = result?.exception;
      final GraphQLError error = exception?.graphqlErrors[0];
      final String message = error?.message ?? 'Erro interno';

      Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
      throw Exception(message);
    }

    final responseData = Questionnaire$Query.fromJson(result.data);
    final questionnaire = responseData.symptomQuestionnaire;

    setQuestionnaire(questionnaire);
    return questionnaire;
  }
}
