import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:luftcare_flutter_app/models/graphql/api.graphql.dart';

class Questionnaire {
  static Future<QueryResult> getQueryResult(GraphQLClient client, {String id}) {
    final queryOptions = QueryOptions(
      documentNode: QuestionnaireQuery().document,
      fetchPolicy: FetchPolicy.cacheAndNetwork,
      variables: {'id': id},
    );

    return client.query(queryOptions);
  }

  static Questionnaire$Query$Questionnaire getQuestionnaireFromQueryResult(
    QueryResult result,
  ) {
    if (result == null || result.data == null) return null;
    if (result.data is Questionnaire$Query$Questionnaire) return result.data;
    return Questionnaire$Query.fromJson(result.data).questionnaire;
  }

  static Future<Questionnaire$Query$Questionnaire> getQuestionnaire(
    GraphQLClient client, {
    String id,
  }) =>
      getQueryResult(client, id: id).then(getQuestionnaireFromQueryResult);
}
