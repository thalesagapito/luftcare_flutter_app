import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:luftcare_flutter_app/models/graphql/api.graphql.dart';

class SymptomQuestionnaire {
  static Future<QueryResult> getQueryResult(GraphQLClient client, {String id}) {
    final queryOptions = QueryOptions(
      documentNode: QuestionnaireQuery().document,
      fetchPolicy: FetchPolicy.cacheAndNetwork,
      variables: {'id': id},
    );

    return client.query(queryOptions);
  }

  static Questionnaire$Query$SymptomQuestionnaire getQuestionnaireFromQueryResult(
    QueryResult result,
  ) {
    if (result == null || result.data == null) return null;
    if (result.data is Questionnaire$Query$SymptomQuestionnaire) return result.data;
    return Questionnaire$Query.fromJson(result.data).symptomQuestionnaire;
  }

  static Future<Questionnaire$Query$SymptomQuestionnaire> getQuestionnaire(
    GraphQLClient client, {
    String id,
  }) =>
      getQueryResult(client, id: id).then(getQuestionnaireFromQueryResult);
}
