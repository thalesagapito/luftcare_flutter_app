import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:luftcare_flutter_app/providers/auth_provider.dart';

class RespondQuestionnaireScreenArgs {
  final String questionnaireId;

  RespondQuestionnaireScreenArgs({this.questionnaireId});
}

class RespondQuestionnaireScreen extends StatefulWidget {
  static const RouteName = '/respond-questionnaire';

  const RespondQuestionnaireScreen({Key key}) : super(key: key);

  @override
  _RespondQuestionnaireScreenState createState() =>
      _RespondQuestionnaireScreenState();
}

class _RespondQuestionnaireScreenState
    extends State<RespondQuestionnaireScreen> {
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    final RespondQuestionnaireScreenArgs args =
        ModalRoute.of(context).settings.arguments;
    final questionnaireId = args.questionnaireId;
    print('here $questionnaireId');
    print(questionnaireId);
    // final authProvider = Provider.of<Auth>(context);
    // final currentUser = authProvider.user;
    // if (currentUser == null) {
    //   await authProvider.getUserFromApi(context);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: TopNavbar(),
      // bottomNavigationBar: BottomNavbar(
      //   selectedIndex: _selectedNavbarIndex,
      //   onTap: _onNavbarItemTapped,
      // ),
      // drawer: SideDrawer(),
      body: Column(
        children: [
          Text(
            'aaaaa',
            style: TextStyle(fontSize: 99),
          ),
          RaisedButton(onPressed: Navigator.of(context).pop)
        ],
      ),
    );
  }
}
