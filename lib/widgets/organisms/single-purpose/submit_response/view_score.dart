import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:luftcare_flutter_app/helpers/score_colors.dart';
import 'package:luftcare_flutter_app/providers/auth_provider.dart';
import 'package:luftcare_flutter_app/models/graphql/api.graphql.dart';

class ViewScore extends StatefulWidget {
  const ViewScore({@required this.score, Key key}) : super(key: key);

  final CreateResponse$Mutation$CreateSymptomQuestionnaireResponse$Score score;

  @override
  _ViewScoreState createState() => _ViewScoreState();
}

class _ViewScoreState extends State<ViewScore> {
  bool _isScoreVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => setState(() {
        _isScoreVisible = true;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    const padding = 20.0;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final scoreColor = getValueContainerColor(widget.score.color);
    final authProvider = Provider.of<Auth>(context, listen: false);
    final goToHomeScreen = () => authProvider.pushToLoggedInHome(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(padding),
            child: ListView(
              reverse: true,
              padding: const EdgeInsets.only(bottom: 20),
              children: [
                AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: _isScoreVisible ? 1 : 0,
                  child: Container(
                    constraints: BoxConstraints(maxWidth: screenWidth - (padding * 3)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text('Sua pontuação foi:', style: textTheme.headline6),
                        ),
                        _buildScoreValue(scoreColor),
                        _buildScoreTitle(textTheme),
                        _buildScoreDescription(textTheme),
                      ],
                    ),
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
    if (!_isScoreVisible) return Colors.white;
    return ScoreColors.getColorFromEnum(scoreColor);
  }

  Curve getValueContainerCurve(SymptomQuestionnaireScoreRangeColor scoreColor) {
    switch (scoreColor) {
      case SymptomQuestionnaireScoreRangeColor.green:
      case SymptomQuestionnaireScoreRangeColor.greenYellow:
        return Curves.easeOutBack;
      case SymptomQuestionnaireScoreRangeColor.yellow:
      case SymptomQuestionnaireScoreRangeColor.orange:
      case SymptomQuestionnaireScoreRangeColor.red:
      default:
        return Curves.easeOutCubic;
    }
  }

  Widget _buildScoreValue(Color color) => AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: getValueContainerCurve(widget.score.color),
        width: _isScoreVisible ? 120 : 0,
        height: _isScoreVisible ? 120 : 0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              offset: Offset.fromDirection(90, 3),
              color: color.withOpacity(0.4),
            ),
          ],
        ),
        child: Align(
          alignment: Alignment.center,
          child: FittedBox(
            child: Text(
              widget.score.value.toString(),
              style: TextStyle(fontSize: 72, fontWeight: FontWeight.w400, color: Colors.white),
            ),
          ),
        ),
      );

  Widget _buildScoreTitle(TextTheme textTheme) => Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 0, 5),
        child: Text(
          widget.score.title,
          textAlign: TextAlign.left,
          style: textTheme.headline3,
        ),
      );

  Widget _buildScoreDescription(TextTheme textTheme) => Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          widget.score.description,
          softWrap: true,
          textAlign: TextAlign.left,
          style: textTheme.headline5,
        ),
      );
}
