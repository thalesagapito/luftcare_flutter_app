import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:luftcare_flutter_app/providers/auth_provider.dart';
import 'package:luftcare_flutter_app/widgets/organisms/layout/top_navbar.dart';
import 'package:luftcare_flutter_app/widgets/organisms/layout/side_drawer.dart';
import 'package:luftcare_flutter_app/screens/patient/home_screen/overview.dart';
import 'package:luftcare_flutter_app/widgets/organisms/layout/bottom_navbar.dart';

class HomeScreen extends StatefulWidget {
  static const RouteName = '/home';
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedNavbarIndex = 0;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    final authProvider = Provider.of<Auth>(context);
    final currentUser = authProvider.user;
    if (currentUser == null) {
      await authProvider.getUserFromApi(context);
    }
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Overview(),
    Text('Index 1: questionarios'),
    Text('Index 2: historico'),
  ];

  void _onNavbarItemTapped(int index) {
    HapticFeedback.selectionClick();
    setState(() => _selectedNavbarIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final visibleWidget = _widgetOptions.elementAt(_selectedNavbarIndex);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: TopNavbar(),
      bottomNavigationBar: BottomNavbar(
        selectedIndex: _selectedNavbarIndex,
        onTap: _onNavbarItemTapped,
      ),
      drawer: SideDrawer(),
      body: visibleWidget,
    );
  }
}
