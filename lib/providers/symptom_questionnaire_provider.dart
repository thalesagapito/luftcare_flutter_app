import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:luftcare_flutter_app/models/graphql/api.graphql.dart';

class SymptomQuestionnaire {
  Future<QueryResult> getQuestionnaire(GraphQLClient client, {String id}) {
    final queryOptions = QueryOptions(
      documentNode: QuestionnaireQuery().document,
      variables: {'id': id},
    );

    return client.query(queryOptions);
  }

  Questionnaire$Query$SymptomQuestionnaire getQuestionnaireFromQueryResult(
    QueryResult result,
  ) {
    if (result == null || result.data == null) return null;
    final responseData = Questionnaire$Query.fromJson(result.data);
    return responseData.symptomQuestionnaire;
  }
}
