import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:luftcare_flutter_app/models/graphql/api.graphql.dart';
import 'package:luftcare_flutter_app/providers/auth_provider.dart';

class ViewScore extends StatelessWidget {
  const ViewScore({@required this.score, Key key}) : super(key: key);

  final CreateResponse$Mutation$CreateSymptomQuestionnaireResponse$Score score;

  @override
  Widget build(BuildContext context) {
    const padding = 20.0;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final authProvider = Provider.of<Auth>(context, listen: false);
    final goToHomeScreen = () => authProvider.pushToLoggedInHome(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(padding),
            child: Row(
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: screenWidth - (padding * 3)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildScoreValue(),
                      _buildScoreTitle(textTheme),
                      _buildScoreDescription(textTheme),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: RaisedButton(
            child: Text('Ok, retornar a página inicial'),
            onPressed: goToHomeScreen,
            highlightElevation: 1,
            elevation: 0,
          ),
        ),
      ],
    );
  }

  Color getValueContainerColor(SymptomQuestionnaireScoreRangeColor scoreColor) {
    switch (scoreColor) {
      case SymptomQuestionnaireScoreRangeColor.green:
        return Colors.green[500];
      case SymptomQuestionnaireScoreRangeColor.greenYellow:
        return Colors.lightGreen[400];
      case SymptomQuestionnaireScoreRangeColor.yellow:
        return Colors.amber[200];
      case SymptomQuestionnaireScoreRangeColor.orange:
        return Colors.orange[400];
      case SymptomQuestionnaireScoreRangeColor.red:
      default:
        return Colors.red[400];
    }
  }

  Widget _buildScoreValue() => Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: getValueContainerColor(score.color),
        ),
        child: Align(
          alignment: Alignment.center,
          child: FittedBox(
            child: Text(
              score.value.toString(),
              style: TextStyle(fontSize: 72, fontWeight: FontWeight.w400, color: Colors.white),
            ),
          ),
        ),
      );

  Widget _buildScoreTitle(TextTheme textTheme) => Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 0, 5),
        child: Text(
          score.title,
          textAlign: TextAlign.left,
          style: textTheme.headline3,
        ),
      );

  Widget _buildScoreDescription(TextTheme textTheme) => Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          score.description,
          softWrap: true,
          textAlign: TextAlign.left,
          style: textTheme.headline5,
        ),
      );
}
