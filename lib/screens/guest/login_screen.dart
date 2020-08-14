import 'package:flutter/material.dart';
import 'package:luftcare_flutter_app/providers/auth_provider.dart';
import 'package:luftcare_flutter_app/widgets/atoms/brand_logo.dart';
import 'package:luftcare_flutter_app/widgets/organisms/auth/login_form.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static const RouteName = '/login';

  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final login = Provider.of<Auth>(context).login;
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
                        login(context, email, password),
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
