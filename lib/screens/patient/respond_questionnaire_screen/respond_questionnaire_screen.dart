import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luftcare_flutter_app/widgets/atoms/centered_loading_indicator.dart';
import 'package:luftcare_flutter_app/widgets/atoms/controls/previous_and_next_buttons.dart';
import 'package:luftcare_flutter_app/widgets/atoms/toggleable_container.dart';
import 'package:luftcare_flutter_app/widgets/organisms/single-purpose/respond_questionnaire/RespondQuestionnaireHeader.dart';
import 'package:provider/provider.dart';
import 'package:luftcare_flutter_app/providers/symptom_questionnaire_provider.dart';

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

    return ChangeNotifierProvider(
      create: (ctx) => SymptomQuestionnaire(),
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
  var _pageController = PageController();

  void _goToPage(int page) {
    const curve = Curves.easeOutCubic;
    const duration = Duration(milliseconds: 500);

    setState(() => _currentPage = page);
    _pageController.animateToPage(page, duration: duration, curve: curve);
  }

  void _goToPrevPage() => _goToPage(_currentPage - 1);
  void _goToNextPage() => _goToPage(_currentPage + 1);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final questionnaireProvider = Provider.of<SymptomQuestionnaire>(context);
    if (!questionnaireProvider.finishedQuery) {
      questionnaireProvider.getQuestionnaire(context, widget.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    final questionnaireProvider = Provider.of<SymptomQuestionnaire>(context);
    final finishedQuery = questionnaireProvider.finishedQuery;
    final questionnaire = questionnaireProvider.questionnaire;
    final isLoading = !finishedQuery && questionnaire == null;
    final questions = questionnaire?.questions ?? [];
    final questionCount = questions.length;

    final hasPreviousPage = _currentPage > 0;
    final goToPrevPage = hasPreviousPage ? _goToPrevPage : null;

    final hasNextPage = _currentPage < questionCount - 1;
    final goToNextPage = hasNextPage ? _goToNextPage : null;

    return Column(
      children: [
        if (isLoading) Expanded(child: CenteredLoadingIndicator()),
        if (!isLoading) ...[
          RespondQuestionnaireHeader(
            goToPage: _goToPage,
            currentPage: _currentPage,
            questionCount: questionCount,
            // questionCount: questionCount + 20,
          ),
          _Questionnaire(
            currentPage: _currentPage,
            goToNextPage: goToNextPage,
            goToPrevPage: goToPrevPage,
            pageController: _pageController,
          ),
        ],
      ],
    );
  }
}

class _Questionnaire extends StatelessWidget {
  _Questionnaire({
    Key key,
    @required this.currentPage,
    @required this.pageController,
    @required this.goToNextPage,
    @required this.goToPrevPage,
  }) : super(key: key);

  final PageController pageController;
  final int currentPage;
  final Function goToNextPage;
  final Function goToPrevPage;

  @override
  Widget build(BuildContext context) {
    final questionnaireProvider = Provider.of<SymptomQuestionnaire>(context);
    final questionnaire = questionnaireProvider.questionnaire;
    final questions = questionnaire?.questions ?? [];

    return Expanded(
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                children: questions
                    .map(
                      (q) => Container(
                        child: Text(
                          q.text,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: PreviousAndNextButtons(
                onPreviousTap: goToPrevPage,
                onNextTap: goToNextPage,
              ),
            )
          ],
        ),
      ),
    );
  }
}
