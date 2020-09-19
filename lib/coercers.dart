// all the server's dateTimes are in UTC, how do we work with them?

// when we get DateTimes from the server we parse them and run `toLocal`, to make sure they use the current user's timezone
DateTime fromGraphQLDateTimeToDartDateTime(String dateTime) => DateTime.parse(dateTime).toLocal();
// and before we send any DateTimes to the server we convert them to UTC and then to an ISO8601 string
String fromDartDateTimeToGraphQLDateTime(DateTime dateTime) => dateTime.toUtc().toIso8601String();
