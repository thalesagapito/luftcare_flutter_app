import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:luftcare_flutter_app/secure_storage.dart';
import 'package:luftcare_flutter_app/screens/guest/guest_welcome_screen.dart';
import 'package:luftcare_flutter_app/screens/patient/home_screen/home_screen.dart';

class ErrorHandlers {
  static void showErrorSnackbar(ScaffoldState scaffold, dynamic errorMessage) {
    final snackBar = SnackBar(content: Text(errorMessage));
    scaffold.showSnackBar(snackBar);
  }

  static String getErrorFromQueryResult(QueryResult result) {
    final exception = result.exception;
    final graphqlErrors = exception?.graphqlErrors ?? [];

    if (graphqlErrors.isEmpty) {
      final exceptionMessage = exception?.clientException?.message;

      if (exceptionMessage.isEmpty) return 'Erro interno';
      return exceptionMessage;
    }

    final exceptionMessages = graphqlErrors.map((e) => e.message);
    return exceptionMessages.join('\n');
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
    final hasAuthToken = SecureStorage().hasAuthToken;
    final loggedInRouteName = HomeScreen.RouteName;
    final guestRouteName = GuestWelcomeScreen.RouteName;

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
                FutureBuilder(
                  future: hasAuthToken,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return SizedBox.shrink();

                    final predicate = (_) => false;
                    final routeName = snapshot.data ? loggedInRouteName : guestRouteName;
                    final pushToHomeScreen =
                        () => navigator.pushNamedAndRemoveUntil(routeName, predicate);

                    return RaisedButton(
                      onPressed: onButtonPressed ?? pushToHomeScreen,
                      child: Text(buttonText),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
