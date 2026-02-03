import 'package:flutter/material.dart';
import '../models/zikr_model.dart';
import '../services/zikr_service.dart';

class ZikrScreen extends StatefulWidget {

  const ZikrScreen({super.key});



  @override
  State<ZikrScreen> createState() => _ZikrScreenState();
}

class _ZikrScreenState extends State<ZikrScreen> {
  final List<ZikrModel> _zikrList = [



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
  ];final ZikrModel _otherZikr = const ZikrModel(
    id: 'other',
    arabic: 'Other',
    english: 'Other',
  );
  ZikrModel? _customZikr;

  late ZikrModel _currentZikr;
 // ZikrModel?_customZikr;
  int _count = 0;
  int _target = 33;
  bool _completed = false;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadZikr();
  }

  Future<void> _loadZikr() async {
    final savedCount = await ZikrService.loadCount();
    final savedZikrId = await ZikrService.loadZikrId();
    final savedTarget = await ZikrService.loadTarget();
    final custom = await ZikrService.loadCustomZikr();


    setState(() {
      _count = savedCount;
      _target = savedTarget;
      _completed = _count >= _target;
      _currentZikr = _zikrList.firstWhere(
            (z) => z.id == savedZikrId,
        orElse: () => _customZikr ?? _zikrList.first,
      );

      _loading = false;
      if (custom != null) {
        _customZikr = custom;
      }

    });

  }

  void _increment() {
    if (_completed) return;

    setState(() {
      _count++;
      if (_count >= _target) {
        _completed = true;
      }
    });

    ZikrService.saveCount(_count);
  }


  void _reset() {
    setState(() {
      _count = 0;
    });
    ZikrService.reset();
  }

  void _changeZikr(ZikrModel zikr) {
    setState(() {
      _currentZikr = zikr;
      _count = 0;
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
      appBar: AppBar(
        title: const Text('Dhikr counter'),
      ),
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
        child: Padding(
          padding: const EdgeInsets.all(20),
          child:SingleChildScrollView(
          child: Column(
            children: [
              // Zikr selector
              DropdownButtonFormField<ZikrModel>(
                value: _currentZikr,
                dropdownColor: Colors.white,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  labelText: 'Select Zikr',
                ),
                items: [
                  ..._zikrList.map((z) => DropdownMenuItem(
                    value: z,
                    child: Text(z.english),
                  )),
                  DropdownMenuItem(
                    value: _otherZikr,
                    child: const Text("Other (Custom)"),
                  ),
                ],
                onChanged: (value) {
                  if (value == null) return;

                  setState(() {
                    _currentZikr = value;
                    _count = 0;
                    _completed = false;
                  });

                  ZikrService.reset();
                },
              ),


              const SizedBox(height: 30),

              // Arabic text
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

              // English
              Text(
                _currentZikr.english,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),

              const SizedBox(height: 40),
// 🎯 Target selector
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 8,
                runSpacing: 8,
                children: [
                  _targetChip(33),
                  _targetChip(99),
                  _targetChip(100),
                  _customTargetButton(),
                ],
              ),


              const SizedBox(height: 24),

              // Counter
              GestureDetector(
                onTap: _increment,
                child: Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
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
              if (_completed)
                const Padding(
                  padding: EdgeInsets.only(top: 12),
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
    );
  }
  Widget _targetChip(int value) {
    final isSelected = _target == value;

    return ChoiceChip(
      label: Text(
        value.toString(),
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      selected: isSelected,
      selectedColor: Colors.teal,
      backgroundColor: Colors.white,
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
  Future<void> _addCustomZikr() async {
    final controller = TextEditingController();

    final result = await showDialog<String>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Custom Zikr"),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: "Enter zikr (any language)",
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                Navigator.pop(context, controller.text.trim());
              }
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );

    if (result != null) {
      final custom = ZikrModel(
        id: 'custom_user',
        arabic: result,   // same text
        english: result,  // same text
      );

      await ZikrService.saveCustomZikr(result, result);

      setState(() {
        _customZikr = custom;
        _currentZikr = custom;
        _count = 0;
        _completed = false;
      });
    }
  }


}
