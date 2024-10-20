import 'package:intl/intl.dart';
import 'package:hijri/hijri_calendar.dart';

class TimeInfo {
  // Get current local time
  static String getCurrentTime() {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('hh:mm a', 'en')
        .format(now); // 'en' locale to enforce Arabic numbers
    return (formattedTime);
  }

  // Get current time in Mecca (GMT+3)
  static String getMeccaTime() {
    DateTime meccaTime = DateTime.now().toUtc().add(const Duration(hours: 3));
    String formattedTime =
        DateFormat('hh:mm a', 'en').format(meccaTime); // 'en' locale
    return (formattedTime);
  }

  // Get current Gregorian date based on  time now
  static String getNowGregorianDate() {
    DateTime currentTime = DateTime.now();
    String formattedDate =
        DateFormat('dd/MM/yyyy', 'en').format(currentTime); // 'en' locale
    return (formattedDate);
  }

  // Get current Hijri date based on  time now
  static String getNowHijriDate() {
    DateTime currentTime = DateTime.now();
    HijriCalendar.setLocal("en");
    HijriCalendar hijri = HijriCalendar.fromDate(currentTime);
    String formattedHijriDate = hijri.toFormat("dd-MM-yyyy");
    return (formattedHijriDate);
  }

  // Get current Gregorian date based on Mecca time
  static String getMeccaGregorianDate() {
    DateTime meccaTime = DateTime.now().toUtc().add(const Duration(hours: 3));
    String formattedDate =
        DateFormat('dd/MM/yyyy', 'en').format(meccaTime); // 'en' locale
    return (formattedDate);
  }

  // Get current Hijri date based on Mecca time
  static String getMeccaHijriDate() {
    DateTime meccaTime = DateTime.now().toUtc().add(const Duration(hours: 3));
    HijriCalendar.setLocal("en");
    HijriCalendar hijri = HijriCalendar.fromDate(meccaTime);
    String formattedHijriDate = hijri.toFormat("dd-MM-yyyy");
    return (formattedHijriDate);
  }
}
