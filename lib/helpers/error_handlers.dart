import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:luftcare_flutter_app/providers/auth_provider.dart';
import 'package:luftcare_flutter_app/screens/guest/guest_welcome_screen.dart';
import 'package:luftcare_flutter_app/screens/patient/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

class ErrorHandlers {
  static void handleQueryResultException(
      BuildContext context, QueryResult result) {
    if (result.hasException) {
      final OperationException exception = result?.exception;
      final GraphQLError error = exception?.graphqlErrors[0];
      final String message = error?.message ?? 'Erro interno';

      throw Exception(message);
    }
  }

  static void showErrorSnackbar(ScaffoldState scaffold, String errorMessage) {
    final snackBar = SnackBar(content: Text(errorMessage));

    scaffold.showSnackBar(snackBar);
  }
}

class ErrorScreen extends StatelessWidget {
  final String errorTitle;
  final String errorDescription;
  final String buttonText;
  final void Function() onButtonPressed;

  const ErrorScreen({
    Key key,
    this.onButtonPressed,
    this.errorTitle = 'Ocorreu um erro',
    this.errorDescription = 'Mas já estamos analisando como resolvê-lo.',
    this.buttonText = 'Voltar à página inicial',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    final isUserLoggedIn = Provider.of<Auth>(context).isLoggedIn;

    final loggedInRouteName = HomeScreen.RouteName;
    final guestRouteName = GuestWelcomeScreen.RouteName;
    final routeName = isUserLoggedIn ? loggedInRouteName : guestRouteName;
    final predicate = ModalRoute.withName(routeName);
    final pushToHomeScreen = () => navigator.popUntil(predicate);

    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.headline5;
    final descriptionStyle = theme.textTheme.subtitle1;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(errorTitle, style: titleStyle),
                SizedBox(height: 20),
                Text(
                  errorDescription,
                  style: descriptionStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 35),
                RaisedButton(
                  onPressed: onButtonPressed ?? pushToHomeScreen,
                  child: Text(buttonText),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
