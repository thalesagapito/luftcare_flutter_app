import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luftcare_flutter_app/widgets/atoms/controls/previous_and_next_buttons.dart';
import 'package:luftcare_flutter_app/widgets/atoms/toggleable_container.dart';
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
    final theme = Theme.of(context);
    final headerColor = theme.primaryColor.withOpacity(0.8);
    final questionnaireId = _getQuestionnaireIdFromArgs(context);

    return ChangeNotifierProvider(
      create: (ctx) => SymptomQuestionnaire(),
      child: Scaffold(
        // bottomNavigationBar: BottomNavbar(
        //   selectedIndex: _selectedNavbarIndex,
        //   onTap: _onNavbarItemTapped,
        // ),
        body: Column(
          children: [
            _PageHeader(),
            _Questionnaire(id: questionnaireId),
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
    final headerColor = theme.primaryColor.withOpacity(0.8);
    final questionnaireProvider = Provider.of<SymptomQuestionnaire>(context);
    final questionnaire = questionnaireProvider.questionnaire;
    final questionnaireName = questionnaire?.nameForPresentation;

    return Container(
      color: headerColor,
      width: double.infinity,
      child: SafeArea(
        child: Column(
          children: [
            _buildTitle(questionnaireName, theme),
            SizedBox(height: 10),
            // _buildQuestionButtons(),
          ],
        ),
        bottom: false,
      ),
    );
  }

  Widget _buildQuestionButtons() {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        width: constraints.maxWidth,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ToggleableContainer(
                child: Text('aaaa\nawdahgwada'),
                onTap: () {},
              ),
              Placeholder(fallbackWidth: 300),
              Placeholder(fallbackWidth: 300),
              Placeholder(fallbackWidth: 300),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(String questionnaireName, ThemeData theme) => Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
        child: Text(
          questionnaireName ?? '',
          textAlign: TextAlign.center,
          style: theme.textTheme.headline5.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
}

class _Questionnaire extends StatefulWidget {
  final String id;
  const _Questionnaire({Key key, @required this.id}) : super(key: key);

  @override
  __QuestionnaireState createState() => __QuestionnaireState();
}

class __QuestionnaireState extends State<_Questionnaire> {
  static const _defaultDuration = const Duration(milliseconds: 500);
  static const _defaultCurve = Curves.easeOutCubic;

  var _pageController = PageController();
  var _currentPage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final questionnaireProvider = Provider.of<SymptomQuestionnaire>(context);
    if (!questionnaireProvider.alreadyQueried) {
      questionnaireProvider.getQuestionnaire(context, widget.id);
    }
  }

  void _incrementCurrentPage() => setState(() => _currentPage += 1);
  void _goToNextPage() {
    _incrementCurrentPage();
    _pageController.nextPage(
      duration: _defaultDuration,
      curve: _defaultCurve,
    );
  }

  void _decrementCurrentPage() => setState(() => _currentPage -= 1);
  void _goToPreviousPage() {
    _decrementCurrentPage();
    _pageController.previousPage(
      duration: _defaultDuration,
      curve: _defaultCurve,
    );
  }

  @override
  Widget build(BuildContext context) {
    final questionnaireProvider = Provider.of<SymptomQuestionnaire>(context);
    final alreadyQueried = questionnaireProvider.alreadyQueried;
    final questionnaire = questionnaireProvider.questionnaire;
    final questions = questionnaire?.questions ?? [];

    final isLoading = alreadyQueried && questionnaire == null;

    final hasPreviousPage = _currentPage > 0;
    final goToPreviousPage = hasPreviousPage ? _goToPreviousPage : null;

    final hasNextPage = _currentPage < (questions.length - 1);
    final goToNextPage = hasNextPage ? _goToNextPage : null;

    return Expanded(
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                children: questions
                    .map(
                      (q) => Container(
                        child: Text(q.text),
                      ),
                    )
                    .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: PreviousAndNextButtons(
                onPreviousTap: goToPreviousPage,
                onNextTap: goToNextPage,
              ),
            )
            // Container(
            //   child: Text(questionnaire?.toJson()?.toString() ?? ''),
            // ),
          ],
        ),
      ),
    );
  }
}
