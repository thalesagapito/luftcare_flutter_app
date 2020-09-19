import 'package:gql/ast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:luftcare_flutter_app/models/graphql/api.graphql.dart';

class QuestionnaireResponses {
  static DocumentNode get responsesQueryDocumentNode => ResponsesQuery().document;

  static Responses$Query$QuestionnaireResponses getResponsesFromQueryResult(QueryResult result) {
    if (result == null || result.data == null) return null;
    if (result.data is Responses$Query$QuestionnaireResponses) return result.data;
    return Responses$Query.fromJson(result.data).questionnaireResponses;
  }
}
