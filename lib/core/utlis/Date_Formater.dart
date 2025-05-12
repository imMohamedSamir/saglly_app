import 'package:intl/intl.dart';

class DateFormater {
  static String fromatTime({required String? value}) {
    if (value == null || value == "") {
      return '';
    }
    DateTime dateTime = DateTime.tryParse(value) ?? DateTime.now();
    String formattedDate = DateFormat('h:mm a', 'ar').format(dateTime);
    return formattedDate;
  }

  static String fromatDate({required String? value}) {
    if (value == null || value == "") {
      return '';
    }
    DateTime dateTime = DateTime.tryParse(value) ?? DateTime.now();

    String formattedDate = DateFormat('EEEE, d MMMM, y').format(dateTime);
    return formattedDate;
  }
  // static String formatTimeAgo({required String? value}) {
  //   if (value == null || value.isEmpty) {
  //     return '';
  //   }

  //   DateTime dateTime = DateTime.tryParse(value) ?? DateTime.now();
  //   return timeago.format(dateTime);
  // }
}
