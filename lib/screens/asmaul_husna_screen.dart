import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../services/app_settings.dart';
import '../services/audio_service.dart';
import '../services/rewards_service.dart';
import '../theme/app_theme.dart';

/// Modul 99 Nama Allah (Asmaul Husna) dengan sebutan & maksud.
class AsmaulHusnaScreen extends StatelessWidget {
  const AsmaulHusnaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    return Scaffold(
      appBar:
          AppBar(title: Text('☪️ ${s.t('99 Nama Allah', '99 Names of Allah')}')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: asmaulHusnaItems.length,
        itemBuilder: (context, i) {
          final item = asmaulHusnaItems[i];
          final meaning = s.isMs ? item.meaningMs : item.meaningEn;
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Material(
              color: AppTheme.cardColors[i % AppTheme.cardColors.length],
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  AudioService.instance.speakArabic(item.arabic);
                  final justCompleted = RewardsService.instance.markExplored(
                      'asmaul_husna', '${item.number}',
                      asmaulHusnaItems.length);
                  if (justCompleted) {
                    AudioService.instance.ding();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(s.t(
                            '🎉 Tahniah! 99 Nama Allah diterokai! +3 ⭐',
                            '🎉 Well done! All 99 Names explored! +3 ⭐')),
                      ),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: Text('${item.number}',
                            style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w900,
                                color: AppTheme.textDark)),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.arabic,
                                textDirection: TextDirection.rtl,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: AppTheme.textDark)),
                            const SizedBox(height: 2),
                            Text(
                              '${item.transliteration} — $meaning',
                              style: const TextStyle(
                                  fontSize: 13, color: AppTheme.textDark),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.volume_up,
                          color: AppTheme.textDark, size: 20),
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
