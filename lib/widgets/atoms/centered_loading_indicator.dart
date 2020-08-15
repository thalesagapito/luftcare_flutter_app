import 'package:flutter/material.dart';

class CenteredLoadingIndicator extends StatelessWidget {
  const CenteredLoadingIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final indicatorColor = Theme.of(context).primaryColor;

    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(indicatorColor),
      ),
    );
  }
}
