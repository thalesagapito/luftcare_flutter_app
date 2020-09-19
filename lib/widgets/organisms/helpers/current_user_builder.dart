import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:luftcare_flutter_app/models/graphql/api.graphql.dart';
import 'package:luftcare_flutter_app/providers/current_user_provider.dart';
import 'package:luftcare_flutter_app/widgets/atoms/centered_loading_indicator.dart';

class CurrentUserBuilder extends StatelessWidget {
  const CurrentUserBuilder({
    this.whileNotFinished = const CenteredLoadingIndicator(),
    @required this.builder,
  });

  final Widget whileNotFinished;
  final Widget Function(CurrentUser$Query$CurrentUser currentUser) builder;

  @override
  Widget build(BuildContext context) {
    final client = GraphQLProvider.of(context).value;
    final currentUserProvider = Provider.of<CurrentUser>(context, listen: false);

    return FutureBuilder(
      future: currentUserProvider.getCurrentUser(client),
      builder: (BuildContext context, AsyncSnapshot<CurrentUser$Query$CurrentUser> snapshot) {
        final futureNotFinished = snapshot.connectionState != ConnectionState.done;
        if (futureNotFinished) return whileNotFinished;

        final currentUser = snapshot.data;
        return builder(currentUser);
      },
    );
  }
}
