import 'package:flutter/material.dart';

import '../games/count_game.dart';
import '../games/match_game.dart';
import '../games/memory_game.dart';
import '../games/puzzle_game.dart';
import '../games/shadow_game.dart';
import '../services/app_settings.dart';
import '../theme/app_theme.dart';
import '../widgets/menu_card.dart';
import 'level_picker_screen.dart';

class _GameInfo {
  final String emoji;
  final String label;
  final Widget Function(int level) builder;
  const _GameInfo(this.emoji, this.label, this.builder);
}

class GamesMenuScreen extends StatelessWidget {
  const GamesMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    final games = <_GameInfo>[
      _GameInfo('🃏', 'Memory Card',
          (level) => MemoryGameScreen(level: level)),
      _GameInfo('🖼️', s.t('Padankan Gambar', 'Match Pictures'),
          (level) => MatchGameScreen(level: level)),
      _GameInfo('🧩', s.t('Susun Puzzle', 'Simple Puzzle'),
          (level) => PuzzleGameScreen(level: level)),
      _GameInfo('👤', s.t('Cari Bayang', 'Find the Shadow'),
          (level) => ShadowGameScreen(level: level)),
      _GameInfo('🔢', s.t('Kira Objek', 'Count Objects'),
          (level) => CountGameScreen(level: level)),
    ];
    return Scaffold(
      appBar: AppBar(title: Text('🧩 ${s.t('Permainan IQ', 'IQ Games')}')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 14,
          crossAxisSpacing: 14,
        ),
        itemCount: games.length,
        itemBuilder: (context, i) => MenuCard(
          emoji: games[i].emoji,
          label: games[i].label,
          color: AppTheme.cardColors[i % AppTheme.cardColors.length],
          deepColor:
              AppTheme.cardColorsDeep[i % AppTheme.cardColorsDeep.length],
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => LevelPickerScreen(
                title: '${games[i].emoji} ${games[i].label}',
                builder: games[i].builder,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
