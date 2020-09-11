import 'package:gql/ast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:luftcare_flutter_app/models/graphql/api.graphql.dart';

class SymptomQuestionnaires {
  static DocumentNode getDocumentNode() {
    return QuestionnairesQuery().document;
  }

  static Questionnaires$Query$SymptomQuestionnaires getQuestionnairesFromQueryResult(
      QueryResult result) {
    if (result == null || result.data == null) return null;
    final responseData = Questionnaires$Query.fromJson(result.data);
    return responseData.symptomQuestionnaires;
  }
}
