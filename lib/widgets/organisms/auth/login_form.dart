import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:luftcare_flutter_app/helpers/validators.dart';
import 'package:luftcare_flutter_app/widgets/atoms/auth/auth_button.dart';
import 'package:luftcare_flutter_app/widgets/atoms/auth/auth_input.dart';

class LoginForm extends StatefulWidget {
  final void Function({String email, String password}) onSubmit;

  const LoginForm({Key key, @required this.onSubmit}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;

  @override
  void dispose() {
    super.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
  }

  void _onEmailSaved(String value) => setState(() => _email = value);
  void _onPasswordSaved(String value) => setState(() => _password = value);

  void _validateAndSubmitIfValid() {
    final isFormInvalid = !_formKey.currentState.validate();
    if (isFormInvalid) return;

    _formKey.currentState.save();
    widget.onSubmit(email: _email, password: _password);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTitle(theme),
          SizedBox(height: 20),
          AuthInput(
            CupertinoIcons.mail,
            TextFormField(
              onSaved: _onEmailSaved,
              focusNode: _emailFocusNode,
              autocorrect: false,
              validator: Validators.emailValidator,
              keyboardAppearance: theme.brightness,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              onFieldSubmitted: (_) => _passwordFocusNode.requestFocus(),
              decoration: AuthInput.decoration('Endereço de email', theme),
            ),
          ),
          SizedBox(height: 20),
          AuthInput(
            CupertinoIcons.padlock,
            TextFormField(
              obscureText: true,
              autocorrect: false,
              onSaved: _onPasswordSaved,
              focusNode: _passwordFocusNode,
              keyboardAppearance: theme.brightness,
              textInputAction: TextInputAction.done,
              validator: Validators.passwordValidator,
              decoration: AuthInput.decoration('Senha', theme),
            ),
          ),
          SizedBox(height: 30),
          AuthButton(onPressed: _validateAndSubmitIfValid)
        ],
      ),
    );
  }

  Widget _buildTitle(ThemeData theme) => Text(
        'Bem vindo!',
        textAlign: TextAlign.left,
        style: theme.textTheme.headline5.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 28,
        ),
      );
}
