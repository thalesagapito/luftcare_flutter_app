import 'package:intl/intl.dart';

// The Z in the end means timezone
// even though intl docs say it should work, it's not yet implemented
// final dateTimeFormatter = DateFormat('yyyy-MM-ddTHH:mm:ssZ');

// for now, we won't include a timezone
final dateTimeFormatter = DateFormat('yyyy-MM-ddTHH:mm:ss');

DateTime fromGraphQLDateTimeToDartDateTime(String dateTime) => DateTime.parse(dateTime);
String fromDartDateTimeToGraphQLDateTime(DateTime dateTime) => dateTimeFormatter.format(dateTime);
