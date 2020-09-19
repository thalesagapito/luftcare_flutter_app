import 'package:flutter/material.dart';
import 'package:luftcare_flutter_app/models/graphql/api.graphql.dart';

class ScoreColors {
  static Color getColorFromEnum(QuestionnaireScoreRangeColor color) {
    switch (color) {
      case QuestionnaireScoreRangeColor.green:
        return Colors.green[500];
      case QuestionnaireScoreRangeColor.greenYellow:
        return Colors.lime[500];
      case QuestionnaireScoreRangeColor.yellow:
        return Colors.amber[400];
      case QuestionnaireScoreRangeColor.orange:
        return Colors.orange[400];
      case QuestionnaireScoreRangeColor.red:
      default:
        return Colors.red[400];
    }
  }
}
