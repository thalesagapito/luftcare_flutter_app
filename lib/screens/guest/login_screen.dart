import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luftcare_flutter_app/widgets/atoms/brand_logo.dart';

class LoginScreenArgs {}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  static const RouteName = '/login';

  @override
  Widget build(BuildContext context) {
    final logoHeight = 32.0;
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final safeAreaVerticalPadding = mediaQuery.padding.vertical;
    const containerPadding = EdgeInsets.all(30);
    final containerConstraints = BoxConstraints(
      maxHeight: mediaQuery.size.height - safeAreaVerticalPadding,
      maxWidth: mediaQuery.size.width,
      minWidth: mediaQuery.size.width,
    );
    final emailFocusNode = FocusNode();
    final passwordFocusNode = FocusNode();

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: containerPadding,
          constraints: containerConstraints,
          child: LayoutBuilder(
            builder: (context, constraints) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                BrandLogo(height: logoHeight),
                Spacer(),
                _buildForm(
                  constraints,
                  logoHeight,
                  theme,
                  emailFocusNode,
                  passwordFocusNode,
                ),
                _buildLoginButton(theme, () {})
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm(
    BoxConstraints constraints,
    double logoHeight,
    ThemeData theme,
    FocusNode emailFocusNode,
    FocusNode passwordFocusNode,
  ) {
    const topPadding = 20;
    const scrollViewPadding = EdgeInsets.only(bottom: 20);
    final containerMaxHeight = constraints.maxHeight - logoHeight - topPadding;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(maxHeight: containerMaxHeight),
      child: SingleChildScrollView(
        padding: scrollViewPadding,
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildTitle(theme),
              _buildLoginTextField(
                theme: theme,
                constraints: constraints,
                icon: CupertinoIcons.mail,
                child: TextFormField(
                  focusNode: emailFocusNode,
                  keyboardAppearance: theme.brightness,
                  textInputAction: TextInputAction.next,

                  onFieldSubmitted: (_) => passwordFocusNode.requestFocus(),
                  keyboardType: TextInputType.emailAddress,
                  // focusNode: ,
                  decoration: InputDecoration(
                    labelText: 'Endereço de email',
                    focusColor: theme.primaryColor,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              _buildLoginTextField(
                theme: theme,
                constraints: constraints,
                icon: CupertinoIcons.padlock,
                child: TextFormField(
                  obscureText: true,
                  focusNode: passwordFocusNode,
                  textInputAction: TextInputAction.done,
                  keyboardAppearance: theme.brightness,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    focusColor: theme.primaryColor,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 10),
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
        'Bem vindo!',
        textAlign: TextAlign.left,
        style: theme.textTheme.headline5.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 28,
        ),
      ),
    );
  }

  Widget _buildLoginTextField({
    @required BoxConstraints constraints,
    @required ThemeData theme,
    @required IconData icon,
    @required Widget child,
  }) {
    final iconSize = 60.0;
    final childMaxWidth = constraints.maxWidth - iconSize - 20;
    final sideIcon = Container(
      width: iconSize,
      height: iconSize,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: theme.primaryColor.withOpacity(0.15),
      ),
      child: Icon(icon, color: theme.primaryColor, size: 32),
    );

    final constrainedChild = Container(
      constraints: BoxConstraints(maxWidth: childMaxWidth),
      child: child,
    );

    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[sideIcon, constrainedChild],
      ),
    );
  }

  Widget _buildLoginButton(ThemeData theme, Function pressedHandler) {
    return Container(
      width: double.infinity,
      child: FlatButton(
        onPressed: pressedHandler,
        color: theme.primaryColor,
        child: const Text(
          'Entrar',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
