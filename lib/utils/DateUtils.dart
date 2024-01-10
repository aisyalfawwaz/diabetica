import 'package:intl/intl.dart';

class DateUtils {
  static String formatDate(DateTime date, {String format = 'yyyy-MM-dd'}) {
    return DateFormat(format).format(date);
  }
}
