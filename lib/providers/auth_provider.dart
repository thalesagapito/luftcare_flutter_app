import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:luftcare_flutter_app/secure_storage.dart';
import 'package:luftcare_flutter_app/models/graphql/api.graphql.dart';
import 'package:luftcare_flutter_app/screens/guest/guest_welcome_screen.dart';
import 'package:luftcare_flutter_app/screens/patient/home_screen/home_screen.dart';

class Auth with ChangeNotifier {
  SecureStorage _secureStorage = SecureStorage();
  CurrentUser$Query$CurrentUser _user;

  CurrentUser$Query$CurrentUser get user => _user;
  bool get isLoggedIn => _user != null;
  String get userId => _user?.id;

  void _setUser(user) {
    _user = user;
    notifyListeners();
  }

  Future<void> login(BuildContext context, String email, String password) async {
    final client = GraphQLProvider.of(context).value;
    final loginArgs = LoginArguments(email: email, password: password);
    final loginMutation = MutationOptions(
      documentNode: LoginMutation().document,
      variables: loginArgs.toJson(),
    );

    final QueryResult result = await client.mutate(loginMutation);

    if (result.hasException) {
      final OperationException exception = result?.exception;
      final GraphQLError error = exception?.graphqlErrors[0];
      final String message = error?.message ?? 'Erro interno';

      Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
      return;
    }

    final res = Login$Mutation.fromJson(result.data).login;
    await _secureStorage.login(auth: res.authorization, refresh: res.refresh);
    await getUserFromApi(context);

    final predicate = (_) => false;
    final routeName = HomeScreen.RouteName;
    Navigator.pushNamedAndRemoveUntil(context, routeName, predicate);
  }

  Future<void> logout(BuildContext context) async {
    await _secureStorage.logout();

    final predicate = (_) => false;
    final routeName = GuestWelcomeScreen.RouteName;
    Navigator.pushNamedAndRemoveUntil(context, routeName, predicate);
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
