import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luftcare_flutter_app/widgets/organisms/layout/top_navbar.dart';
import 'package:luftcare_flutter_app/widgets/organisms/layout/side_drawer.dart';
import 'package:luftcare_flutter_app/widgets/organisms/layout/bottom_navbar.dart';
import 'package:luftcare_flutter_app/screens/patient/home_screen/overview/overview.dart';

class HomeScreen extends StatefulWidget {
  static const RouteName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedNavbarIndex = 0;

  void _onNavbarItemTapped(int index) {
    HapticFeedback.selectionClick();
    setState(() => _selectedNavbarIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final List<Widget> _widgetOptions = <Widget>[
      Overview(),
      Text('Index 1: questionarios'),
      // Text('Index 2: historico'),
      ListView(
        children: [
          SizedBox(height: 60),
          Text('headline1', style: textTheme.headline1),
          Text('headline2', style: textTheme.headline2),
          Text('headline3', style: textTheme.headline3),
          Text('headline4', style: textTheme.headline4),
          Text('headline5', style: textTheme.headline5),
          Text('headline6', style: textTheme.headline6),
          Text('bodyText1', style: textTheme.bodyText1),
          Text('bodyText2', style: textTheme.bodyText2),
          Text('subtitle1', style: textTheme.subtitle1),
          Text('subtitle2', style: textTheme.subtitle2),
          Text('button', style: textTheme.button),
          Text('overline', style: textTheme.overline),
          Text('caption', style: textTheme.caption),
        ],
      ),
    ];
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
