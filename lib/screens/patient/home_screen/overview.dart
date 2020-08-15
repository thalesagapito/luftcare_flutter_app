import 'dart:math';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:luftcare_flutter_app/helpers/validators.dart';
import 'package:luftcare_flutter_app/providers/auth_provider.dart';
import 'package:luftcare_flutter_app/providers/symptom_questionnaires_provider.dart';
import 'package:luftcare_flutter_app/screens/patient/home_screen/overview/answered_questionnaires.dart';
import 'package:luftcare_flutter_app/screens/patient/home_screen/overview/available_questionnaires.dart';

class Overview extends StatelessWidget {
  const Overview({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backgroundColor = theme.primaryColor.withOpacity(0.1);

    return LayoutBuilder(
      builder: (_, constraints) => Container(
        color: backgroundColor,
        child: Column(
          children: <Widget>[
            _PageHeader(),
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
  const _PageHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final headerColor = theme.primaryColor.withOpacity(0.2);

    final gradient = BoxDecoration(
      gradient: LinearGradient(
        colors: [headerColor, Colors.transparent],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.5, 0.5],
      ),
    );

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _PageHeaderTitle(color: headerColor),
          Container(decoration: gradient, child: _HorizontalDateCards()),
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
    final currentUser = Provider.of<Auth>(context).user;

    final currentUserName = currentUser?.name ?? '...';
    final firstName = currentUserName.split(' ')[0];

    final title = FittedBox(
      child: Text(
        'Olá, $firstName',
        textAlign: TextAlign.left,
        style: theme.textTheme.headline4,
      ),
    );

    // final boldTextStyle = TextStyle(fontWeight: FontWeight.bold);
    // final subtitle = RichText(
    //   text: TextSpan(
    //     style: theme.textTheme.headline5,
    //     text: 'Você tem ',
    //     children: [
    //       TextSpan(text: '4 ações', style: boldTextStyle),
    //       TextSpan(text: ' hoje!'),
    //     ],
    //   ),
    // );

    return Container(
      color: color,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(24, appBarHeight + 10, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          title,
          SizedBox(height: 10),
          // subtitle,
        ],
      ),
    );
  }
}

class _HorizontalDateCards extends StatefulWidget {
  const _HorizontalDateCards({Key key}) : super(key: key);

  @override
  __HorizontalDateCardsState createState() => __HorizontalDateCardsState();
}

class __HorizontalDateCardsState extends State<_HorizontalDateCards> {
  static const DAYS_TO_SUBTRACT_TO_GET_INITIAL_DATE = 14;
  static const CARD_WIDTH = 70.0;
  static const CARD_LEFT_MARGIN = 0.6;
  static const NUMBER_OF_CARDS = 21;
  static const CARDS_CONTAINER_WIDTH = CARD_WIDTH * NUMBER_OF_CARDS;

  var _selectedIndex = DAYS_TO_SUBTRACT_TO_GET_INITIAL_DATE;
  var _scrollController = ScrollController(
    initialScrollOffset: DAYS_TO_SUBTRACT_TO_GET_INITIAL_DATE * CARD_WIDTH -
        (CARD_WIDTH * CARD_LEFT_MARGIN),
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
