import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../services/app_settings.dart';
import '../theme/app_theme.dart';
import '../widgets/learn_card.dart';
import '../widgets/learn_helpers.dart';

class AbcScreen extends StatelessWidget {
  const AbcScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    return Scaffold(
      appBar: AppBar(title: const Text('🔤 ABC')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.95,
        ),
        itemCount: abcItems.length,
        itemBuilder: (context, i) {
          final item = abcItems[i];
          final word = s.isMs ? item.msWord : item.enWord;
          final emoji = s.isMs ? item.msEmoji : item.enEmoji;
          return LearnCard(
            color: AppTheme.cardColors[i % AppTheme.cardColors.length],
            onTap: () => learnTap(
              context,
              module: 'abc',
              id: item.letter,
              total: abcItems.length,
              text: '${item.letter}. $word',
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(item.letter,
                    style: const TextStyle(
                        fontSize: 44,
                        fontWeight: FontWeight.w900,
                        color: AppTheme.textDark)),
                Text(emoji, style: const TextStyle(fontSize: 40)),
                Text(word,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textDark)),
              ],
            ),
          );
        },
      ),
    );
  }
}
