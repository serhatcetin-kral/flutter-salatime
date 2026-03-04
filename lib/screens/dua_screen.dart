import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/dua_model.dart';

class DuaScreen extends StatefulWidget {
  const DuaScreen({super.key});

  @override
  State<DuaScreen> createState() => _DuaScreenState();
}

class _DuaScreenState extends State<DuaScreen> {
  String _searchQuery = "";

  // ⭐ YOUR FULL DUA LIST (Old + New Ramadan & Daily)
  static const List<DuaModel> _duas = [
    // --- RAMADAN SPECIALS (March 2026) ---
    DuaModel(
      id: 'suhoor',
      title: 'Suhoor (Starting Fast)',
      arabic: 'وَبِصَوْمِ غَدٍ نَّوَيْتُ مِنْ شَهْرِ رَمَضَانَ',
      english: 'I intend to keep the fast for tomorrow in the month of Ramadan.',
    ),
    DuaModel(
      id: 'iftar',
      title: 'Iftar (Breaking Fast)',
      arabic: 'اللَّهُمَّ لَكَ صُمْتُ وَعَلَى رِزْقِكَ أَفْطَرْتُ',
      english: 'O Allah, I fasted for You and I break my fast with Your sustenance.',
    ),
    DuaModel(
      id: 'laylatul_qadr',
      title: 'Laylatul Qadr',
      arabic: 'اللَّهُمَّ إِنَّكَ عَفُوٌّ تُحِبُّ الْعَفْوَ فَاعْفُ عَنِّي',
      english: 'O Allah, You are Most Forgiving and You love forgiveness, so forgive me.',
    ),

    // --- YOUR ORIGINAL DUAS ---
    DuaModel(
      id: 'morning',
      title: 'Morning Dua',
      arabic: 'اللَّهُمَّ بِكَ أَصْبَحْنَا وَبِكَ أَمْسَيْنَا',
      english: 'O Allah, by You we enter the morning and by You we enter the evening.',
    ),
    DuaModel(
      id: 'evening',
      title: 'Evening Dua',
      arabic: 'اللَّهُمَّ بِكَ أَمْسَيْنَا وَبِكَ نَحْيَا',
      english: 'O Allah, by You we enter the evening and by You we live.',
    ),
    DuaModel(
      id: 'sleep',
      title: 'Before Sleep',
      arabic: 'بِاسْمِكَ اللَّهُمَّ أَمُوتُ وَأَحْيَا',
      english: 'In Your name O Allah, I die and I live.',
    ),
    DuaModel(
      id: 'forgiveness',
      title: 'Seeking Forgiveness',
      arabic: 'أَسْتَغْفِرُ اللَّهَ',
      english: 'I seek forgiveness from Allah.',
    ),
    DuaModel(
      id: 'protection',
      title: 'Protection',
      arabic: 'أَعُوذُ بِكَلِمَاتِ اللَّهِ التَّامَّاتِ',
      english: 'I seek refuge in the perfect words of Allah.',
    ),

    // --- ADDED ESSENTIALS ---
    DuaModel(
      id: 'parents',
      title: 'Dua for Parents',
      arabic: 'رَّبِّ ارْحَمْهُمَا كَمَا رَبَّيَانِي صَغِيرًا',
      english: 'My Lord, have mercy upon them as they brought me up when I was small.',
    ),
    DuaModel(
      id: 'knowledge',
      title: 'Seeking Knowledge',
      arabic: 'رَّبِّ زِدْنِي عِلْمًا',
      english: 'My Lord, increase me in knowledge.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredDuas = _duas.where((dua) {
      final query = _searchQuery.toLowerCase();
      return dua.title.toLowerCase().contains(query) ||
          dua.english.toLowerCase().contains(query);
    }).toList();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Daily Duas", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // 🔍 SEARCH BAR
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  onChanged: (val) => setState(() => _searchQuery = val),
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Search for a dua...",
                    hintStyle: const TextStyle(color: Colors.white54),
                    prefixIcon: const Icon(Icons.search, color: Colors.tealAccent),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.05),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              // 📜 SCROLLABLE LIST
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                  itemCount: filteredDuas.length,
                  itemBuilder: (context, index) {
                    return _duaCard(filteredDuas[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _duaCard(DuaModel dua) {
    bool isRamadan = dua.id == 'suhoor' || dua.id == 'iftar' || dua.id == 'laylatul_qadr';

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isRamadan ? Colors.teal.withOpacity(0.15) : Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: isRamadan ? Colors.tealAccent.withOpacity(0.4) : Colors.white.withOpacity(0.1),
          width: isRamadan ? 2 : 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dua.title,
                style: TextStyle(
                  color: isRamadan ? Colors.tealAccent : Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: "${dua.arabic}\n\n${dua.english}"));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Copied to clipboard"), duration: Duration(seconds: 1)),
                  );
                },
                child: const Icon(Icons.copy_rounded, color: Colors.white38, size: 20),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              dua.arabic,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 26,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            dua.english,
            style: const TextStyle(color: Colors.white70, fontSize: 14, height: 1.4),
          ),
        ],
      ),
    );
  }
}