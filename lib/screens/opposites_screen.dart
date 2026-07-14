import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../services/app_settings.dart';
import '../theme/app_theme.dart';
import '../widgets/learn_helpers.dart';

/// Modul Lawan Kata - pasangan konsep bertentangan.
class OppositesScreen extends StatelessWidget {
  const OppositesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    return Scaffold(
      appBar: AppBar(title: Text('🔄 ${s.t('Lawan Kata', 'Opposites')}')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: oppositeItems.length,
        itemBuilder: (context, i) {
          final item = oppositeItems[i];
          final w1 = s.isMs ? item.ms1 : item.en1;
          final w2 = s.isMs ? item.ms2 : item.en2;
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppTheme.cardColors[i % AppTheme.cardColors.length],
              borderRadius: BorderRadius.circular(24),
              boxShadow: AppTheme.softShadow(opacity: 0.06),
            ),
            child: Row(
              children: [
                Expanded(
                  child: _Side(
                    emoji: item.emoji1,
                    word: w1,
                    onTap: () => learnTap(
                      context,
                      module: 'opposites',
                      id: '${item.en1}_${item.en2}',
                      total: oppositeItems.length,
                      text: s.t('$w1 lawannya $w2', '$w1, the opposite of $w2'),
                    ),
                  ),
                ),
                const Text('↔️', style: TextStyle(fontSize: 26)),
                Expanded(
                  child: _Side(
                    emoji: item.emoji2,
                    word: w2,
                    onTap: () => learnTap(
                      context,
                      module: 'opposites',
                      id: '${item.en1}_${item.en2}',
                      total: oppositeItems.length,
                      text: s.t('$w2 lawannya $w1', '$w2, the opposite of $w1'),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _Side extends StatelessWidget {
  final String emoji;
  final String word;
  final VoidCallback onTap;
  const _Side({required this.emoji, required this.word, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Column(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 42)),
          const SizedBox(height: 4),
          Text(word,
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.textDark)),
        ],
      ),
    );
  }
}
