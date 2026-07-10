import 'dart:math';

import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../services/app_settings.dart';
import '../services/audio_service.dart';
import '../theme/app_theme.dart';
import '../widgets/game_helpers.dart';

/// Permainan 5: Kira Objek - kira dan pilih jumlah yang betul.
class CountGameScreen extends StatefulWidget {
  final int level;
  const CountGameScreen({super.key, required this.level});

  @override
  State<CountGameScreen> createState() => _CountGameScreenState();
}

class _CountGameScreenState extends State<CountGameScreen> {
  static const int totalRounds = 5;
  final Random _random = Random();
  int _round = 0;
  late int _answer;
  late String _emoji;
  late List<int> _options;

  int get _maxNumber => switch (widget.level) { 1 => 5, 2 => 10, _ => 20 };

  @override
  void initState() {
    super.initState();
    _newRound();
  }

  void _newRound() {
    _answer = 1 + _random.nextInt(_maxNumber);
    _emoji = countEmojis[_random.nextInt(countEmojis.length)];
    final choices = <int>{_answer};
    while (choices.length < 3) {
      choices.add(1 + _random.nextInt(_maxNumber));
    }
    _options = choices.toList()..shuffle(_random);
  }

  Future<void> _choose(int value) async {
    final s = AppSettings.instance;
    if (value == _answer) {
      AudioService.instance.ding();
      _round++;
      if (_round >= totalRounds) {
        if (!mounted) return;
        await showWinDialog(
          context,
          stars: widget.level,
          onReplay: () => setState(() {
            _round = 0;
            _newRound();
          }),
        );
      } else {
        setState(_newRound);
      }
    } else {
      AudioService.instance.speak(s.t('Cuba lagi!', 'Try again!'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    return Scaffold(
      appBar: AppBar(title: Text('🔢 ${s.t('Kira Objek', 'Count Objects')}')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            roundProgress(_round + 1, totalRounds),
            const SizedBox(height: 12),
            Text(
              s.t('Berapa banyak objek di bawah?',
                  'How many objects are below?'),
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textDark),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: Colors.black12),
                ),
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    alignment: WrapAlignment.center,
                    children: [
                      for (var i = 0; i < _answer; i++)
                        Text(_emoji, style: const TextStyle(fontSize: 36)),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                for (final option in _options)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          minimumSize: const Size(64, 72),
                          textStyle: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w900),
                        ),
                        onPressed: () => _choose(option),
                        child: Text('$option'),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
