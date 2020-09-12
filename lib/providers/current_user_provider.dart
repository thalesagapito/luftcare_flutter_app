import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:luftcare_flutter_app/helpers/error_handlers.dart';
import 'package:luftcare_flutter_app/models/graphql/api.graphql.dart';

class CurrentUser with ChangeNotifier {
  static CurrentUser$Query$CurrentUser getCurrentUserFromQueryResult(QueryResult result) {
    if (result == null || result.data == null) return null;
    return CurrentUser$Query.fromJson(result.data).currentUser;
  }

  CurrentUser$Query$CurrentUser _currentUser;

  CurrentUser$Query$CurrentUser get user => _currentUser;
  String get userId => _currentUser?.id;

  void setCurrentUser(user) {
    _currentUser = user;
    notifyListeners();
  }

  Future<CurrentUser$Query$CurrentUser> getCurrentUser(GraphQLClient client) async {
    final currentUserQuery = QueryOptions(
      documentNode: CurrentUserQuery().document,
      fetchPolicy: FetchPolicy.noCache,
    );

    final QueryResult result = await client.query(currentUserQuery);
    if (result.hasException) return Future.error(ErrorHandlers.getErrorFromQueryResult(result));

    final currentUser = getCurrentUserFromQueryResult(result);
    if (currentUser == null) return Future.error('Usuário não encontrado');

    return currentUser;
  }

  Future<void> updateUser(GraphQLClient client) async {
    return getCurrentUser(client).then(setCurrentUser);
  }
}
