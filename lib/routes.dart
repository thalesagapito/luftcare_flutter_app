import 'package:luftcare_flutter_app/screens/guest/login_screen.dart';
import 'package:luftcare_flutter_app/screens/patient/home_screen.dart';
import 'package:luftcare_flutter_app/screens/guest/welcome_screen.dart';

final routes = {
  LoginScreen.RouteName: (ctx) => LoginScreen(),
  WelcomeScreen.RouteName: (ctx) => WelcomeScreen(),
  HomeScreen.RouteName: (ctx) => HomeScreen(),
};
