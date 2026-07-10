import 'dart:math';

import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../services/app_settings.dart';
import '../services/audio_service.dart';
import '../theme/app_theme.dart';
import '../widgets/game_helpers.dart';

/// Permainan 3: Puzzle Mudah - tekan nombor mengikut urutan yang betul.
class PuzzleGameScreen extends StatefulWidget {
  final int level;
  const PuzzleGameScreen({super.key, required this.level});

  @override
  State<PuzzleGameScreen> createState() => _PuzzleGameScreenState();
}

class _PuzzleGameScreenState extends State<PuzzleGameScreen> {
  final Random _random = Random();
  late List<int> _numbers;
  int _next = 1;
  int? _wrongIndex;

  int get _count => switch (widget.level) { 1 => 4, 2 => 6, _ => 9 };

  @override
  void initState() {
    super.initState();
    _setup();
  }

  void _setup() {
    _numbers = List.generate(_count, (i) => i + 1)..shuffle(_random);
    _next = 1;
    _wrongIndex = null;
  }

  Future<void> _onTap(int index) async {
    final s = AppSettings.instance;
    final value = _numbers[index];
    if (value < _next) return; // Sudah selesai.
    if (value == _next) {
      AudioService.instance
          .speak(s.isMs ? numberWordsMs[value - 1] : numberWordsEn[value - 1]);
      setState(() => _next++);
      if (_next > _count && mounted) {
        await showWinDialog(
          context,
          stars: widget.level,
          onReplay: () => setState(_setup),
        );
      }
    } else {
      setState(() => _wrongIndex = index);
      await Future.delayed(const Duration(milliseconds: 350));
      if (mounted) setState(() => _wrongIndex = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    return Scaffold(
      appBar:
          AppBar(title: Text('🧩 ${s.t('Susun Puzzle', 'Simple Puzzle')}')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              s.t('Tekan nombor mengikut urutan: 1, 2, 3...',
                  'Tap the numbers in order: 1, 2, 3...'),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textDark),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ),
              itemCount: _numbers.length,
              itemBuilder: (context, i) {
                final value = _numbers[i];
                final done = value < _next;
                final wrong = _wrongIndex == i;
                return GestureDetector(
                  onTap: () => _onTap(i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      color: wrong
                          ? const Color(0xFFFFB4B4)
                          : done
                              ? const Color(0xFFD4F5DD)
                              : const Color(0xFFCDE8FF),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Center(
                      child: done
                          ? const Text('✅', style: TextStyle(fontSize: 36))
                          : Text(
                              '$value',
                              style: const TextStyle(
                                  fontSize: 44,
                                  fontWeight: FontWeight.w900,
                                  color: AppTheme.textDark),
                            ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
