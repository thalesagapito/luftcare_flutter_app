import 'package:flutter/material.dart';
import 'package:luftcare_flutter_app/widgets/atoms/brand_logo.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            title: BrandLogo(height: 20, brightness: Brightness.light),
            automaticallyImplyLeading: false,
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                Placeholder(fallbackHeight: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
