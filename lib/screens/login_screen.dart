import 'package:flutter/material.dart';

class LoginScreenArgs {}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  static const RouteName = '/login';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          // height: containerHeight,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildLogo(theme),
              Spacer(),
              buildTitle(theme),
              buildSubtitle(theme),
            ],
          ),
        ),
      ),
    );
  }

  void goToSignIn() {
    print('go to signin');
  }

  Widget buildLogo(ThemeData theme) {
    final isThemeDark = theme.brightness == Brightness.dark;
    final imagePath = isThemeDark
        ? 'assets/images/logo-white.png'
        : 'assets/images/logo-black.png';
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Image.asset(imagePath, height: 32),
    );
  }

  Widget buildTitle(ThemeData theme) {
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

  Widget buildSubtitle(ThemeData theme) {
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

  Widget buildSignInButton(ThemeData theme, Function pressedHandler) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 10),
      child: FlatButton(
        onPressed: pressedHandler,
        color: theme.primaryColor,
        child: const Text(
          'Entrar na minha conta',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget buildContactButton(ThemeData theme, Function pressedHandler) {
    return Container(
      width: double.infinity,
      child: FlatButton(
        textColor: theme.primaryColor,
        color: theme.primaryColor.withOpacity(0.15),
        onPressed: () {
          print('AAAAAA');
        },
        child: Text(
          'Quero solicitar acesso',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
