import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../services/app_settings.dart';
import '../services/audio_service.dart';
import '../theme/app_theme.dart';
import '../widgets/learn_card.dart';
import '../widgets/learn_helpers.dart';

/// Modul Cuaca & Hari dalam seminggu.
class WeatherDaysScreen extends StatelessWidget {
  const WeatherDaysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    return Scaffold(
      appBar: AppBar(title: Text('☀️ ${s.t('Cuaca & Hari', 'Weather & Days')}')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(s.t('Cuaca', 'Weather'),
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: AppTheme.textDark)),
          const SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: weatherItems.length,
            itemBuilder: (context, i) {
              final item = weatherItems[i];
              final name = s.isMs ? item.ms : item.en;
              return LearnCard(
                color: AppTheme.cardColors[i % AppTheme.cardColors.length],
                onTap: () => learnTap(
                  context,
                  module: 'weather',
                  id: item.en,
                  total: weatherItems.length,
                  text: name,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(item.emoji, style: const TextStyle(fontSize: 36)),
                    const SizedBox(height: 4),
                    Text(name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: AppTheme.textDark)),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          Text(s.t('Hari dalam Seminggu', 'Days of the Week'),
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: AppTheme.textDark)),
          const SizedBox(height: 10),
          for (var i = 0; i < daysMs.length; i++)
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: Material(
                color: AppTheme.cardColors[i % AppTheme.cardColors.length],
                borderRadius: BorderRadius.circular(18),
                child: InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () => AudioService.instance
                      .speak(s.isMs ? daysMs[i] : daysEn[i]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.white,
                          child: Text('${i + 1}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: AppTheme.textDark)),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          s.isMs ? daysMs[i] : daysEn[i],
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: AppTheme.textDark),
                        ),
                        const Spacer(),
                        const Icon(Icons.volume_up,
                            size: 20, color: AppTheme.textDark),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
