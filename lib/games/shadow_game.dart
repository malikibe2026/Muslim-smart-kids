import 'dart:math';

import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../services/app_settings.dart';
import '../services/audio_service.dart';
import '../theme/app_theme.dart';
import '../widgets/game_helpers.dart';

/// Permainan 4: Cari Bayang - pilih gambar yang sepadan dengan bayang.
class ShadowGameScreen extends StatefulWidget {
  final int level;
  const ShadowGameScreen({super.key, required this.level});

  @override
  State<ShadowGameScreen> createState() => _ShadowGameScreenState();
}

class _ShadowGameScreenState extends State<ShadowGameScreen> {
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
      appBar:
          AppBar(title: Text('👤 ${s.t('Cari Bayang', 'Find the Shadow')}')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            roundProgress(_round + 1, totalRounds),
            const SizedBox(height: 16),
            // Bayang (siluet) - emoji diwarnakan gelap sepenuhnya.
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF3B0),
                borderRadius: BorderRadius.circular(28),
              ),
              child: ColorFiltered(
                colorFilter: const ColorFilter.mode(
                    Color(0xFF57578A), BlendMode.srcIn),
                child:
                    Text(_answer.emoji, style: const TextStyle(fontSize: 96)),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              s.t('Bayang siapakah ini?', 'Whose shadow is this?'),
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textDark),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                children: [
                  for (final option in _options)
                    Material(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                        side: const BorderSide(color: Colors.black12),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(24),
                        onTap: () => _choose(option),
                        child: Center(
                          child: Text(option.emoji,
                              style: const TextStyle(fontSize: 56)),
                        ),
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
