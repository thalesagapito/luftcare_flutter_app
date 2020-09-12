import 'package:gql/ast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:luftcare_flutter_app/models/graphql/api.graphql.dart';

class SymptomQuestionnaires {
  static DocumentNode get questionnairesQueryDocumentNode => QuestionnairesQuery().document;

  static Questionnaires$Query$SymptomQuestionnaires getQuestionnairesFromQueryResult(
      QueryResult result) {
    if (result == null || result.data == null) return null;
    if (result.data is Questionnaires$Query$SymptomQuestionnaires) return result.data;
    return Questionnaires$Query.fromJson(result.data).symptomQuestionnaires;
  }
}
