import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../services/app_settings.dart';
import '../theme/app_theme.dart';
import '../widgets/learn_helpers.dart';

/// Modul "Kebesaran Allah" - keajaiban ciptaan Allah di dunia & akhirat.
class KebesaranScreen extends StatelessWidget {
  const KebesaranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    return Scaffold(
      appBar:
          AppBar(title: Text('🌍 ${s.t('Kebesaran Allah', "Allah's Greatness")}')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: kebesaranItems.length,
        itemBuilder: (context, i) {
          final item = kebesaranItems[i];
          final text = s.isMs ? item.textMs : item.textEn;
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: Material(
              color: AppTheme.cardColors[i % AppTheme.cardColors.length],
              borderRadius: BorderRadius.circular(24),
              child: InkWell(
                borderRadius: BorderRadius.circular(24),
                onTap: () => learnTap(
                  context,
                  module: 'kebesaran',
                  id: item.id,
                  total: kebesaranItems.length,
                  text: text,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.emoji, style: const TextStyle(fontSize: 40)),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              s.isMs ? item.titleMs : item.titleEn,
                              style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w800,
                                  color: AppTheme.textDark),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              text,
                              style: const TextStyle(
                                  fontSize: 14, color: AppTheme.textDark),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.volume_up, color: AppTheme.textDark),
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
