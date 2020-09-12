import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:luftcare_flutter_app/models/graphql/api.graphql.dart';

class CurrentUser with ChangeNotifier {
  CurrentUser$Query$CurrentUser _currentUser;

  void setCurrentUser(user) {
    _currentUser = user;
    notifyListeners();
  }

  Future<QueryResult> getQueryResult(GraphQLClient client) {
    final queryOptions = QueryOptions(
      documentNode: CurrentUserQuery().document,
      fetchPolicy: FetchPolicy.cacheFirst,
      optimisticResult: _currentUser,
    );

    return client.query(queryOptions);
  }

  CurrentUser$Query$CurrentUser getCurrentUserFromQueryResult(QueryResult result) {
    if (result == null || result.data == null) return null;
    if (result.data is CurrentUser$Query$CurrentUser) return result.data;
    return CurrentUser$Query.fromJson(result.data).currentUser;
  }

  Future<CurrentUser$Query$CurrentUser> getCurrentUser(GraphQLClient client) async {
    return getQueryResult(client).then(getCurrentUserFromQueryResult).then((currentUser) {
      if (currentUser == null) return Future.error('Usuário não encontrado');
      return currentUser;
    });
  }

  Future<void> updateUser(GraphQLClient client) async {
    return getCurrentUser(client).then(setCurrentUser);
  }

  Future<CurrentUser$Query$CurrentUser> getAndUpdateUser(GraphQLClient client) async {
    return getCurrentUser(client).then((user) {
      setCurrentUser(user);
      return user;
    });
  }
}
