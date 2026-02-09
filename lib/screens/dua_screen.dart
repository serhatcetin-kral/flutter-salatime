import 'package:flutter/material.dart';
import '../models/dua_model.dart';

class DuaScreen extends StatelessWidget {
  const DuaScreen({super.key});

  static const List<DuaModel> _duas = [
    DuaModel(
      id: 'morning',
      title: 'Morning Dua',
      arabic: 'اللَّهُمَّ بِكَ أَصْبَحْنَا وَبِكَ أَمْسَيْنَا',
      english:
      'O Allah, by You we enter the morning and by You we enter the evening.',
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Duas"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF102027),
              Color(0xFF1E3C45),
              Color(0xFF2E5964),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea( // ✅ THIS FIXES THE BLACK SCREEN
          child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
            itemCount: _duas.length,
            itemBuilder: (context, index) {
              final dua = _duas[index];
              return _duaCard(dua);
            },
          ),
        ),
      ),
    );
  }

  Widget _duaCard(DuaModel dua) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dua.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            dua.arabic,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            dua.english,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
