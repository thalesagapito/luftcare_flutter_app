import 'package:flutter/material.dart';
import 'package:luftcare_flutter_app/widgets/atoms/centered_loading_indicator.dart';
import 'package:luftcare_flutter_app/widgets/atoms/layout/rounded_list_tile_wrapper.dart';

class OverviewList extends StatelessWidget {
  const OverviewList({
    @required this.title,
    @required this.children,
    @required this.hasError,
    @required this.isLoading,
    @required this.errorText,
    @required this.emptyChildrenText,
  });

  final String title;
  final bool hasError;
  final bool isLoading;
  final String errorText;
  final String emptyChildrenText;
  final List<RoundedListTileWrapper> children;

  List<Widget> _getVisibleWidget() {
    if (isLoading) return [_Loading()];
    if (hasError) return [_Warning(text: errorText)];

    final isChildrenEmpty = (children ?? []).length == 0;

    if (isChildrenEmpty) return [_Warning(text: emptyChildrenText)];

    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Title(text: title),
        ..._getVisibleWidget(),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 50, 10),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          textAlign: TextAlign.left,
          style: theme.textTheme.headline4.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class _Warning extends StatelessWidget {
  const _Warning({this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(24, 10, 20, 25),
          child: Text(
            text,
            textAlign: TextAlign.left,
            style: textTheme.button.copyWith(color: Colors.grey[500]),
          ),
        ),
      ],
    );
  }
}

class _Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      child: CenteredLoadingIndicator(),
      padding: const EdgeInsets.symmetric(vertical: 20),
    );
  }
}
