import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../games/count_game.dart';
import '../services/app_settings.dart';
import '../theme/app_theme.dart';
import '../widgets/learn_card.dart';
import '../widgets/learn_helpers.dart';

class NumbersScreen extends StatelessWidget {
  const NumbersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    return Scaffold(
      appBar: AppBar(title: Text('🔢 ${s.t('Nombor', 'Numbers')}')),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Text('🎲', style: TextStyle(fontSize: 24)),
        label: Text(s.t('Jom Mengira!', "Let's Count!"),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const CountGameScreen(level: 1)),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        itemCount: 20,
        itemBuilder: (context, i) {
          final number = i + 1;
          final word = s.isMs ? numberWordsMs[i] : numberWordsEn[i];
          return LearnCard(
            color: AppTheme.cardColors[i % AppTheme.cardColors.length],
            onTap: () => learnTap(
              context,
              module: 'numbers',
              id: '$number',
              total: 20,
              text: word,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$number',
                    style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: AppTheme.textDark)),
                Text(word,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 14,
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
