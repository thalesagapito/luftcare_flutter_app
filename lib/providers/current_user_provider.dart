import 'package:flutter/material.dart';
import 'package:luftcare_flutter_app/models/graphql/api.graphql.dart';

class CurrentUser with ChangeNotifier {
  CurrentUser$Query$CurrentUser _user = CurrentUser$Query$CurrentUser.fromJson({
    'email': 'thsousa@gmail.com',
    'name': 'Thales',
  });

  CurrentUser$Query$CurrentUser get user => _user;

  void setUser(user) {
    _user = user;
    notifyListeners();
  }
}
