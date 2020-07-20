import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:luftcare_flutter_app/helpers/custom_icons.dart';

class BottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onTap;

  const BottomNavbar({@required this.onTap, @required this.selectedIndex});

  static const _items = [
    BottomNavigationBarItem(
      title: Text('Início'),
      icon: Icon(CupertinoIcons.home),
      activeIcon: Icon(CustomIcons.home_filled),
    ),
    BottomNavigationBarItem(
      title: Text('Questionários'),
      icon: Icon(CustomIcons.list),
      activeIcon: Icon(CustomIcons.list_filled),
    ),
    BottomNavigationBarItem(
      icon: Icon(
        CustomIcons.refresh_thin,
        textDirection: TextDirection.rtl,
      ),
      title: Text('Histórico'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      items: _items,
      currentIndex: selectedIndex,
      elevation: 12,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      type: BottomNavigationBarType.fixed,
    );
  }
}
