import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/zikr_model.dart';
import '../services/zikr_service.dart';


class ZikrScreen extends StatefulWidget {
  const ZikrScreen({super.key});

  @override
  State<ZikrScreen> createState() => _ZikrScreenState();
}

class _ZikrScreenState extends State<ZikrScreen>
    with SingleTickerProviderStateMixin {
  final List<ZikrModel> _zikrList = const [
    ZikrModel(
      id: 'subhanallah',
      arabic: 'سُبْحَانَ ٱللَّٰه',
      english: 'SubhanAllah',
    ),
    ZikrModel(
      id: 'alhamdulillah',
      arabic: 'ٱلْحَمْدُ لِلَّٰه',
      english: 'Alhamdulillah',
    ),
    ZikrModel(
      id: 'allahuakbar',
      arabic: 'ٱللَّٰهُ أَكْبَر',
      english: 'Allahu Akbar',
    ),
    ZikrModel(
      id: 'astaghfirullah',
      arabic: 'أَسْتَغْفِرُ ٱللَّٰه',
      english: 'Astaghfirullah',
    ),
    ZikrModel(
      id: 'lailahaillallah',
      arabic: 'لَا إِلَٰهَ إِلَّا ٱللَّٰه',
      english: 'La ilaha illallah',
    ),
    const ZikrModel(
      id: 'other',
      arabic: '—',
      english: 'Other',
    ),

  ];

  late ZikrModel _currentZikr;
  int _count = 0;
  int _target = 33;
  bool _completed = false;
  bool _loading = true;

  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
    );

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.08).animate(
      CurvedAnimation(
        parent: _pulseController,
        curve: Curves.easeOut,
      ),
    );

    _loadZikr();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  Future<void> _loadZikr() async {
    final savedCount = await ZikrService.loadCount();
    final savedZikrId = await ZikrService.loadZikrId();
    final savedTarget = await ZikrService.loadTarget();

    setState(() {
      _count = savedCount;
      _target = savedTarget;
      _completed = _count >= _target;
      _currentZikr = _zikrList.firstWhere(
            (z) => z.id == savedZikrId,
        orElse: () => _zikrList.first,
      );
      _loading = false;
    });
  }

  void _increment() {
    if (_completed) return;

    // ✅ iOS-reliable haptic
    HapticFeedback.selectionClick();

    _pulseController.forward(from: 0);

    setState(() {
      _count++;

      if (_count >= _target && !_completed) {
        _completed = true;

        // 🎉 Stronger completion haptic (iOS works better with this)
        HapticFeedback.mediumImpact();
      }
    });

    ZikrService.saveCount(_count);
  }



  void _reset() {
    setState(() {
      _count = 0;
      _completed = false;
    });
    ZikrService.reset();
  }

  void _changeZikr(ZikrModel zikr) {
    setState(() {
      _currentZikr = zikr;
      _count = 0;
      _completed = false;
    });
    ZikrService.saveZikrId(zikr.id);
    ZikrService.reset();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text("Zikirmatik"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: SizedBox.expand(
        child: Container(
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
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  DropdownButtonFormField<ZikrModel>(
                    value: _currentZikr,
                    dropdownColor: Colors.white,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Select Zikr',
                    ),
                    items: _zikrList.map((z) {
                      return DropdownMenuItem(
                        value: z,
                        child: Text(z.english),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) _changeZikr(value);
                    },
                  ),

                  const SizedBox(height: 30),

                  if (_currentZikr.id != 'other')
                    Text(
                      _currentZikr.arabic,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),


                  const SizedBox(height: 12),

                  Text(
                    _currentZikr.english,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),

                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _targetChip(33),
                      const SizedBox(width: 8),
                      _targetChip(99),
                      const SizedBox(width: 8),
                      _targetChip(100),
                      const SizedBox(width: 8),
                      _customTargetButton(),
                    ],
                  ),

                  const Spacer(),

                  ScaleTransition(
                    scale: _pulseAnimation,
                    child: GestureDetector(
                      onTap: _increment,
                      child: Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: _completed
                              ? [
                            BoxShadow(
                              color: Colors.greenAccent.withOpacity(0.8),
                              blurRadius: 30,
                              spreadRadius: 6,
                            ),
                          ]
                              : [],
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          _count.toString(),
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                      ),
                    ),
                  ),

                  if (_completed)
                    const Padding(
                      padding: EdgeInsets.only(top: 14),
                      child: Text(
                        "✔ Target completed",
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                  const SizedBox(height: 20),

                  TextButton(
                    onPressed: _reset,
                    child: const Text(
                      'Reset',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _targetChip(int value) {
    final isSelected = _target == value;

    return ChoiceChip(
      label: Text(value.toString()),
      selected: isSelected,
      onSelected: (_) {
        setState(() {
          _target = value;
          _count = 0;
          _completed = false;
        });
        ZikrService.saveTarget(value);
        ZikrService.reset();
      },
    );
  }

  Widget _customTargetButton() {
    return IconButton(
      icon: const Icon(Icons.edit, color: Colors.white),
      onPressed: () async {
        final controller = TextEditingController();

        final result = await showDialog<int>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Custom Target'),
            content: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter number',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  final value = int.tryParse(controller.text);
                  if (value != null && value > 0) {
                    Navigator.pop(context, value);
                  }
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );

        if (result != null) {
          setState(() {
            _target = result;
            _count = 0;
            _completed = false;
          });
          ZikrService.saveTarget(result);
          ZikrService.reset();
        }
      },
    );
  }
}
