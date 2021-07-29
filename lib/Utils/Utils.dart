import 'package:intl/intl.dart';

class Utils {
  static String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }

  static String formatDateTime(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd H:mm');
    return formatter.format(date);
  }

  static String formatTime(DateTime date) {
    final DateFormat formatter = DateFormat('H:mm');
    return formatter.format(date);
  }
}