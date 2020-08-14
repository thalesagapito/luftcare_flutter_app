import 'package:intl/intl.dart';

final dateTimeFormatter = DateFormat('yyyy-MM-ddTHH:mm:ssZ');

DateTime fromGraphQLDateTimeToDartDateTime(String dateTime) =>
    DateTime.parse(dateTime);
String fromDartDateTimeToGraphQLDateTime(DateTime dateTime) =>
    dateTimeFormatter.format(dateTime);
