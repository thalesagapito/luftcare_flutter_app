import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:luftcare_flutter_app/models/graphql/api.graphql.dart';

class SymptomQuestionnaires with ChangeNotifier {
  SymptomQuestionnaires$Query$SymptomQuestionnaires$Results
      _symptomQuestionnaires =
      SymptomQuestionnaires$Query$SymptomQuestionnaires$Results.fromJson({});

  SymptomQuestionnaires$Query$SymptomQuestionnaires$Results
      get questionnaires => _symptomQuestionnaires;

  // void setQuestionnaires(questionnaires) {
  //   _symptomQuestionnaires = questionnaires;
  //   notifyListeners();
  // }

  void getQuestionnaires(BuildContext context) async {
    final client = GraphQLProvider.of(context).value;
    // final loginArgs = LoginArguments(email: email, password: password);
    final questionnairesQuery = QueryOptions(
      documentNode: SymptomQuestionnairesQuery().document,
      // variables: loginArgs.toJson(),
    );

    final QueryResult result = await client.query(questionnairesQuery);

    if (result.hasException) {
      final OperationException exception = result?.exception;
      final GraphQLError error = exception?.graphqlErrors[0];
      final String message = error?.message ?? 'Erro interno';

      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(message),
      ));
      return;
    }

    print(result);

    // final res = SymptomQuestionnaires$Query.fromJson(result.data);
    // await SecureStorage().login(auth: res.authorization, refresh: res.refresh);

    // Navigator.of(context).pushNamedAndRemoveUntil(
    //   HomeScreen.RouteName,
    //   (_) => false,
    // );
  }
}
