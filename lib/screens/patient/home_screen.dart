import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luftcare_flutter_app/widgets/organisms/layout/bottom_navbar.dart';
import 'package:luftcare_flutter_app/widgets/organisms/layout/top_navbar.dart';

class HomeScreen extends StatefulWidget {
  static const RouteName = '/home';
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: Home'),
    Text('Index 1: questionarios'),
    Text('Index 2: historico'),
  ];

  void _onNavbarItemTapped(int index) {
    HapticFeedback.selectionClick();
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final visibleWidget = _widgetOptions.elementAt(_selectedIndex);

    return Scaffold(
      appBar: TopNavbar(),
      bottomNavigationBar: BottomNavbar(
        selectedIndex: _selectedIndex,
        onTap: _onNavbarItemTapped,
      ),
      drawer: Text('sidebar'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: visibleWidget,
        ),
      ),
    );
  }
}
