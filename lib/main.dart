import 'dart:io';

import 'package:intl/intl.dart';
import 'package:load/load.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:luftcare_flutter_app/theme.dart';
import 'package:luftcare_flutter_app/routes.dart';
import 'package:luftcare_flutter_app/secure_storage.dart';
import 'package:luftcare_flutter_app/graphql_provider.dart';
import 'package:luftcare_flutter_app/providers/auth_provider.dart';
import 'package:luftcare_flutter_app/screens/patient/home_screen.dart';
import 'package:luftcare_flutter_app/screens/guest/welcome_screen.dart';

String get host => Platform.isAndroid ? '10.0.2.2' : 'localhost';
final String graphqlEndpoint = 'http://$host:5000';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
  );
  await initializeDateFormatting('pt_BR');
  Intl.defaultLocale = 'pt_BR';

  final isLoggedIn = await SecureStorage().isLoggedIn;
  final loggedInRoute = HomeScreen.RouteName;
  final notLoggedInRoute = WelcomeScreen.RouteName;
  final initialRoute = isLoggedIn ? loggedInRoute : notLoggedInRoute;

  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  MyApp({this.initialRoute});

  @override
  Widget build(BuildContext context) {
    final loadingTheme = LoadingThemeData(
      backgroundColor: Colors.white70,
      loadingBackgroundColor: Colors.transparent,
    );
    final loadingWidget = Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.indigo[300]),
      ),
    );

    return LoadingProvider(
      themeData: loadingTheme,
      loadingWidgetBuilder: (context, data) => loadingWidget,
      child: GraphqlProvider(
        uri: graphqlEndpoint,
        child: ChangeNotifierProvider(
          create: (ctx) => Auth(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            color: Colors.indigo[400],
            title: 'Luftcare',
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: ThemeMode.light,
            initialRoute: initialRoute,
            routes: routes,
          ),
        ),
      ),
    );
  }
}
