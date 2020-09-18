import 'package:intl/intl.dart';

// The Z in the end means timezone
// even though intl docs say it should work, it's not yet implemented
// final dateTimeFormatter = DateFormat('yyyy-MM-ddTHH:mm:ssZ');

// for now, we won't include a timezone
final dateTimeFormatter = DateFormat('yyyy-MM-ddTHH:mm:ss');
final localDateTime = DateTime.now();
final timeZoneOffset = localDateTime.timeZoneOffset;

// a workaround is to subtract the user's timezoneOffset from the datetimes that we get from the api
DateTime fromGraphQLDateTimeToDartDateTime(String dateTime) {
  final parsedDateTime = DateTime.parse(dateTime);
  final timeZoneAdjustedDateTime = parsedDateTime.subtract(timeZoneOffset);
  return timeZoneAdjustedDateTime;
}

String fromDartDateTimeToGraphQLDateTime(DateTime dateTime) {
  final timeZoneAdjustedDateTime = dateTime.add(timeZoneOffset);
  final formattedDateTime = dateTimeFormatter.format(timeZoneAdjustedDateTime);
  return formattedDateTime;
}
