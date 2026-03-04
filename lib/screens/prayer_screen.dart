
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/calculation_method.dart';
import '../models/madhhab_type.dart';
import '../services/location_name_service.dart';
import '../services/location_service.dart';
import '../services/prayer_api_service.dart';
import '../services/settings_service.dart';
import '../utils/hijri_utils.dart';
import '../utils/ramadan_utils.dart';
import 'dart:convert';

class PrayerScreen extends StatefulWidget {
  const PrayerScreen({super.key});

  @override
  State<PrayerScreen> createState() => _PrayerScreenState();
}

class _PrayerScreenState extends State<PrayerScreen> {
  Map<String, String>? prayerTimes;
  String? locationName;
  Timer? _countdownTimer;
  String? _nextPrayerName;
  Duration? _timeUntilNextPrayer;
  bool _isLoading = true;
  bool _showNightTimes = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    super.dispose();
  }

  int _getApiMethodId(CalculationMethod method) {
    switch (method) {
      case CalculationMethod.karachi: return 1;
      case CalculationMethod.isna: return 2;
      case CalculationMethod.mwl: return 3;
      case CalculationMethod.makkah: return 4;
      case CalculationMethod.egypt: return 5;
      case CalculationMethod.turkish: return 13;
      default: return 2;
    }
  }

  Future<void> _loadData() async {
    if (!mounted) return;
    setState(() => _isLoading = true);

    final prefs = await SharedPreferences.getInstance();

    // 1. IMMEDIATE CACHE LOAD (Prevents "Locating..." and "--:--" flicker)
    _showNightTimes = prefs.getBool('show_night_times') ?? false;
    final String? cachedName = prefs.getString('cached_location_name');
    final String? cachedTimesJson = prefs.getString('cached_prayer_times');

    if (mounted) {
      setState(() {
        if (cachedName != null) locationName = cachedName;
        if (cachedTimesJson != null) {
          final Map<String, dynamic> decoded = jsonDecode(cachedTimesJson);
          prayerTimes = decoded.map((key, value) => MapEntry(key, value.toString()));
          _startTimer(prayerTimes!);
        }
      });
    }

    try {
      final settings = await SettingsService.loadSettings();
      final methodId = _getApiMethodId(settings.method);

      // 2. Get Location
      Position pos = await LocationService.getUserLocation().timeout(const Duration(seconds: 7));

      // 3. Get City Name & Cache it
      final name = await LocationNameService.getLocationName(pos.latitude, pos.longitude);
      await prefs.setString('cached_location_name', name);

      // 4. Get Prayer Times & Cache them
      final times = await PrayerApiService.getPrayerTimes(
        latitude: pos.latitude,
        longitude: pos.longitude,
        method: methodId,
        school: settings.madhab.schoolValue,
        offsetMinutes: settings.offsetMinutes,
      );

      if (mounted) {
        setState(() {
          locationName = name;
          prayerTimes = times;
          _isLoading = false;
        });
        await prefs.setString('cached_prayer_times', jsonEncode(times));
        _startTimer(times);
      }
    } catch (e) {
      debugPrint("Offline/Error: $e");
      // If we have cached data, the UI is already showing it.
      // We just stop the loading spinner.
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _startTimer(Map<String, String> times) {
    _countdownTimer?.cancel();
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final now = DateTime.now();
      final sequence = ['Fajr', 'Sunrise', 'Dhuhr', 'Asr', 'Maghrib', 'Isha'];

      for (String name in sequence) {
        if (times.containsKey(name)) {
          final parsed = DateFormat("HH:mm").parse(times[name]!);
          final scheduled = DateTime(now.year, now.month, now.day, parsed.hour, parsed.minute);
          if (scheduled.isAfter(now)) {
            if (mounted) {
              setState(() {
                _nextPrayerName = name;
                _timeUntilNextPrayer = scheduled.difference(now);
              });
            }
            return;
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF102027),
      appBar: AppBar(
        title: const Text("Salat Times", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.teal,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () => Navigator.pushNamed(context, '/menu'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () => Navigator.pushNamed(context, '/settings').then((_) => _loadData()),
          ),
          IconButton(icon: const Icon(Icons.refresh, color: Colors.white), onPressed: _loadData),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF102027), Color(0xFF2E5964)],
            begin: Alignment.topCenter, end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              if (RamadanUtils.isRamadanToday()) _buildRamadanBanner(),

              const SizedBox(height: 15),
              // Shows "Offline Mode" if it's the very first run, otherwise shows cached name
              Text(locationName ?? "Locating...", style: const TextStyle(color: Colors.white70)),
              Text(HijriUtils.getTodayHijriDate(locale: 'en'),
                  style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),

              const SizedBox(height: 25),
              _buildMainCard(),
              const SizedBox(height: 20),

              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: _buildPrayerRows(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildPrayerRows() {
    List<String> keys = ['Fajr', 'Sunrise', 'Dhuhr', 'Asr', 'Maghrib', 'Isha'];
    if (_showNightTimes) {
      keys.add('Midnight');
      keys.add('Firstthird');
      keys.add('Lastthird');
    }
    return keys.map((key) => _buildPrayerRow(key)).toList();
  }

  Widget _buildRamadanBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orangeAccent.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          const Icon(Icons.nightlight_round, color: Colors.orangeAccent),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Ramadan Mubarak!", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Text("${RamadanUtils.remainingRamadanDays()} days until Eid",
                  style: const TextStyle(color: Colors.white70, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMainCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.teal.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.tealAccent.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Text("NEXT: ${_nextPrayerName ?? '---'}", style: const TextStyle(color: Colors.tealAccent, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(
            _timeUntilNextPrayer != null
                ? _timeUntilNextPrayer!.toString().split('.').first.padLeft(8, "0")
                : "00:00:00",
            style: const TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold, fontFamily: 'monospace'),
          ),
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: LinearProgressIndicator(color: Colors.tealAccent, backgroundColor: Colors.transparent),
            ),
        ],
      ),
    );
  }

  Widget _buildPrayerRow(String name) {
    final time = prayerTimes?[name] ?? "--:--";
    final isNext = name == _nextPrayerName;

    String displayName = name;
    if (name == 'Midnight') displayName = 'Middle of the Night';
    if (name == 'Firstthird') displayName = 'First Third of Night';
    if (name == 'Lastthird') displayName = 'Last Third (Tahajjud)';

    return Card(
      color: isNext ? Colors.teal.withOpacity(0.7) : Colors.white.withOpacity(0.05),
      margin: const EdgeInsets.symmetric(vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        title: Text(displayName, style: const TextStyle(color: Colors.white)),
        trailing: Text(time, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }
}