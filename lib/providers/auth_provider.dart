import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:load/load.dart';
import 'package:luftcare_flutter_app/secure_storage.dart';
import 'package:luftcare_flutter_app/models/graphql/api.graphql.dart';
import 'package:luftcare_flutter_app/screens/guest/welcome_screen.dart';
import 'package:luftcare_flutter_app/screens/patient/home_screen.dart';

class Auth with ChangeNotifier {
  SecureStorage _secureStorage = SecureStorage();
  CurrentUser$Query$CurrentUser _user;

  CurrentUser$Query$CurrentUser get user => _user;

  void _setUser(user) {
    _user = user;
    notifyListeners();
  }

  Future<void> login(
      BuildContext context, String email, String password) async {
    showLoadingDialog(tapDismiss: false);
    final client = GraphQLProvider.of(context).value;
    final loginArgs = LoginArguments(email: email, password: password);
    final loginMutation = MutationOptions(
      documentNode: LoginMutation().document,
      variables: loginArgs.toJson(),
    );

    final QueryResult result = await client.mutate(loginMutation);

    if (result.hasException) {
      hideLoadingDialog();
      final OperationException exception = result?.exception;
      final GraphQLError error = exception?.graphqlErrors[0];
      final String message = error?.message ?? 'Erro interno';

      Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
      return;
    }

    final res = Login$Mutation.fromJson(result.data).login;
    await _secureStorage.login(auth: res.authorization, refresh: res.refresh);
    await getUserFromApi(context);
    hideLoadingDialog();

    Navigator.of(context).pushNamedAndRemoveUntil(
      HomeScreen.RouteName,
      (_) => false,
    );
  }

  Future<void> logout(BuildContext context) async {
    await _secureStorage.logout();

    Navigator.of(context).pushNamedAndRemoveUntil(
      WelcomeScreen.RouteName,
      (_) => false,
    );
  }

  Future<void> getUserFromApi(BuildContext context) async {
    final client = GraphQLProvider.of(context).value;

    final currentUserQuery = QueryOptions(
      documentNode: CurrentUserQuery().document,
    );

    final QueryResult result = await client.query(currentUserQuery);

    if (result.hasException) {
      final OperationException exception = result?.exception;
      final GraphQLError error = exception?.graphqlErrors[0];
      final String message = error?.message ?? 'Erro interno';

      Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
      return;
    }

    final user = CurrentUser$Query.fromJson(result.data).currentUser;
    _setUser(user);
  }
}
