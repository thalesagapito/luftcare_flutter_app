import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const RouteName = '/home';
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text('home'),
      ),
    );
  }
}
