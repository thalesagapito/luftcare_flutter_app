import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:luftcare_flutter_app/secure_storage.dart';
import 'package:luftcare_flutter_app/providers/auth_provider.dart';
import 'package:luftcare_flutter_app/widgets/atoms/brand_logo.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<Auth>(context, listen: false);
    final removeTokens = SecureStorage().clearApiTokens;
    final pushToHomePage = authProvider.pushToLoggedOutHome;
    final logout = () => removeTokens().then((_) => pushToHomePage(context));

    return Drawer(
      child: CustomScrollView(
        physics: const ClampingScrollPhysics(),
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
                ListTile(
                  title: Text('Logout'),
                  onTap: logout,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
