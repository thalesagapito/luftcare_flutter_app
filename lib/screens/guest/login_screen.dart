import 'package:load/load.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:luftcare_flutter_app/secure_storage.dart';
import 'package:luftcare_flutter_app/helpers/error_handlers.dart';
import 'package:luftcare_flutter_app/providers/auth_provider.dart';
import 'package:luftcare_flutter_app/widgets/atoms/brand_logo.dart';
import 'package:luftcare_flutter_app/providers/current_user_provider.dart';
import 'package:luftcare_flutter_app/widgets/organisms/auth/login_form.dart';
import 'package:luftcare_flutter_app/widgets/organisms/layout/empty_appbar.dart';

class LoginScreen extends StatelessWidget {
  static const RouteName = '/login';

  const LoginScreen({Key key}) : super(key: key);

  Future<void> onSubmit(BuildContext context, String email, String password) async {
    final scaffold = Scaffold.of(context);
    final client = GraphQLProvider.of(context).value;
    final saveApiTokens = SecureStorage().saveApiTokens;
    final authProvider = Provider.of<Auth>(context, listen: false);
    final currentUserProvider = Provider.of<CurrentUser>(context, listen: false);

    final showLoading = () => showLoadingDialog(tapDismiss: false);
    final closeDuration = const Duration(milliseconds: 100);
    final closeSoftKeyboard = FocusScope.of(context).unfocus;
    final showLoadingAfterKeyboardClose = () => Future.delayed(closeDuration, showLoading);
    final showSnackbar = (exception) => ErrorHandlers.showErrorSnackbar(scaffold, exception);

    closeSoftKeyboard();
    showLoadingAfterKeyboardClose()
        .then((_) => authProvider.login(client, email, password))
        .then((tokens) => saveApiTokens(auth: tokens.authorization, refresh: tokens.refresh))
        .then((_) => currentUserProvider.updateUser(client))
        .whenComplete(hideLoadingDialog)
        .then((value) => authProvider.pushToLoggedInHome(context))
        .catchError(showSnackbar);
  }

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
      appBar: EmptyAppbar(brightness: Brightness.light),
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
                    onSubmit: ({email, password}) => onSubmit(context, email, password),
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
}
