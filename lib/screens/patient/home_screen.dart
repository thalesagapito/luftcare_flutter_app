import 'package:flutter/material.dart';
import 'package:luftcare_flutter_app/screens/guest/welcome_screen.dart';
import 'package:luftcare_flutter_app/secure_storage.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatelessWidget {
  static const RouteName = '/home';
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text('home'),
            RaisedButton(
              onPressed: () async {
                await SecureStorage().logout();
                Navigator.of(context).pushAndRemoveUntil(
                  PageTransition(
                    child: WelcomeScreen(),
                    type: PageTransitionType.fade,
                    duration: Duration(milliseconds: 400),
                  ),
                  (_) => false,
                );
              },
              child: Text('logout'),
            ),
          ],
        ),
      ),
    );
  }
}
