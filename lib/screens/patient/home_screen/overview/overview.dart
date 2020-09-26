import 'package:flutter/material.dart';
import 'package:luftcare_flutter_app/screens/patient/home_screen/overview/overview_date_cards.dart';
import 'package:luftcare_flutter_app/screens/patient/home_screen/overview/overview_page_header.dart';
import 'package:luftcare_flutter_app/widgets/organisms/helpers/fixed_height_translated_container.dart';
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
    final now = DateTime.now();
    final isSelectedDateInThePast = now.difference(_selectedDate).inHours >= 24;
    final isSelectedDateInTheFuture = now.difference(_selectedDate).inHours <= -23;
    final isSelectedDateToday = !isSelectedDateInThePast && !isSelectedDateInTheFuture;
    final backgroundColor = theme.primaryColor.withOpacity(0.04);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          width: double.infinity,
          color: backgroundColor,
          child: Column(
            children: [
              OverviewPageHeader(),
              FixedHeightTranslatedContainer(
                maxHeight: 56,
                yTranslate: -36,
                child: OverviewDateCards(
                  selectedDate: _selectedDate,
                  onSelectedDateChange: (selectedDate) =>
                      setState(() => _selectedDate = selectedDate),
                ),
              ),
              Expanded(
                child: RefreshIndicator(
                  displacement: 0,
                  onRefresh: () => Future.delayed(Duration(milliseconds: 0), () => setState(() {})),
                  child: ListView(
                    padding: const EdgeInsets.only(bottom: 30),
                    children: [
                      SizedBox(height: 10),
                      if (!isSelectedDateInTheFuture)
                        AnsweredQuestionnaires(selectedDate: _selectedDate),
                      SizedBox(height: 15),
                      if (isSelectedDateToday) AvailableQuestionnaires(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
