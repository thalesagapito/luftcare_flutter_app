import 'package:flutter/material.dart';
import 'package:luftcare_flutter_app/models/graphql/api.graphql.dart';

class SymptomQuestionnaireResponse {
  String getSelectedChoiceId(SymptomQuestionnaireResponseInput response, String questionId) {
    final answers = response.questionAnswers;
    final questionAnswer = answers.firstWhere(
      (answer) => answer?.questionId == questionId,
      orElse: () => null,
    );
    return questionAnswer?.choiceId;
  }

  SymptomQuestionnaireResponseInput getUpdatedResponseWithAnswer({
    @required SymptomQuestionnaireResponseInput response,
    @required int questionPresentationOrder,
    @required String questionId,
    @required String choiceId,
  }) {
    final index = questionPresentationOrder - 1;
    final updatedAnswers = response.questionAnswers ?? [];
    final answer =
        SymptomQuestionnaireResponseAnswerInput(questionId: questionId, choiceId: choiceId);
    updatedAnswers[index] = answer;

    response.questionAnswers = updatedAnswers;
    return response;
  }
}
