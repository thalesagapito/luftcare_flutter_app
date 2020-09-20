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
import 'package:luftcare_flutter_app/providers/current_user_provider.dart';
import 'package:luftcare_flutter_app/screens/guest/guest_welcome_screen.dart';
import 'package:luftcare_flutter_app/screens/patient/home_screen/home_screen.dart';
import 'package:luftcare_flutter_app/widgets/atoms/centered_loading_indicator.dart';

String get host => Platform.isAndroid ? '10.0.2.2' : '192.168.0.14';
// final String graphqlEndpoint = 'http://$host:5000';
final String graphqlEndpoint = 'https://luftcare.com.br/api';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
  );
  await initializeDateFormatting('pt_BR');
  Intl.defaultLocale = 'pt_BR';

  final navigatorKey = GlobalKey<NavigatorState>();
  final loggedInRoute = HomeScreen.RouteName;
  final notLoggedInRoute = GuestWelcomeScreen.RouteName;
  final hasAuthToken = await SecureStorage().hasAuthToken;
  final initialRoute = hasAuthToken ? loggedInRoute : notLoggedInRoute;

  runApp(MyApp(initialRoute: initialRoute, navigatorKey: navigatorKey));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  final GlobalKey<NavigatorState> navigatorKey;
  MyApp({this.initialRoute, this.navigatorKey});

  @override
  Widget build(BuildContext context) {
    final loadingTheme = LoadingThemeData(
      loadingBackgroundColor: Colors.transparent,
      backgroundColor: Colors.white70,
    );

    return GraphqlProvider(
      uri: graphqlEndpoint,
      navigatorKey: navigatorKey,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Auth()),
          ChangeNotifierProvider(create: (_) => CurrentUser()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          color: Colors.indigo[400],
          title: 'Luftcare',
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.light,
          initialRoute: initialRoute,
          navigatorKey: navigatorKey,
          routes: routes,
          builder: (context, child) => LoadingProvider(
            loadingWidgetBuilder: (context, data) => CenteredLoadingIndicator(),
            themeData: loadingTheme,
            child: child,
          ),
        ),
      ),
    );
  }
}
