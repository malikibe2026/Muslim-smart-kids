import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../services/app_settings.dart';
import '../services/audio_service.dart';
import '../services/rewards_service.dart';
import '../theme/app_theme.dart';

class DoaScreen extends StatelessWidget {
  const DoaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    return Scaffold(
      appBar: AppBar(title: Text('🤲 ${s.t('Doa Harian', 'Daily Duas')}')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: doaItems.length,
        itemBuilder: (context, i) {
          final item = doaItems[i];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: Material(
              color: AppTheme.cardColors[i % AppTheme.cardColors.length],
              borderRadius: BorderRadius.circular(24),
              child: InkWell(
                borderRadius: BorderRadius.circular(24),
                onTap: () {
                  AudioService.instance.pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => DoaDetailScreen(item: item)),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Text(item.emoji, style: const TextStyle(fontSize: 40)),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              s.isMs ? item.titleMs : item.titleEn,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  color: AppTheme.textDark),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item.rumi,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 13,
                                  fontStyle: FontStyle.italic,
                                  color: AppTheme.textDark),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.chevron_right,
                          color: AppTheme.textDark),
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

class DoaDetailScreen extends StatefulWidget {
  final DoaItem item;
  const DoaDetailScreen({super.key, required this.item});

  @override
  State<DoaDetailScreen> createState() => _DoaDetailScreenState();
}

class _DoaDetailScreenState extends State<DoaDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final justCompleted = RewardsService.instance
          .markExplored('doa', widget.item.id, doaItems.length);
      if (justCompleted && mounted) {
        AudioService.instance.ding();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppSettings.instance.t(
                '🎉 Tahniah! Semua doa diterokai! +3 ⭐',
                '🎉 Well done! All duas explored! +3 ⭐')),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    final item = widget.item;
    return Scaffold(
      appBar: AppBar(
        title: Text('${item.emoji} ${s.isMs ? item.titleMs : item.titleEn}',
            style: const TextStyle(fontSize: 19)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Teks Arab.
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFD4F5DD),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Text(
              item.arabic,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                  fontSize: 30, height: 1.9, color: AppTheme.textDark),
            ),
          ),
          const SizedBox(height: 16),
          // Rumi.
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFCDE8FF),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                Text(s.t('Bacaan Rumi', 'Transliteration'),
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w800)),
                const SizedBox(height: 6),
                Text(item.rumi,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        color: AppTheme.textDark)),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Maksud.
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFFFE8C8),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                Text(s.t('Maksud', 'Meaning'),
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w800)),
                const SizedBox(height: 6),
                Text(s.isMs ? item.meaningMs : item.meaningEn,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 17, color: AppTheme.textDark)),
              ],
            ),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            icon: const Icon(Icons.volume_up, size: 28),
            label: Text(s.t('Dengar Doa', 'Listen to the Dua')),
            onPressed: () => AudioService.instance.speakArabic(item.arabic),
          ),
          const SizedBox(height: 10),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(64, 52),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            icon: const Icon(Icons.record_voice_over),
            label: Text(s.t('Dengar Maksud', 'Listen to the Meaning')),
            onPressed: () => AudioService.instance
                .speak(s.isMs ? item.meaningMs : item.meaningEn),
          ),
        ],
      ),
    );
  }
}
