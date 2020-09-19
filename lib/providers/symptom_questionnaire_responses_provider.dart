import 'package:gql/ast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:luftcare_flutter_app/models/graphql/api.graphql.dart';

class SymptomQuestionnaireResponses {
  static DocumentNode get responsesQueryDocumentNode => ResponsesQuery().document;

  static Responses$Query$SymptomQuestionnaireResponses getResponsesFromQueryResult(
      QueryResult result) {
    if (result == null || result.data == null) return null;
    if (result.data is Responses$Query$SymptomQuestionnaireResponses) return result.data;
    return Responses$Query.fromJson(result.data).symptomQuestionnaireResponses;
  }
}
