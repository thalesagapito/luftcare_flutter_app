import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luftcare_flutter_app/routes.dart';
import 'package:luftcare_flutter_app/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.indigo[400],
      title: 'Luftcare',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      initialRoute: '/welcome',
      routes: routes,
    );
  }
}
