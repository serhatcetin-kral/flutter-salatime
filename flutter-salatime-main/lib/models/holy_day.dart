class HolyDay {
  final int hijriMonth;
  final int hijriDay;
  final String name;
  final String description;
  final bool isNight;
  final bool isEid;

  const HolyDay({
    required this.hijriMonth,
    required this.hijriDay,
    required this.name,
    required this.description,
    this.isNight = false,
    this.isEid = false,
  });
}
