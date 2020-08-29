import 'package:flutter/material.dart';
import 'package:luftcare_flutter_app/widgets/atoms/brand_logo.dart';
import 'package:luftcare_flutter_app/screens/guest/login_screen.dart';
import 'package:luftcare_flutter_app/widgets/organisms/layout/empty_appbar.dart';

class GuestWelcomeScreen extends StatelessWidget {
  const GuestWelcomeScreen({Key key}) : super(key: key);

  static const RouteName = '/welcome';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final navigator = Navigator.of(context);

    return Scaffold(
      appBar: EmptyAppbar(brightness: Brightness.light),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BrandLogo(),
              Spacer(),
              _buildTitle(theme),
              _buildSubtitle(theme),
              _buildSignInButton(theme, navigator),
              _buildContactButton(theme, navigator),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        'Ainda estamos\nem fase de testes',
        textAlign: TextAlign.left,
        style: theme.textTheme.headline5.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 28,
        ),
      ),
    );
  }

  Widget _buildSubtitle(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.only(right: 32, bottom: 64),
      child: Text(
        'Por isso somente usuários selecionados têm acesso ao app.\n' +
            'Caso tenha uma conta, entre normalmente e podemos começar.\n' +
            'Se não, entre em contato com a gente e solicite um acesso.',
        textAlign: TextAlign.left,
        style: theme.textTheme.subtitle1.copyWith(fontSize: 18),
      ),
    );
  }

  Widget _buildSignInButton(ThemeData theme, NavigatorState navigator) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 10),
      child: FlatButton(
        onPressed: () => navigator.pushNamed(LoginScreen.RouteName),
        color: theme.primaryColor,
        child: const Text(
          'Entrar na minha conta',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildContactButton(ThemeData theme, NavigatorState navigator) {
    return Container(
      width: double.infinity,
      child: FlatButton(
        textColor: theme.primaryColor,
        color: theme.primaryColor.withOpacity(0.15),
        onPressed: () {},
        child: Text(
          'Quero solicitar acesso',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
