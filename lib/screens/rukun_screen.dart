import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../services/app_settings.dart';
import '../theme/app_theme.dart';
import '../widgets/learn_helpers.dart';

class RukunScreen extends StatelessWidget {
  const RukunScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    return Scaffold(
      appBar: AppBar(title: const Text('🕋 Rukun Islam')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: rukunItems.length,
        itemBuilder: (context, i) {
          final item = rukunItems[i];
          final title = s.isMs ? item.titleMs : item.titleEn;
          final desc = s.isMs ? item.descMs : item.descEn;
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: Material(
              color: AppTheme.cardColors[i % AppTheme.cardColors.length],
              borderRadius: BorderRadius.circular(24),
              child: InkWell(
                borderRadius: BorderRadius.circular(24),
                onTap: () => learnTap(
                  context,
                  module: 'rukun',
                  id: item.titleMs,
                  total: rukunItems.length,
                  text: '$title. $desc',
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.white,
                        child: Text('${i + 1}',
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: AppTheme.textDark)),
                      ),
                      const SizedBox(width: 12),
                      Text(item.emoji, style: const TextStyle(fontSize: 36)),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(title,
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w800,
                                    color: AppTheme.textDark)),
                            const SizedBox(height: 4),
                            Text(desc,
                                style: const TextStyle(
                                    fontSize: 14, color: AppTheme.textDark)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
