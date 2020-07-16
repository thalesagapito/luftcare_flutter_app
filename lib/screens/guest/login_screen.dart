import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luftcare_flutter_app/widgets/atoms/brand_logo.dart';

class LoginScreenArgs {}

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  static const RouteName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const logoHeight = 32.0;
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    const pagePadding = EdgeInsets.all(30);
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
          child: LayoutBuilder(
            builder: (context, constraints) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                BrandLogo(height: logoHeight),
                Spacer(),
                _buildFormWrapper(
                  constraints: constraints,
                  logoHeight: logoHeight,
                  child: _buildForm(
                    theme: theme,
                    formKey: _formKey,
                    constraints: constraints,
                    emailFocusNode: _emailFocusNode,
                    passwordFocusNode: _passwordFocusNode,
                  ),
                ),
                _buildLoginButton(theme, context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormWrapper({
    BoxConstraints constraints,
    double logoHeight,
    Widget child,
  }) {
    const topPadding = 20;
    const scrollViewPadding = EdgeInsets.only(bottom: 20);
    final containerMaxHeight = constraints.maxHeight - logoHeight - topPadding;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(maxHeight: containerMaxHeight),
      child: SingleChildScrollView(
        padding: scrollViewPadding,
        child: child,
      ),
    );
  }

  Widget _buildForm({
    @required ThemeData theme,
    @required GlobalKey formKey,
    @required FocusNode emailFocusNode,
    @required FocusNode passwordFocusNode,
    @required BoxConstraints constraints,
  }) {
    return Form(
      key: formKey,
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
              validator: (value) {
                if (value.isEmpty) {
                  return 'Obrigatório';
                }
                return null;
              },
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[sideIcon, constrainedChild],
      ),
    );
  }

  Widget _buildLoginButton(ThemeData theme, BuildContext context) {
    return Container(
      width: double.infinity,
      child: FlatButton(
        onPressed: () => _validateAndSubmitForm(context),
        color: theme.primaryColor,
        child: const Text(
          'Entrar',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  void _validateAndSubmitForm(BuildContext context) {
    final isFormValid = _formKey.currentState.validate();
    if (isFormValid) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('beleza')));
    }
    // _formKey.currentState.save();
  }
}
