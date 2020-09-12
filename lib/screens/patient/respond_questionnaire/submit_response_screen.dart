import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:luftcare_flutter_app/models/graphql/api.graphql.dart';
import 'package:luftcare_flutter_app/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class SubmitResponseScreenArgs {
  final SymptomQuestionnaireResponseInput responseInput;

  SubmitResponseScreenArgs({this.responseInput});
}

class SubmitResponseScreen extends StatelessWidget {
  static const RouteName = '/submit-response';

  const SubmitResponseScreen({Key key}) : super(key: key);

  SymptomQuestionnaireResponseInput _getResponseInputFromArgs(BuildContext context) {
    final route = ModalRoute.of(context);
    final SubmitResponseScreenArgs routeArgs = route.settings.arguments;
    final responseInput = routeArgs.responseInput;

    if (responseInput == null) {
      Navigator.of(context).pop();
      throw new ArgumentError.notNull('responseInput');
    }

    return responseInput;
  }

  @override
  Widget build(BuildContext context) {
    final responseInput = _getResponseInputFromArgs(context);
    print(responseInput);
    final goToHomeScreen = () => Provider.of<Auth>(context).pushToLoggedInHome(context);

    return Scaffold(
      body: Column(
        children: [
          Text('aaaaa'),
          Text(responseInput.toJson().toString()),
          FlatButton(onPressed: goToHomeScreen, child: Text('OK!')),
        ],
      ),
    );
  }
}
