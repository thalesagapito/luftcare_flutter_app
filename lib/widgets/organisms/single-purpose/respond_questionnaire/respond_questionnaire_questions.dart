import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:luftcare_flutter_app/models/graphql/api.graphql.dart';
import 'package:luftcare_flutter_app/providers/symptom_questionnaire_response_provider.dart';
import 'package:luftcare_flutter_app/widgets/atoms/controls/previous_and_next_buttons.dart';
import 'package:luftcare_flutter_app/widgets/organisms/single-purpose/respond_questionnaire/respond_questionnaire_header.dart';
import 'package:luftcare_flutter_app/widgets/organisms/single-purpose/respond_questionnaire/respond_questionnaire_question.dart';

class RespondQuestionnaireQuestions extends StatefulWidget {
  RespondQuestionnaireQuestions({
    Key key,
    @required this.questionnaire,
    @required this.pageController,
    @required this.goToNextPage,
    @required this.goToPrevPage,
    @required this.goToPage,
    @required this.onPageAnimationEnd,
    @required this.onDiscardResponse,
    @required this.userId,
    @required this.currentPage,
    @required this.isChangingPages,
  }) : super(key: key);

  final Questionnaire$Query$SymptomQuestionnaire questionnaire;
  final PageController pageController;
  final void Function() goToNextPage;
  final void Function() goToPrevPage;
  final void Function(int page, {bool triggerIsChangingPages}) goToPage;
  final void Function() onPageAnimationEnd;
  final void Function() onDiscardResponse;
  final String userId;
  final int currentPage;
  final bool isChangingPages;

  @override
  _RespondQuestionnaireQuestionsState createState() => _RespondQuestionnaireQuestionsState();
}

class _RespondQuestionnaireQuestionsState extends State<RespondQuestionnaireQuestions> {
  SymptomQuestionnaireResponseInput _response;

  @override
  void initState() {
    super.initState();
    final questionCount = widget.questionnaire.questions.length;
    _response = SymptomQuestionnaireResponseInput(
      userId: widget.userId,
      questionAnswers: List.filled(questionCount, null),
      responseDate: DateTime.now(),
      questionnaireId: widget.questionnaire.id,
      questionnaireVersion: widget.questionnaire.version,
    );
  }

  Widget _buildQuestionWidget({
    @required Questionnaire$Query$SymptomQuestionnaire$Questions question,
    @required SymptomQuestionnaireResponse responseProvider,
    @required int questionCount,
  }) {
    final updateResponse = (updatedResponse) => setState(() => _response = updatedResponse);
    final selectedChoiceId = responseProvider.getSelectedChoiceId(_response, question.id);
    final isNotLastQuestion = question.presentationOrder < questionCount;
    final shouldGoToNextPage = selectedChoiceId == null && isNotLastQuestion;

    return RespondQuestionnaireQuestion(
        question: question,
        key: Key(question.id),
        selectedChoiceId: selectedChoiceId,
        onChoiceSelected: (choiceId) {
          final updatedResponse = responseProvider.getUpdatedResponseWithAnswer(
            questionPresentationOrder: question.presentationOrder,
            questionId: question.id,
            response: _response,
            choiceId: choiceId,
          );
          updateResponse(updatedResponse);
          if (shouldGoToNextPage) widget.goToNextPage();
        });
  }

  @override
  Widget build(BuildContext context) {
    final responseProvider = Provider.of<SymptomQuestionnaireResponse>(context, listen: false);
    final questions = widget.questionnaire?.questions ?? [];
    final questionCount = questions.length;
    final isFirstQuestion = widget.currentPage == 0;
    final questionsWidgets = questions
        .map((question) => _buildQuestionWidget(
              responseProvider: responseProvider,
              questionCount: questionCount,
              question: question,
            ))
        .toList();

    final headerColor = RespondQuestionnaireHeader.getHeaderColor(context);
    final underlayDecoration = BoxDecoration(
      color: headerColor,
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
    );
    final underlay = Container(decoration: underlayDecoration, height: 30);

    return Expanded(
      child: SafeArea(
        top: false,
        child: Stack(
          children: [
            underlay,
            Column(
              children: [
                Expanded(
                  child: PageView(
                    physics: widget.isChangingPages
                        ? NeverScrollableScrollPhysics()
                        : BouncingScrollPhysics(),
                    onPageChanged: (pageChangedTo) {
                      final isChangingPages = widget.isChangingPages;
                      final currentPageFromParent = widget.currentPage;
                      final hasArrivedAtPageFromParent = pageChangedTo == currentPageFromParent;
                      if (isChangingPages) {
                        if (hasArrivedAtPageFromParent) widget.onPageAnimationEnd();
                        return;
                      }
                      widget.goToPage(pageChangedTo, triggerIsChangingPages: false);
                    },
                    controller: widget.pageController,
                    children: questionsWidgets,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: PreviousAndNextButtons(
                    onPreviousTap: isFirstQuestion ? widget.onDiscardResponse : widget.goToPrevPage,
                    prevText: isFirstQuestion ? Text('Cancelar') : Text('Anterior'),
                    onNextTap: widget.goToNextPage,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
