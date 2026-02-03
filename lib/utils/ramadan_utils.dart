import 'package:hijri/hijri_calendar.dart';

class RamadanUtils {
  // static bool isRamadanToday() {
  //   final hijri = HijriCalendar.now();
  //   return hijri.hMonth == 9;
  // }
  //   // 🧪 FORCE Ramadan for testing
static bool isRamadanToday() => true;
static int remainingRamadanDays() {
  final today = HijriCalendar.now();

  if (!isRamadanToday()) return 0;

  const int ramadanMonth = 9;
  const int ramadanDays = 30; // safe upper bound

  final remaining = ramadanDays - today.hDay;

  // ✅ Never return 0
  return remaining < 1 ? 1 : remaining;
}

////////
  //   // 🧪 FORCE Ramadan for testing
  //static bool isRamadanToday() => true;


  //////
  // static DateTime suhoorTime(DateTime fajrTime) {
  //   return fajrTime.subtract(const Duration(minutes: 30));
  // }
///for tesing remove belong code after test and uncomment above codes
static DateTime suhoorTime(DateTime fajrTime) {
  return fajrTime.subtract(const Duration(minutes: 30));
}

  static DateTime iftarTime(DateTime maghribTime) {
    return maghribTime;
  }

}

