import 'package:luftcare_flutter_app/screens/guest/login_screen.dart';
import 'package:luftcare_flutter_app/screens/guest/guest_welcome_screen.dart';
import 'package:luftcare_flutter_app/screens/patient/home_screen/home_screen.dart';
import 'package:luftcare_flutter_app/screens/patient/respond_questionnaire/submit_response_screen.dart';
import 'package:luftcare_flutter_app/screens/patient/respond_questionnaire/respond_questionnaire_screen.dart';

final routes = {
  LoginScreen.RouteName: (ctx) => LoginScreen(),
  GuestWelcomeScreen.RouteName: (ctx) => GuestWelcomeScreen(),
  HomeScreen.RouteName: (ctx) => HomeScreen(),
  SubmitResponseScreen.RouteName: (ctx) => SubmitResponseScreen(),
  RespondQuestionnaireScreen.RouteName: (ctx) => RespondQuestionnaireScreen(),
};
