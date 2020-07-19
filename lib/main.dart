import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luftcare_flutter_app/graphql_provider.dart';
import 'package:luftcare_flutter_app/routes.dart';
import 'package:luftcare_flutter_app/theme.dart';

String get host => Platform.isAndroid ? '10.0.2.2' : 'localhost';
final String graphqlEndpoint = 'http://$host:5000';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GraphqlProvider(
      uri: graphqlEndpoint,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        color: Colors.indigo[400],
        title: 'Luftcare',
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.light,
        initialRoute: '/welcome',
        routes: routes,
      ),
    );
  }
}
