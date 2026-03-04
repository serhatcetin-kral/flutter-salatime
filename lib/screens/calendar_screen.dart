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

  void _nextMonth() => setState(() => _focusedGregorianMonth = DateTime(_focusedGregorianMonth.year, _focusedGregorianMonth.month + 1, 1));
  void _previousMonth() => setState(() => _focusedGregorianMonth = DateTime(_focusedGregorianMonth.year, _focusedGregorianMonth.month - 1, 1));

  // 🕌 HOLY EVENT ENGINE
  Map<String, dynamic>? _getIslamicEvent(HijriCalendar h) {
    if (h.hMonth == 10 && h.hDay == 1) return {"name": "Eid al-Fitr", "type": "eid", "color": Colors.amberAccent};
    if (h.hMonth == 12 && h.hDay == 10) return {"name": "Eid al-Adha", "type": "eid", "color": Colors.amberAccent};
    if (h.hMonth == 9 && h.hDay == 1) return {"name": "Ramadan Begins", "type": "ramadan", "color": Colors.orangeAccent};
    if (h.hMonth == 9 && h.hDay == 27) return {"name": "Laylat al-Qadr", "type": "night", "color": Colors.purpleAccent};
    if (h.hMonth == 1 && h.hDay == 10) return {"name": "Ashura", "type": "night", "color": Colors.blueAccent};
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final cells = _buildGregorianCells();
    final today = DateTime.now();

    // Logic to find events in the CURRENT focused month to show in the bottom list
    final List<Map<String, dynamic>> monthlyEvents = [];
    for (var date in cells) {
      if (date != null) {
        final h = HijriCalendar.fromDate(date);
        final event = _getIslamicEvent(h);
        if (event != null) {
          monthlyEvents.add({
            "name": event['name'],
            "date": "${date.day} ${DateFormat('MMM').format(date)} / ${h.hDay} ${h.longMonthName}",
            "color": event['color']
          });
        }
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFF0F2027),
      appBar: AppBar(
        title: const Text("Islamic Calendar", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F2027), Color(0xFF2C5364)],
            begin: Alignment.topCenter, end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildMonthHeader(),
              const SizedBox(height: 10),
              _buildWeekdayLabels(),

              // 📅 CALENDAR GRID (Reduced height to prevent overflow)
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cells.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                  ),
                  itemBuilder: (context, index) {
                    final date = cells[index];
                    if (date == null) return const SizedBox.shrink();

                    final hijri = HijriCalendar.fromDate(date);
                    final event = _getIslamicEvent(hijri);
                    final bool isToday = DateUtils.isSameDay(date, today);

                    return Container(
                      decoration: BoxDecoration(
                        color: isToday ? Colors.teal.withOpacity(0.3) : Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isToday ? Colors.tealAccent : (event != null ? event['color'] : Colors.transparent),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${date.day}", style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                          Text("${hijri.hDay}", style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 10)),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // 📜 STABLE EVENTS LIST (Prevents 17px Overflow)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Holy Events this Month", style: TextStyle(color: Colors.tealAccent, fontWeight: FontWeight.bold, fontSize: 14)),
                ),
              ),

              Expanded(
                child: monthlyEvents.isEmpty
                    ? const Center(child: Text("No major events this month", style: TextStyle(color: Colors.white38)))
                    : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: monthlyEvents.length,
                  itemBuilder: (context, index) {
                    final e = monthlyEvents[index];
                    return Card(
                      color: Colors.white.withOpacity(0.05),
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: Icon(Icons.star, color: e['color'], size: 18),
                        title: Text(e['name'], style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                        trailing: Text(e['date'], style: const TextStyle(color: Colors.white54, fontSize: 11)),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMonthHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: _previousMonth, icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 18)),
          Column(
            children: [
              Text(DateFormat('MMMM yyyy').format(_focusedGregorianMonth), style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              Text("${HijriCalendar.fromDate(_focusedGregorianMonth).longMonthName} ${HijriCalendar.fromDate(_focusedGregorianMonth).hYear} AH",
                  style: const TextStyle(color: Colors.tealAccent, fontSize: 12)),
            ],
          ),
          IconButton(onPressed: _nextMonth, icon: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18)),
        ],
      ),
    );
  }

  Widget _buildWeekdayLabels() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
            .map((d) => Text(d, style: const TextStyle(color: Colors.white38, fontSize: 12, fontWeight: FontWeight.bold)))
            .toList(),
      ),
    );
  }

  List<DateTime?> _buildGregorianCells() {
    final cells = <DateTime?>[];
    final firstDay = _focusedGregorianMonth;
    final daysInMonth = DateTime(firstDay.year, firstDay.month + 1, 0).day;
    final startOffset = firstDay.weekday - 1;
    for (int i = 0; i < startOffset; i++) cells.add(null);
    for (int d = 1; d <= daysInMonth; d++) cells.add(DateTime(firstDay.year, firstDay.month, d));
    return cells;
  }
}