import 'dart:math';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luftcare_flutter_app/helpers/validators.dart';
import 'package:luftcare_flutter_app/widgets/atoms/toggleable_container.dart';

class OverviewDateCards extends StatefulWidget {
  final int selectedIndex;
  final DateTime selectedDate;
  final void Function(DateTime selectedDate) onSelectedDateChange;

  OverviewDateCards({
    @required selectedDate,
    @required onSelectedDateChange,
  })  : this.selectedDate = selectedDate,
        this.onSelectedDateChange = onSelectedDateChange,
        this.selectedIndex = convertDateToIndex(selectedDate);

  static int convertDateToIndex(DateTime date) {
    final getDayOfYear = (date) => int.parse(DateFormat('D').format(date));

    final currentDayInYear = getDayOfYear(DateTime.now());
    final selectedDayInYear = getDayOfYear(date);
    return selectedDayInYear - currentDayInYear;
  }

  @override
  _OverviewDateCardsState createState() => _OverviewDateCardsState();
}

class _OverviewDateCardsState extends State<OverviewDateCards> {
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
    return Container(
      child: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          padding: EdgeInsets.symmetric(horizontal: SV_PADDING),
          child: Row(
            children: _generateDateCards(constraints.maxWidth),
          ),
        ),
      ),
    );
  }

  void convertIndexToDateAndSubmitChange(int index) {
    final selectedDate = DateTime.now().add(Duration(days: index));
    widget.onSelectedDateChange(selectedDate);
  }

  double _clampDouble(double value, double lowerLimit, double upperLimit) {
    return min(upperLimit, max(lowerLimit, value));
  }

  double _getOffsetToScrollCardIntoView(int cardIndex, double visibleWidth) {
    final leftMargin = CARD_WIDTH * CARD_LEFT_MARGIN;
    final cardX = cardIndex * CARD_WIDTH + SV_PADDING;
    final widthToFillContainer = visibleWidth - CARD_WIDTH;
    final maxOffset = CARDS_CONTAINER_WIDTH - widthToFillContainer - CARD_WIDTH;
    final unclampedOffset = cardX - leftMargin;
    final offset = _clampDouble(unclampedOffset, 0, maxOffset);
    return offset;
  }

  void _onDateCardTap(int cardIndex, double visibleWidth) {
    if (widget.selectedIndex != cardIndex - NUMBER_OF_PREVIOUS_DATES) {
      convertIndexToDateAndSubmitChange(cardIndex - NUMBER_OF_PREVIOUS_DATES);
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
    const margin = const EdgeInsets.only(top: 5, bottom: 10);
    const padding = const EdgeInsets.symmetric(horizontal: 9);

    return Container(
      width: width,
      margin: margin,
      padding: padding,
      child: ToggleableContainer(
        isToggled: isSelected,
        toggledColor: theme.accentColor,
        onTap: _feedbackThenTriggerOnTap,
        child: _buildCardTexts(isSelected, weekDay, monthDay, theme.textTheme),
      ),
    );
  }

  Widget _buildCardTexts(bool isSelected, String weekDay, String monthDay, TextTheme textTheme) {
    final textColor = isSelected ? Colors.white : Colors.black87;

    final weekDayStyle = textTheme.bodyText1.copyWith(
      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
      color: textColor,
    );
    final monthDayStyle = textTheme.headline5.copyWith(
      fontWeight: isSelected ? FontWeight.w800 : FontWeight.w700,
      color: textColor,
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
