import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../services/app_settings.dart';
import '../theme/app_theme.dart';
import '../widgets/learn_card.dart';
import '../widgets/learn_helpers.dart';

class AnimalsScreen extends StatelessWidget {
  const AnimalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    return Scaffold(
      appBar: AppBar(title: Text('🐘 ${s.t('Haiwan', 'Animals')}')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        itemCount: animalItems.length,
        itemBuilder: (context, i) {
          final item = animalItems[i];
          final name = s.isMs ? item.ms : item.en;
          return LearnCard(
            color: AppTheme.cardColors[i % AppTheme.cardColors.length],
            onTap: () => learnTap(
              context,
              module: 'animals',
              id: item.en,
              total: animalItems.length,
              text: '$name. ${item.sound}!',
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(item.emoji, style: const TextStyle(fontSize: 56)),
                const SizedBox(height: 6),
                Text(name,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: AppTheme.textDark)),
                Text(item.sound,
                    style: const TextStyle(
                        fontSize: 14, color: AppTheme.textDark)),
              ],
            ),
          );
        },
      ),
    );
  }
}
