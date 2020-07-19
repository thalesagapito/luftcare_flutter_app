import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:luftcare_flutter_app/models/graphql/api.graphql.dart';
import 'package:luftcare_flutter_app/widgets/atoms/brand_logo.dart';
import 'package:luftcare_flutter_app/widgets/organisms/auth/login_form.dart';

class LoginScreenArgs {}

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  static const RouteName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    const pagePadding = EdgeInsets.fromLTRB(30, 30, 30, 0);
    final pageConstraints = BoxConstraints(
      maxHeight: mediaQuery.size.height - mediaQuery.padding.vertical,
      maxWidth: mediaQuery.size.width,
      minWidth: mediaQuery.size.width,
    );

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: pagePadding,
          constraints: pageConstraints,
          child: LayoutBuilder(builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ..._buildFormWrapper(
                  constraints: constraints,
                  child: LoginForm(
                    onSubmit: ({email, password}) =>
                        _login(context, email, password),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  List<Widget> _buildFormWrapper({BoxConstraints constraints, Widget child}) {
    const topPadding = 10;
    const logoHeight = 32.0;
    const scrollViewPadding = EdgeInsets.only(bottom: 20);
    final containerMaxHeight = constraints.maxHeight - logoHeight - topPadding;

    return [
      BrandLogo(height: logoHeight),
      Spacer(),
      Container(
        width: double.infinity,
        constraints: BoxConstraints(maxHeight: containerMaxHeight),
        child: SingleChildScrollView(
          padding: scrollViewPadding,
          child: child,
        ),
      ),
    ];
  }

  void _login(BuildContext context, String email, String password) async {
    final client = GraphQLProvider.of(context).value;
    final loginArgs = LoginArguments(email: email, password: password);
    final loginMutation = MutationOptions(
      documentNode: LoginMutation().document,
      variables: loginArgs.toJson(),
      onError: (error) => print(error),
    );

    final QueryResult result = await client.mutate(loginMutation);

    if (result.hasException) {
      final OperationException exception = result?.exception;
      final GraphQLError error = exception?.graphqlErrors[0];
      final String message = error?.message ?? 'Erro interno';

      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(message),
      ));
    }
  }
}
