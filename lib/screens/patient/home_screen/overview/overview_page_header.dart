import 'dart:io';
import 'dart:math';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luftcare_flutter_app/helpers/validators.dart';
import 'package:luftcare_flutter_app/widgets/atoms/toggleable_container.dart';

class OverviewPageHeader extends StatelessWidget {
  final DateTime selectedDate;
  final void Function(DateTime selectedDate) onSelectedDateChange;

  const OverviewPageHeader({
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
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
      color: headerColor,
    );

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _PageHeaderTitle(color: headerColor),
          Container(
            transform: Platform.isIOS ? null : Matrix4.translationValues(0, -0.1, 0),
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
        style: theme.textTheme.headline4.copyWith(color: Colors.white, fontWeight: FontWeight.w700),
      ),
    );

    final today = DateFormat('d \'de\' MMMM \'de\' y').format(DateTime.now());
    final subtitle = FittedBox(
      child: Text(
        '$today',
        style: theme.textTheme.headline5.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
      ),
    );

    return Container(
      color: color,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(24, appBarHeight + 10, 20, 10),
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
  static const NUMBER_OF_PREVIOUS_DATES = 7;
  static const CARD_WIDTH = 74.0;
  static const CARD_LEFT_MARGIN = 0.6;
  static const CARD_COUNT = 15;
  static const SV_PADDING = 30.0;
  static const CARDS_CONTAINER_WIDTH = CARD_WIDTH * CARD_COUNT + (SV_PADDING * 2);

  var _scrollController = ScrollController(
    initialScrollOffset:
        NUMBER_OF_PREVIOUS_DATES * CARD_WIDTH - (CARD_WIDTH * CARD_LEFT_MARGIN) + SV_PADDING,
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
        padding: EdgeInsets.symmetric(horizontal: SV_PADDING, vertical: 5),
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
    return List.generate(CARD_COUNT, (cardIndex) {
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
    const margin = const EdgeInsets.only(bottom: 10);
    const padding = const EdgeInsets.symmetric(horizontal: 9);

    return Container(
      height: 80,
      width: width,
      margin: margin,
      padding: padding,
      child: ToggleableContainer(
        isToggled: isSelected,
        toggledColor: theme.accentColor,
        onTap: _feedbackThenTriggerOnTap,
        child: _buildCardTexts(isSelected, weekDay, monthDay),
      ),
    );
  }

  Widget _buildCardTexts(bool isSelected, String weekDay, String monthDay) {
    final textColor = isSelected ? Colors.white : Colors.black87;

    final weekDayStyle = TextStyle(
      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
      color: textColor,
      fontSize: 14,
    );
    final monthDayStyle = TextStyle(
      fontWeight: isSelected ? FontWeight.w800 : FontWeight.w700,
      color: textColor,
      fontSize: 28,
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
