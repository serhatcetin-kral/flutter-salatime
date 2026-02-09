import '../models/holy_day.dart';

class IslamicHolyDays {
  static const List<HolyDay> days = [
    // 🌙 Ramadan
    HolyDay(
      hijriMonth: 9,
      hijriDay: 27,
      name: "Laylat al-Qadr",
      description: "The Night of Power",
      isNight: true,
    ),

    // 🕋 Shaban
    HolyDay(
      hijriMonth: 8,
      hijriDay: 15,
      name: "Laylat al-Bara’ah",
      description: "Night of Forgiveness",
      isNight: true,
    ),

    // 🕌 Rajab
    HolyDay(
      hijriMonth: 7,
      hijriDay: 27,
      name: "Isra and Mi‘raj",
      description: "The Night Journey",
      isNight: true,
    ),

    // 🌄 Muharram
    HolyDay(
      hijriMonth: 1,
      hijriDay: 10,
      name: "Ashura",
      description: "Day of Ashura",
    ),

    // 🎉 Eid al-Fitr
    HolyDay(
      hijriMonth: 10,
      hijriDay: 1,
      name: "Eid al-Fitr",
      description: "Festival of Breaking the Fast",
    ),

    // 🎉 Eid al-Adha
    HolyDay(
      hijriMonth: 12,
      hijriDay: 10,
      name: "Eid al-Adha",
      description: "Festival of Sacrifice",
    ),

    // 🌄 Arafah
    HolyDay(
      hijriMonth: 12,
      hijriDay: 9,
      name: "Day of Arafah",
      description: "The Day of Arafah",
    ),
  ];
}
