import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../services/app_settings.dart';
import '../theme/app_theme.dart';
import '../widgets/learn_card.dart';
import '../widgets/learn_helpers.dart';

/// Kad nama pantas untuk 25 Rasul (Arab + rumi + sebutan).
class ProphetNamesScreen extends StatelessWidget {
  const ProphetNamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    return Scaffold(
      appBar: AppBar(
          title: Text('🕌 ${s.t('Nama-nama Rasul', 'Names of the Prophets')}')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.95,
        ),
        itemCount: prophetNameItems.length,
        itemBuilder: (context, i) {
          final item = prophetNameItems[i];
          final name = s.isMs ? item.nameMs : item.nameEn;
          return LearnCard(
            color: AppTheme.cardColors[i % AppTheme.cardColors.length],
            onTap: () => learnTap(
              context,
              module: 'prophet_names',
              id: item.nameEn,
              total: prophetNameItems.length,
              text: 'Nabi $name',
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(item.emoji, style: const TextStyle(fontSize: 40)),
                const SizedBox(height: 6),
                Text(item.arabic,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textDark)),
                const SizedBox(height: 4),
                Text(name,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: AppTheme.textDark)),
              ],
            ),
          );
        },
      ),
    );
  }
}
