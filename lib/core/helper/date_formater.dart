import 'package:intl/intl.dart';

class DateFormater {
  static String formater(d, ln) {
    DateTime dateTime = DateTime.parse(d);

    final date = DateFormat('dd MMMM yyyy', ln).format(dateTime);
    return date;
  }
}
