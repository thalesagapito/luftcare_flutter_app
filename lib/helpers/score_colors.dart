import 'package:flutter/material.dart';
import 'package:luftcare_flutter_app/models/graphql/api.graphql.dart';

class ScoreColors {
  static Color getColorFromEnum(SymptomQuestionnaireScoreRangeColor color) {
    switch (color) {
      case SymptomQuestionnaireScoreRangeColor.green:
        return Colors.green[500];
      case SymptomQuestionnaireScoreRangeColor.greenYellow:
        return Colors.lime[500];
      case SymptomQuestionnaireScoreRangeColor.yellow:
        return Colors.amber[400];
      case SymptomQuestionnaireScoreRangeColor.orange:
        return Colors.orange[400];
      case SymptomQuestionnaireScoreRangeColor.red:
      default:
        return Colors.red[400];
    }
  }
}
