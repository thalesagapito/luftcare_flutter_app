import 'dart:math';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:luftcare_flutter_app/helpers/validators.dart';
import 'package:luftcare_flutter_app/providers/symptom_questionnaires_provider.dart';
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
            _PageHeader(
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
                    ChangeNotifierProvider(
                      create: (ctx) => SymptomQuestionnaires(),
                      child: AvailableQuestionnaires(),
                    ),
                  ],
                ),
              ),
            ),
            //   child: _RecentQuestionnaires(),
          ],
        ),
      ),
    );
  }
}

class _PageHeader extends StatelessWidget {
  final DateTime selectedDate;
  final void Function(DateTime selectedDate) onSelectedDateChange;

  const _PageHeader({
    Key key,
    @required this.selectedDate,
    @required this.onSelectedDateChange,
  }) : super(key: key);

  void convertIndexToDateAndSubmitChange(int index) {
    final selectedDate = DateTime.now().add(Duration(days: index));
    onSelectedDateChange(selectedDate);
  }

  int convertDateToIndex(DateTime date) {
    final getDayOfYear = (date) => int.parse(DateFormat('D').format(date));

    final currentDayInYear = getDayOfYear(DateTime.now());
    final selectedDayInYear = getDayOfYear(date);
    return selectedDayInYear - currentDayInYear;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final headerColor = theme.primaryColor.withOpacity(0.8);
    final selectedIndex = convertDateToIndex(selectedDate);
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      color: headerColor,
    );

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _PageHeaderTitle(color: headerColor),
          Container(
            child: Stack(
              children: [
                Container(height: 40, decoration: decoration),
                _HorizontalDateCards(
                  onSelectedIndexChange: convertIndexToDateAndSubmitChange,
                  selectedIndex: selectedIndex,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PageHeaderTitle extends StatelessWidget {
  final Color color;
  const _PageHeaderTitle({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appBarHeight = Scaffold.of(context).appBarMaxHeight;

    final title = FittedBox(
      child: Text(
        'Agenda',
        textAlign: TextAlign.left,
        style: theme.textTheme.headline4.copyWith(color: Colors.white),
      ),
    );

    final today = DateFormat('d \'de\' MMMM \'de\' y').format(DateTime.now());
    final subtitle = FittedBox(
      child: Text(
        'Hoje é $today',
        style: theme.textTheme.headline5.copyWith(color: Colors.white),
      ),
    );

    return Container(
      color: color,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(24, appBarHeight + 10, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          title,
          SizedBox(height: 10),
          subtitle,
          SizedBox(height: 5),
        ],
      ),
    );
  }
}

class _HorizontalDateCards extends StatefulWidget {
  final int selectedIndex;
  final void Function(int selectedIndex) onSelectedIndexChange;

  const _HorizontalDateCards({
    Key key,
    @required this.selectedIndex,
    @required this.onSelectedIndexChange,
  }) : super(key: key);

  @override
  __HorizontalDateCardsState createState() => __HorizontalDateCardsState();
}

class __HorizontalDateCardsState extends State<_HorizontalDateCards> {
  static const NUMBER_OF_PREVIOUS_DATES = 14;
  static const CARD_WIDTH = 74.0;
  static const CARD_LEFT_MARGIN = 0.6;
  static const NUMBER_OF_CARDS = 21;
  static const SV_PADDING = 30.0;
  static const CARDS_CONTAINER_WIDTH =
      CARD_WIDTH * NUMBER_OF_CARDS + (SV_PADDING * 2);

  var _scrollController = ScrollController(
    initialScrollOffset: NUMBER_OF_PREVIOUS_DATES * CARD_WIDTH -
        (CARD_WIDTH * CARD_LEFT_MARGIN) +
        SV_PADDING,
  );

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        padding: EdgeInsets.symmetric(horizontal: SV_PADDING),
        child: Container(
          child: Row(
            children: _generateDateCards(constraints.maxWidth),
          ),
        ),
      ),
    );
  }

  double _boundDouble(double value, double lowerLimit, double upperLimit) {
    return min(upperLimit, max(lowerLimit, value));
  }

  double _getOffsetToScrollCardIntoView(int cardIndex, double visibleWidth) {
    final leftMargin = CARD_WIDTH * CARD_LEFT_MARGIN;
    final cardX = cardIndex * CARD_WIDTH + SV_PADDING;
    final widthToFillContainer = visibleWidth - CARD_WIDTH;
    final maxOffset = CARDS_CONTAINER_WIDTH - widthToFillContainer - CARD_WIDTH;
    final unboundedOffset = cardX - leftMargin;
    final offset = _boundDouble(unboundedOffset, 0, maxOffset);
    return offset;
  }

  void _onDateCardTap(int cardIndex, double visibleWidth) {
    if (widget.selectedIndex != cardIndex - NUMBER_OF_PREVIOUS_DATES) {
      widget.onSelectedIndexChange(cardIndex - NUMBER_OF_PREVIOUS_DATES);
    }

    final offset = _getOffsetToScrollCardIntoView(cardIndex, visibleWidth);
    final duration = Duration(milliseconds: 300);
    final curve = Curves.easeInOut;
    _scrollController.animateTo(offset, duration: duration, curve: curve);
  }

  List<_DateCard> _generateDateCards(double visibleWidth) {
    const startingDay = -NUMBER_OF_PREVIOUS_DATES;
    final selectedIndex = widget.selectedIndex + NUMBER_OF_PREVIOUS_DATES;
    return List.generate(NUMBER_OF_CARDS, (cardIndex) {
      final daysToAddToCurrent = Duration(days: cardIndex + startingDay);
      final dateOfCard = DateTime.now().add(daysToAddToCurrent);
      final isSelected = selectedIndex == cardIndex;
      final onTap = () => _onDateCardTap(cardIndex, visibleWidth);

      return _DateCard(
        onTap: onTap,
        date: dateOfCard,
        isSelected: isSelected,
        width: CARD_WIDTH,
      );
    });
  }
}

class _DateCard extends StatelessWidget {
  final bool isSelected;
  final Function onTap;
  final DateTime date;
  final double width;

  const _DateCard({
    Key key,
    @required this.date,
    @required this.onTap,
    @required this.width,
    @required this.isSelected,
  }) : super(key: key);

  void _feedbackThenTriggerOnTap() {
    HapticFeedback.selectionClick();
    onTap();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final weekDay = DateFormat('E').format(date);
    final monthDay = DateFormat('d').format(date);

    final cardColor = isSelected ? theme.accentColor : theme.cardColor;
    final borderRadius = BorderRadius.circular(12);
    final outer = BoxDecoration(borderRadius: borderRadius);
    final inner = BoxDecoration(
      borderRadius: borderRadius,
      color: cardColor,
      boxShadow: [
        BoxShadow(
          blurRadius: 5,
          color: Colors.black12,
          offset: Offset.fromDirection(90, 3),
        )
      ],
    );
    const padding = const EdgeInsets.symmetric(horizontal: 9);

    return Container(
      height: 80,
      width: width,
      padding: padding,
      margin: EdgeInsets.only(bottom: 10),
      decoration: outer,
      child: Container(
        decoration: inner,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            borderRadius: borderRadius,
            onTap: _feedbackThenTriggerOnTap,
            child: _buildCardTexts(isSelected, weekDay, monthDay),
          ),
        ),
      ),
    );
  }

  Widget _buildCardTexts(bool isSelected, String weekDay, String monthDay) {
    final textColor = isSelected ? Colors.white : Colors.black87;

    final weekDayStyle = TextStyle(color: textColor);
    final monthDayStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: textColor,
      fontSize: 26,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(Transformers.capitalize(weekDay), style: weekDayStyle),
        Text(monthDay, style: monthDayStyle),
      ],
    );
  }
}
