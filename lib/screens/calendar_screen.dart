import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';

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
      _focusedGregorianMonth = DateTime(
        _focusedGregorianMonth.year,
        _focusedGregorianMonth.month + 1,
        1,
      );
    });
  }

  void _previousMonth() {
    setState(() {
      _focusedGregorianMonth = DateTime(
        _focusedGregorianMonth.year,
        _focusedGregorianMonth.month - 1,
        1,
      );
    });
  }

  String _gregorianMonthLabel() {
    return DateFormat('MMMM yyyy').format(_focusedGregorianMonth);
  }

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

    for (int day = 1; day <= daysInMonth; day++) {
      cells.add(DateTime(firstDay.year, firstDay.month, day));
    }

    return cells;
  }

  @override
  Widget build(BuildContext context) {
    final cells = _buildGregorianCells();
    final todayGregorian = DateTime.now();

    return Scaffold(
      backgroundColor: Colors.white, // ✅ force white background
      appBar: AppBar(
        title: const Text("Islamic Calendar"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
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
                        const SizedBox(height: 2),
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

                // Calendar Grid
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cells.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                    childAspectRatio: 1.0, // ✅ stable height
                  ),
                  itemBuilder: (context, index) {
                    final date = cells[index];
                    if (date == null) {
                      return const SizedBox.shrink();
                    }

                    final hijri = HijriCalendar.fromDate(date);

                    final isToday =
                        date.year == todayGregorian.year &&
                            date.month == todayGregorian.month &&
                            date.day == todayGregorian.day;

                    final isFriday = date.weekday == DateTime.friday;
                    final isRamadan = hijri.hMonth == 9;

                    Color bgColor = Colors.white;

                    if (isToday) {
                      bgColor = const Color(0xFFB2DFDB);
                    } else if (isRamadan) {
                      bgColor = const Color(0xFFFFF3E0);
                    } else if (isFriday) {
                      bgColor = const Color(0xFFE3F2FD);
                    }

                    return Container(
                      decoration: BoxDecoration(
                        color: bgColor, // ✅ no black cells
                        borderRadius: BorderRadius.circular(10),
                        border: isRamadan
                            ? Border.all(
                          color: Colors.orangeAccent,
                          width: 1,
                        )
                            : null,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Column(
                        mainAxisSize: MainAxisSize.min, // ✅ FIX OVERFLOW
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${hijri.hDay}",
                            textScaleFactor: 1.0, // ✅ prevent font scaling overflow
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight:
                              (isToday || isRamadan)
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color:
                              isFriday ? Colors.blue : Colors.black,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            "${date.day}",
                            textScaleFactor: 1.0,
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                const SizedBox(height: 12),

                // Legend
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 12,
                  runSpacing: 6,
                  children: [
                    _legend(const Color(0xFFB2DFDB), "Today"),
                    _legend(const Color(0xFFE3F2FD), "Friday"),
                    _legend(const Color(0xFFFFF3E0), "Ramadan"),
                  ],
                ),
              ],
            ),
          ),
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
