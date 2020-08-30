import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:luftcare_flutter_app/helpers/error_handlers.dart';
import 'package:luftcare_flutter_app/providers/auth_provider.dart';
import 'package:luftcare_flutter_app/models/graphql/api.graphql.dart';
import 'package:luftcare_flutter_app/providers/symptom_questionnaire_provider.dart';
import 'package:luftcare_flutter_app/widgets/atoms/centered_loading_indicator.dart';
import 'package:luftcare_flutter_app/widgets/atoms/controls/previous_and_next_buttons.dart';
import 'package:luftcare_flutter_app/providers/symptom_questionnaire_response_provider.dart';
import 'package:luftcare_flutter_app/widgets/organisms/single-purpose/respond_questionnaire/RespondQuestionnaireHeader.dart';
import 'package:luftcare_flutter_app/widgets/organisms/single-purpose/respond_questionnaire/RespondQuestionnaireQuestion.dart';

class RespondQuestionnaireScreenArgs {
  final String questionnaireId;

  RespondQuestionnaireScreenArgs({this.questionnaireId});
}

class RespondQuestionnaireScreen extends StatelessWidget {
  static const RouteName = '/respond-questionnaire';

  const RespondQuestionnaireScreen({Key key}) : super(key: key);

  String _getQuestionnaireIdFromArgs(BuildContext context) {
    final route = ModalRoute.of(context);
    final RespondQuestionnaireScreenArgs routeArgs = route.settings.arguments;
    final questionnaireId = routeArgs.questionnaireId;

    if (questionnaireId == null) {
      Navigator.of(context).pop();
      throw new ArgumentError.notNull('questionnaireId');
    }

    return questionnaireId;
  }

  @override
  Widget build(BuildContext context) {
    final questionnaireId = _getQuestionnaireIdFromArgs(context);

    return MultiProvider(
      providers: [
        Provider<SymptomQuestionnaire>(
          create: (_) => SymptomQuestionnaire(),
        ),
        Provider<SymptomQuestionnaireResponse>(
          create: (_) => SymptomQuestionnaireResponse(),
        ),
      ],
      child: Scaffold(
        body: _RespondScreenBody(id: questionnaireId),
      ),
    );
  }
}

class _RespondScreenBody extends StatefulWidget {
  const _RespondScreenBody({@required this.id});

  final String id;

  @override
  __RespondScreenBodyState createState() => __RespondScreenBodyState();
}

class __RespondScreenBodyState extends State<_RespondScreenBody> {
  var _currentPage = 0;
  var _isChangingPages = false;
  var _pageController = PageController(viewportFraction: 0.9);

  void _goToPage(int page, {bool triggerIsChangingPages = true}) {
    const curve = Curves.easeOutQuart;
    const duration = Duration(milliseconds: 600);

    setState(() {
      _currentPage = page;
      _isChangingPages = triggerIsChangingPages;
    });
    _pageController.animateToPage(page, duration: duration, curve: curve);
  }

  void _goToPrevPage() => _goToPage(_currentPage - 1);
  void _goToNextPage() => _goToPage(_currentPage + 1);

  void _onPageAnimationEnd() => setState(() => _isChangingPages = false);

  @override
  Widget build(BuildContext context) {
    final questionnaireProvider = Provider.of<SymptomQuestionnaire>(context);

    return GraphQLConsumer(
      builder: (client) {
        final getQuestionnaire = questionnaireProvider.getQuestionnaire(
          client,
          id: widget.id,
        );

        return FutureBuilder(
          future: getQuestionnaire,
          initialData: QueryResult(loading: true, optimistic: false),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            final QueryResult result = snapshot.data;

            if (result.loading) return CenteredLoadingIndicator();
            if (result.hasException) return ErrorScreen();

            final questionnaire = questionnaireProvider.getQuestionnaireFromQueryResult(result);
            final questions = questionnaire?.questions ?? [];
            final questionCount = questions.length;
            final questionnaireName = questionnaire.nameForPresentation;

            final hasPreviousPage = _currentPage > 0;
            final goToPrevPage = hasPreviousPage ? _goToPrevPage : null;

            final hasNextPage = _currentPage < questionCount - 1;
            final goToNextPage = hasNextPage ? _goToNextPage : null;

            return WillPopScope(
              onWillPop: () async => false,
              child: Column(
                children: [
                  RespondQuestionnaireHeader(
                    goToPage: _goToPage,
                    currentPage: _currentPage,
                    questionCount: questionCount,
                    questionnaireName: questionnaireName,
                  ),
                  _Questionnaire(
                    goToPage: _goToPage,
                    goToNextPage: goToNextPage,
                    goToPrevPage: goToPrevPage,
                    currentPage: _currentPage,
                    pageController: _pageController,
                    questionnaire: questionnaire,
                    isChangingPages: _isChangingPages,
                    onPageAnimationEnd: _onPageAnimationEnd,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _Questionnaire extends StatefulWidget {
  _Questionnaire({
    Key key,
    @required this.pageController,
    @required this.goToNextPage,
    @required this.goToPrevPage,
    @required this.goToPage,
    @required this.currentPage,
    @required this.questionnaire,
    @required this.isChangingPages,
    @required this.onPageAnimationEnd,
  }) : super(key: key);

  final PageController pageController;
  final void Function() goToNextPage;
  final void Function() goToPrevPage;
  final void Function(int page, {bool triggerIsChangingPages}) goToPage;
  final int currentPage;
  final bool isChangingPages;
  final void Function() onPageAnimationEnd;
  final Questionnaire$Query$SymptomQuestionnaire questionnaire;

  @override
  __QuestionnaireState createState() => __QuestionnaireState();
}

class __QuestionnaireState extends State<_Questionnaire> {
  SymptomQuestionnaireResponseInput _response;

  @override
  void initState() {
    super.initState();
    final userId = Provider.of<Auth>(context, listen: false).userId;
    final questionCount = widget.questionnaire?.questions?.length ?? 0;
    _response = SymptomQuestionnaireResponseInput(
      userId: userId,
      questionAnswers: List.filled(questionCount, null),
      responseDate: DateTime.now(),
      questionnaireId: widget.questionnaire.id,
      questionnaireVersion: widget.questionnaire.version,
    );
  }

  @override
  Widget build(BuildContext context) {
    final responseProvider = Provider.of<SymptomQuestionnaireResponse>(context, listen: false);
    final updateResponse = (updatedResponse) => setState(() => _response = updatedResponse);

    final questions = widget.questionnaire?.questions ?? [];
    final questionCount = questions.length;
    final questionsWidgets = questions.map(
      (question) {
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
      },
    ).toList();
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
                    onPreviousTap: widget.goToPrevPage,
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
