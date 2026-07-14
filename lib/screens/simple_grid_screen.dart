import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../services/app_settings.dart';
import '../theme/app_theme.dart';
import '../widgets/learn_card.dart';
import '../widgets/learn_helpers.dart';

/// Skrin grid generik untuk modul jenis "emoji + nama + sebutan"
/// (buah & sayur, kenderaan, keluarga, cuaca). Elak pertindihan kod.
class SimpleGridScreen extends StatelessWidget {
  final String titleEmoji;
  final String titleMs;
  final String titleEn;
  final String moduleKey;
  final List<AnimalItem> items;
  final bool speakSound; // Jika benar, sebut 'sound' selepas nama.

  const SimpleGridScreen({
    super.key,
    required this.titleEmoji,
    required this.titleMs,
    required this.titleEn,
    required this.moduleKey,
    required this.items,
    this.speakSound = false,
  });

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    return Scaffold(
      appBar: AppBar(title: Text('$titleEmoji ${s.t(titleMs, titleEn)}')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        itemCount: items.length,
        itemBuilder: (context, i) {
          final item = items[i];
          final name = s.isMs ? item.ms : item.en;
          return LearnCard(
            color: AppTheme.cardColors[i % AppTheme.cardColors.length],
            onTap: () => learnTap(
              context,
              module: moduleKey,
              id: item.en,
              total: items.length,
              text: speakSound ? '$name. ${item.sound}' : name,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(item.emoji, style: const TextStyle(fontSize: 56)),
                const SizedBox(height: 6),
                Text(name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 19,
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
