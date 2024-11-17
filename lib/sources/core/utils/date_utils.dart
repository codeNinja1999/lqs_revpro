import 'package:lgs_revpro/sources/config/config.dart';

class DateFormatUtils {
  static String convertDateTimeDisplay(String? date) {
    if (date == "") {
      return "";
    }
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss');
    // final DateFormat serverFormater = DateFormat('dd-MM-yyyy');
    final DateFormat serverFormater = DateFormat('yyyy-MM-dd');
    final DateTime displayDate = displayFormater.parse(date!);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }
}
