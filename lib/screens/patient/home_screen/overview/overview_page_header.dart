import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class OverviewPageHeader extends StatelessWidget {
  const OverviewPageHeader();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final headerColor = theme.primaryColor.withOpacity(0.8);
    final appBarHeight = Scaffold.of(context).appBarMaxHeight;
    final today = DateFormat('d \'de\' MMMM \'de\' y').format(DateTime.now());

    final decoration = BoxDecoration(
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
      color: headerColor,
    );

    return Container(
      decoration: decoration,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(24, appBarHeight + 10, 20, 45),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTitle(textTheme),
          _buildSubtitle(textTheme, today),
        ],
      ),
    );
  }

  Widget _buildTitle(TextTheme textTheme) => FittedBox(
        child: Text(
          'Agenda',
          textAlign: TextAlign.left,
          style: textTheme.headline4.copyWith(color: Colors.white, fontWeight: FontWeight.w700),
        ),
      );

  Widget _buildSubtitle(TextTheme textTheme, String today) => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: FittedBox(
          child: Text(
            '$today',
            style: textTheme.headline5.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      );
}
