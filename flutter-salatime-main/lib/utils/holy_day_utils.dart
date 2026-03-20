import 'package:hijri/hijri_calendar.dart';
import '../utils/islamic_holy_days.dart';
import '../models/holy_day.dart';

class HolyDayUtils {
  static HolyDay? getHolyDay(HijriCalendar hijri) {
    for (final day in IslamicHolyDays.days) {
      if (day.hijriMonth == hijri.hMonth &&
          day.hijriDay == hijri.hDay) {
        return day;
      }
    }
    return null;
  }
}
