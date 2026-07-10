import 'dart:math';

import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../services/app_settings.dart';
import '../services/audio_service.dart';
import '../theme/app_theme.dart';
import '../widgets/game_helpers.dart';

/// Permainan 2: Padankan Gambar - pilih nama yang betul untuk gambar.
class MatchGameScreen extends StatefulWidget {
  final int level;
  const MatchGameScreen({super.key, required this.level});

  @override
  State<MatchGameScreen> createState() => _MatchGameScreenState();
}

class _MatchGameScreenState extends State<MatchGameScreen> {
  static const int totalRounds = 5;
  final Random _random = Random();
  int _round = 0;
  late PicItem _answer;
  late List<PicItem> _options;

  int get _optionCount => widget.level + 1; // 2 / 3 / 4 pilihan.

  @override
  void initState() {
    super.initState();
    _newRound();
  }

  void _newRound() {
    final pool = [...picItems]..shuffle(_random);
    _answer = pool.first;
    _options = pool.take(_optionCount).toList()..shuffle(_random);
  }

  Future<void> _choose(PicItem item) async {
    final s = AppSettings.instance;
    if (item == _answer) {
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
      appBar: AppBar(
          title: Text('🖼️ ${s.t('Padankan Gambar', 'Match Pictures')}')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            roundProgress(_round + 1, totalRounds),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: Colors.black12),
              ),
              child: Text(_answer.emoji, style: const TextStyle(fontSize: 96)),
            ),
            const SizedBox(height: 12),
            Text(
              s.t('Apakah nama gambar ini?', 'What is this picture called?'),
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textDark),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  for (final option in _options)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: FilledButton(
                        onPressed: () => _choose(option),
                        child: Text(s.isMs ? option.ms : option.en),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
