import 'package:hijri/hijri_calendar.dart';

class HijriUtils {
  static String getTodayHijriDate({required String locale}) {
    final hijri = HijriCalendar.now();

    final day = hijri.hDay;
    final year = hijri.hYear;

    final monthName = _getMonthName(hijri.hMonth, locale);

    return "$day $monthName $year AH";
  }

  static String _getMonthName(int month, String locale) {
    switch (locale) {
      case 'tr':
        return _trMonths[month - 1];
      case 'ar':
        return _arMonths[month - 1];
      default:
        return _enMonths[month - 1];
    }
  }

  static const List<String> _enMonths = [
    "Muharram",
    "Safar",
    "Rabi al-Awwal",
    "Rabi al-Thani",
    "Jumada al-Awwal",
    "Jumada al-Thani",
    "Rajab",
    "Shaban",
    "Ramadan",
    "Shawwal",
    "Dhul Qadah",
    "Dhul Hijjah",
  ];

  static const List<String> _trMonths = [
    "Muharrem",
    "Safer",
    "Rebiülevvel",
    "Rebiülahir",
    "Cemaziyelevvel",
    "Cemaziyelahir",
    "Recep",
    "Şaban",
    "Ramazan",
    "Şevval",
    "Zilkade",
    "Zilhicce",
  ];

  static const List<String> _arMonths = [
    "محرم",
    "صفر",
    "ربيع الأول",
    "ربيع الآخر",
    "جمادى الأولى",
    "جمادى الآخرة",
    "رجب",
    "شعبان",
    "رمضان",
    "شوال",
    "ذو القعدة",
    "ذو الحجة",
  ];
}
