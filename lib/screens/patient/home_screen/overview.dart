import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:luftcare_flutter_app/helpers/validators.dart';

class Overview extends StatelessWidget {
  const Overview({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.primaryColor.withOpacity(0.2),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 72),
        child: Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Text('test', style: TextStyle(fontSize: 180)),
              Text('test', style: TextStyle(fontSize: 180)),
              _HorizontalDateCards(),
              _RecentQuestionnaires(),
            ],
          ),
        ),
      ),
    );
  }
}

class _HorizontalDateCards extends StatefulWidget {
  const _HorizontalDateCards({
    Key key,
  }) : super(key: key);

  @override
  __HorizontalDateCardsState createState() => __HorizontalDateCardsState();
}

class __HorizontalDateCardsState extends State<_HorizontalDateCards> {
  static const DAYS_TO_SUBTRACT_TO_GET_INITIAL_DATE = 14;
  static const CARD_WIDTH = 76.0;
  static const NUMBER_OF_CARDS = 21;
  static const CARDS_CONTAINER_WIDTH = CARD_WIDTH * NUMBER_OF_CARDS;

  var _selectedIndex = DAYS_TO_SUBTRACT_TO_GET_INITIAL_DATE;
  var _scrollController = ScrollController(
    initialScrollOffset:
        DAYS_TO_SUBTRACT_TO_GET_INITIAL_DATE * CARD_WIDTH - (CARD_WIDTH * 0.5),
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
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        child: Row(
          children: _generateDateCards(constraints.maxWidth),
        ),
      ),
    );
  }

  double _boundDouble(double value, double lowerLimit, double upperLimit) {
    return min(upperLimit, max(lowerLimit, value));
  }

  double _getOffsetToScrollCardIntoView(int cardIndex, double visibleWidth) {
    final leftMargin = CARD_WIDTH * 0.5;
    final cardX = cardIndex * CARD_WIDTH;
    final widthToFillContainer = visibleWidth - CARD_WIDTH;
    final maxOffset = CARDS_CONTAINER_WIDTH - widthToFillContainer - CARD_WIDTH;
    final unboundedOffset = cardX - leftMargin;
    final offset = _boundDouble(unboundedOffset, 0, maxOffset);
    return offset;
  }

  void _onDateCardTap(int cardIndex, double visibleWidth) {
    setState(() => _selectedIndex = cardIndex);

    final offset = _getOffsetToScrollCardIntoView(cardIndex, visibleWidth);
    final duration = Duration(milliseconds: 300);
    final curve = Curves.easeInOut;
    // print(cardsContainerWidth);
    _scrollController.animateTo(offset, duration: duration, curve: curve);
  }

  List<_DateCard> _generateDateCards(double visibleWidth) {
    const startingDay = -DAYS_TO_SUBTRACT_TO_GET_INITIAL_DATE;
    return List.generate(NUMBER_OF_CARDS, (cardIndex) {
      final daysToAddToCurrent = Duration(days: cardIndex + startingDay);
      final dateOfCard = DateTime.now().add(daysToAddToCurrent);
      final isSelected = _selectedIndex == cardIndex;
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

    final cardColor = isSelected ? theme.primaryColor : theme.cardColor;
    final borderRadius = BorderRadius.circular(12);
    final outer = BoxDecoration(borderRadius: borderRadius);
    final inner = BoxDecoration(borderRadius: borderRadius, color: cardColor);
    const padding = const EdgeInsets.symmetric(horizontal: 8);

    return Container(
      height: 80,
      width: width,
      padding: padding,
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

class _RecentQuestionnaires extends StatelessWidget {
  const _RecentQuestionnaires({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Questionários',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
