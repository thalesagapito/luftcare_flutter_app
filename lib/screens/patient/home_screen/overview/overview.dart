import 'package:flutter/material.dart';
import 'package:luftcare_flutter_app/screens/patient/home_screen/overview/overview_page_header.dart';
import 'package:luftcare_flutter_app/screens/patient/home_screen/overview/answered_questionnaires.dart';
import 'package:luftcare_flutter_app/screens/patient/home_screen/overview/available_questionnaires.dart';

class Overview extends StatefulWidget {
  const Overview({Key key}) : super(key: key);

  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backgroundColor = theme.primaryColor.withOpacity(0.04);

    return LayoutBuilder(
      builder: (_, constraints) => Container(
        color: backgroundColor,
        child: Column(
          children: <Widget>[
            OverviewPageHeader(
              selectedDate: _selectedDate,
              onSelectedDateChange: (selectedDate) {
                setState(() => _selectedDate = selectedDate);
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AnsweredQuestionnaires(),
                    SizedBox(height: 5),
                    AvailableQuestionnaires(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
