import 'package:tuple/tuple.dart';
import 'package:flutter/material.dart';
import 'package:luftcare_flutter_app/models/graphql/api.graphql.dart';

class QuestionnaireResponse {
  static bool hasAllAnswers(QuestionnaireResponseInput response) {
    final answers = response.questionAnswers;
    return answers.every((answer) => answer != null);
  }

  static String getSelectedChoiceId(QuestionnaireResponseInput response, String questionId) {
    final answers = response.questionAnswers;
    final questionAnswer = answers.firstWhere(
      (answer) => answer?.questionId == questionId,
      orElse: () => null,
    );
    return questionAnswer?.choiceId;
  }

  static QuestionnaireResponseInput getUpdatedResponseWithAnswer({
    @required QuestionnaireResponseInput response,
    @required int questionPresentationOrder,
    @required String questionId,
    @required String choiceId,
  }) {
    final index = questionPresentationOrder - 1;
    final updatedAnswers = response.questionAnswers ?? [];
    final answer = QuestionnaireResponseAnswerInput(questionId: questionId, choiceId: choiceId);
    updatedAnswers[index] = answer;

    response.questionAnswers = updatedAnswers;
    return response;
  }

  static List<Tuple2<String, String>> getQuestionsAndAnswersList({
    @required Questionnaire$Query$Questionnaire questionnaire,
    @required QuestionnaireResponseInput response,
  }) {
    final questions = questionnaire.questions ?? [];
    final answers = response.questionAnswers ?? [];
    return questions.map((question) {
      final choices = question.possibleChoices ?? [];
      final questionId = question.id;
      final questionText = "${question.presentationOrder}. ${question.text}";
      final questionAnswer = answers.firstWhere(
        (answer) => answer.questionId == questionId,
        orElse: () => null,
      );

      if (questionAnswer == null) return Tuple2(questionText, 'Resposta não encontrada');

      if ((questionAnswer.writtenText ?? '').isNotEmpty)
        return Tuple2(questionText, questionAnswer.writtenText);

      final selectedChoice = choices.firstWhere((choice) => choice.id == questionAnswer.choiceId);
      final answerText = selectedChoice.text;

      return Tuple2(questionText, answerText);
    }).toList();
  }

  static List<Tuple2<String, String>> getResponseSummary({
    @required Responses$Query$QuestionnaireResponses$Results response,
  }) {
    final answers = response.questionAnswers ?? [];
    return answers.map((answer) {
      final selectedChoiceText = answer?.selectedChoice?.text;
      final writtenText = answer?.writtenText;
      final answerText = writtenText == null ? selectedChoiceText : writtenText;
      return Tuple2(answer.question.text, answerText);
    }).toList();
  }
}
