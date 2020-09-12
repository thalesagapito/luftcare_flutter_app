import 'package:tuple/tuple.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:luftcare_flutter_app/helpers/error_handlers.dart';
import 'package:luftcare_flutter_app/models/graphql/api.graphql.dart';
import 'package:luftcare_flutter_app/providers/current_user_provider.dart';
import 'package:luftcare_flutter_app/providers/symptom_questionnaire_provider.dart';
import 'package:luftcare_flutter_app/widgets/atoms/centered_loading_indicator.dart';
import 'package:luftcare_flutter_app/providers/symptom_questionnaire_response_provider.dart';
import 'package:luftcare_flutter_app/widgets/organisms/single-purpose/respond_questionnaire/respond_questionnaire_header.dart';
import 'package:luftcare_flutter_app/widgets/organisms/single-purpose/respond_questionnaire/respond_questionnaire_questions.dart';

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

  void _onDiscardResponse(BuildContext ctx) => Navigator.pop(ctx);

  @override
  Widget build(BuildContext context) {
    final questionnaireProvider = Provider.of<SymptomQuestionnaire>(context);
    final currentUserProvider = Provider.of<CurrentUser>(context);

    return GraphQLConsumer(
      builder: (client) {
        final getQuestionnaire = questionnaireProvider.getQuestionnaire(client, id: widget.id);
        final getCurrentUser = currentUserProvider.getAndUpdateUser(client);

        final questionnaireAndCurrentUser = Future.wait(
          [getQuestionnaire, getCurrentUser],
        ).then(
          (data) => Tuple2<Questionnaire$Query$SymptomQuestionnaire,
              CurrentUser$Query$CurrentUser>.fromList(data),
        );

        return FutureBuilder(
          future: questionnaireAndCurrentUser,
          builder: (
            BuildContext context,
            AsyncSnapshot<
                    Tuple2<Questionnaire$Query$SymptomQuestionnaire, CurrentUser$Query$CurrentUser>>
                snapshot,
          ) {
            if (snapshot.hasError) return ErrorScreen(errorDescription: snapshot.error.toString());
            if (!snapshot.hasData) return CenteredLoadingIndicator();

            final results = snapshot.data;
            final questionnaire = results.item1;
            final currentUser = results.item2;

            final hasErrors = questionnaire == null || currentUser == null;
            if (hasErrors) return ErrorScreen();

            final questions = questionnaire.questions ?? [];
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
                  RespondQuestionnaireQuestions(
                    goToPage: _goToPage,
                    goToNextPage: goToNextPage,
                    goToPrevPage: goToPrevPage,
                    currentPage: _currentPage,
                    pageController: _pageController,
                    questionnaire: questionnaire,
                    userId: currentUser.id,
                    isChangingPages: _isChangingPages,
                    onPageAnimationEnd: _onPageAnimationEnd,
                    onDiscardResponse: () => _onDiscardResponse(context),
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
