import 'package:intl/intl.dart';

class RegistrationServices {
  // date parsing function
  static String? parseDateTime(DateTime date) {
    // to parse to jun 18 2023 type date format
    final dateFormatted = DateFormat.yMMMd().format(date);
    return "$dateFormatted ";
  }
}
