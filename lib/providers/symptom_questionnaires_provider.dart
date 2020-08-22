import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:luftcare_flutter_app/models/graphql/api.graphql.dart';

class SymptomQuestionnaires with ChangeNotifier {
  List<Questionnaires$Query$SymptomQuestionnaires$Results>
      _symptomQuestionnaires = [];
  bool _alreadyQueried = false;

  List<Questionnaires$Query$SymptomQuestionnaires$Results> get questionnaires =>
      _symptomQuestionnaires;

  bool get alreadyQueried => _alreadyQueried;

  void setQuestionnaires(questionnaires) {
    _symptomQuestionnaires = questionnaires;
    _alreadyQueried = true;
    notifyListeners();
  }

  Future<void> getQuestionnaires(BuildContext context) async {
    final client = GraphQLProvider.of(context).value;
    final questionnairesQuery = QueryOptions(
      documentNode: QuestionnairesQuery().document,
    );

    final QueryResult result = await client.query(questionnairesQuery);

    if (result.hasException) {
      final OperationException exception = result?.exception;
      final GraphQLError error = exception?.graphqlErrors[0];
      final String message = error?.message ?? 'Erro interno';

      Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
      return;
    }

    final questionnaires = Questionnaires$Query.fromJson(result.data)
        .symptomQuestionnaires
        .results;
    setQuestionnaires(questionnaires);
  }
}
