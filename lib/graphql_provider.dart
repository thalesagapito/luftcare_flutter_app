import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:luftcare_flutter_app/providers/auth_provider.dart';
import 'package:luftcare_flutter_app/screens/guest/guest_welcome_screen.dart';
import 'package:luftcare_flutter_app/secure_storage.dart';

final OptimisticCache cache = OptimisticCache(dataIdFromObject: uuidFromObject);

String uuidFromObject(Object object) {
  if (object is Map<String, Object>) {
    final String typeName = object['__typename'] as String;
    final String id = object['id'].toString();
    if (typeName != null && id != null) {
      return <String>[typeName, id].join('/');
    }
  }
  return null;
}

Future<String> getToken() async {
  final token = await SecureStorage().read(SecureStorageKey.API_AUTH_TOKEN);
  return 'Bearer $token';
}

Future<void> errorHandler(ErrorResponse error, GlobalKey<NavigatorState> navigatorKey) async {
  final graphqlErrors = error?.exception?.graphqlErrors ?? [];

  if (graphqlErrors.isEmpty) return;

  final firstErrorMessage = graphqlErrors[0].message;

  if (firstErrorMessage.contains("Access denied")) {
    final predicate = (_) => false;
    final routeName = GuestWelcomeScreen.RouteName;
    await navigatorKey.currentState.pushNamedAndRemoveUntil(routeName, predicate);
  }
}

ValueNotifier<GraphQLClient> clientFor({
  @required String uri,
  @required GlobalKey<NavigatorState> navigatorKey,
}) {
  final HttpLink httpLink = HttpLink(uri: uri);
  final AuthLink authLink = AuthLink(getToken: getToken);
  final ErrorLink errorLink = ErrorLink(errorHandler: (error) => errorHandler(error, navigatorKey));

  final link = Link.from([authLink, errorLink, httpLink]);

  return ValueNotifier<GraphQLClient>(
    GraphQLClient(
      cache: cache,
      link: link,
    ),
  );
}

class GraphqlProvider extends StatelessWidget {
  GraphqlProvider({
    @required this.child,
    @required String uri,
    @required GlobalKey<NavigatorState> navigatorKey,
  }) : client = clientFor(uri: uri, navigatorKey: navigatorKey);

  final Widget child;
  final ValueNotifier<GraphQLClient> client;

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(client: client, child: child);
  }
}
