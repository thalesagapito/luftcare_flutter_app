import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:luftcare_flutter_app/helpers/error_handlers.dart';
import 'package:luftcare_flutter_app/models/graphql/api.graphql.dart';
import 'package:luftcare_flutter_app/screens/guest/guest_welcome_screen.dart';
import 'package:luftcare_flutter_app/screens/patient/home_screen/home_screen.dart';

class Auth with ChangeNotifier {
  Future<Login$Mutation$Login> login(GraphQLClient client, String email, String password) async {
    final loginArgs = LoginArguments(email: email, password: password);
    final loginMutation = MutationOptions(
      documentNode: LoginMutation().document,
      fetchPolicy: FetchPolicy.noCache,
      variables: loginArgs.toJson(),
    );

    final QueryResult result = await client.mutate(loginMutation);

    if (result.hasException) return Future.error(ErrorHandlers.getErrorFromQueryResult(result));

    return Login$Mutation.fromJson(result.data).login;
  }

  Future<void> pushToLoggedInHome(BuildContext context) async {
    final predicate = (_) => false;
    final routeName = HomeScreen.RouteName;
    return Navigator.pushNamedAndRemoveUntil(context, routeName, predicate);
  }

  Future<void> pushToLoggedOutHome(BuildContext context) async {
    final predicate = (_) => false;
    final routeName = GuestWelcomeScreen.RouteName;
    return Navigator.pushNamedAndRemoveUntil(context, routeName, predicate);
  }
}
