import 'package:flutter/material.dart';
import 'package:luftcare_flutter_app/theme/theme_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Color(0xFF5C6AC4),
        errorColor: Color(0xFFFE6364),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Text('Flutter Demo Home Page'),
    );
  }
}
