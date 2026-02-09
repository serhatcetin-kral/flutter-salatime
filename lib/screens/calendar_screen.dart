import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';

import '../utils/holy_day_utils.dart';
import '../models/holy_day.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late DateTime _focusedGregorianMonth;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _focusedGregorianMonth = DateTime(now.year, now.month, 1);
  }

  void _nextMonth() {
    setState(() {
      _focusedGregorianMonth =
          DateTime(_focusedGregorianMonth.year, _focusedGregorianMonth.month + 1, 1);
    });
  }

  void _previousMonth() {
    setState(() {
      _focusedGregorianMonth =
          DateTime(_focusedGregorianMonth.year, _focusedGregorianMonth.month - 1, 1);
    });
  }

  String _gregorianMonthLabel() =>
      DateFormat('MMMM yyyy').format(_focusedGregorianMonth);

  String _hijriMonthLabel() {
    final hijri = HijriCalendar.fromDate(_focusedGregorianMonth);
    return "${hijri.longMonthName} ${hijri.hYear} AH";
  }

  List<DateTime?> _buildGregorianCells() {
    final cells = <DateTime?>[];
    final firstDay = _focusedGregorianMonth;
    final daysInMonth =
        DateTime(firstDay.year, firstDay.month + 1, 0).day;

    final startOffset = firstDay.weekday - 1;

    for (int i = 0; i < startOffset; i++) {
      cells.add(null);
    }

    for (int d = 1; d <= daysInMonth; d++) {
      cells.add(DateTime(firstDay.year, firstDay.month, d));
    }

    return cells;
  }

  @override
  Widget build(BuildContext context) {
    final cells = _buildGregorianCells();
    final today = DateTime.now();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Islamic Calendar")),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              // 🌙 Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: _previousMonth,
                    icon: const Icon(Icons.chevron_left),
                  ),
                  Column(
                    children: [
                      Text(
                        _hijriMonthLabel(),
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        _gregorianMonthLabel(),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: _nextMonth,
                    icon: const Icon(Icons.chevron_right),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Weekdays
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text("Mon"),
                  Text("Tue"),
                  Text("Wed"),
                  Text("Thu"),
                  Text("Fri", style: TextStyle(color: Colors.blue)),
                  Text("Sat"),
                  Text("Sun"),
                ],
              ),

              const SizedBox(height: 8),

              // Calendar grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cells.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  childAspectRatio: 1,
                ),
                  itemBuilder: (context, index) {
                    final date = cells[index];
                    if (date == null) return const SizedBox.shrink();

                    final hijri = HijriCalendar.fromDate(date);
                    final holyDay = HolyDayUtils.getHolyDay(hijri);

                    final isToday = DateUtils.isSameDay(date, DateTime.now());
                    final isFriday = date.weekday == DateTime.friday;
                    final isRamadan = hijri.hMonth == 9;

                    Color bgColor = Colors.white;

                    if (holyDay?.isEid == true) {
                      bgColor = const Color(0xFFE8F5E9); // 🟢 Eid
                    } else if (holyDay?.isNight == true) {
                      bgColor = const Color(0xFFF3E5F5); // 🟣 Holy night
                    } else if (isRamadan) {
                      bgColor = const Color(0xFFFFF8E1); // 🟠 Ramadan
                    } else if (isToday) {
                      bgColor = const Color(0xFFB2DFDB); // Today
                    } else if (isFriday) {
                      bgColor = const Color(0xFFE3F2FD); // Friday
                    }

                    return GestureDetector(
                      onTap: holyDay == null
                          ? null
                          : () => _showHolyDayDetails(context, holyDay),
                      child: Container(
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(10),
                          border: holyDay != null
                              ? Border.all(color: Colors.deepOrangeAccent)
                              : null,
                        ),
                        padding: const EdgeInsets.all(4),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${hijri.hDay}",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${date.day}",
                              style: const TextStyle(
                                fontSize: 9,
                                color: Colors.grey,
                              ),
                            ),
                            if (holyDay != null)
                              Flexible(
                                child: Text(
                                  holyDay.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w600,
                                    color: holyDay.isEid
                                        ? Colors.green
                                        : Colors.deepPurple,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  }

              ),

              const SizedBox(height: 12),

              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                children: [
                  _legend(const Color(0xFFB2DFDB), "Today"),
                  _legend(const Color(0xFFE3F2FD), "Friday"),
                  _legend(const Color(0xFFFFF8E1), "Ramadan"),
                  _legend(const Color(0xFFF3E5F5), "Holy Night"),
                  _legend(const Color(0xFFE8F5E9), "Eid"),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

  void _showHolyDayDetails(BuildContext context, HolyDay day) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              day.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(day.description),
            if (day.isNight)
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  "Begins after Maghrib",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _legend(Color color, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 4),
        Text(label),
      ],
    );
  }
}
