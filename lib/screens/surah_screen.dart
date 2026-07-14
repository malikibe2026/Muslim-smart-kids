import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../services/app_settings.dart';
import '../services/audio_service.dart';
import '../services/rewards_service.dart';
import '../theme/app_theme.dart';

/// Modul Surah Pendek - teks Arab, rumi & maksud.
class SurahScreen extends StatelessWidget {
  const SurahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    return Scaffold(
      appBar: AppBar(title: Text('📗 ${s.t('Surah Pendek', 'Short Surahs')}')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: surahItems.length,
        itemBuilder: (context, i) {
          final surah = surahItems[i];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: Material(
              color: AppTheme.cardColors[i % AppTheme.cardColors.length],
              borderRadius: BorderRadius.circular(24),
              child: InkWell(
                borderRadius: BorderRadius.circular(24),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => SurahDetailScreen(item: surah)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Text(surah.nameArabic,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.textDark)),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Text(surah.nameMs,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: AppTheme.textDark)),
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

class SurahDetailScreen extends StatefulWidget {
  final SurahItem item;
  const SurahDetailScreen({super.key, required this.item});

  @override
  State<SurahDetailScreen> createState() => _SurahDetailScreenState();
}

class _SurahDetailScreenState extends State<SurahDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final justCompleted = RewardsService.instance
          .markExplored('surah', widget.item.id, surahItems.length);
      if (justCompleted && mounted) {
        AudioService.instance.ding();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppSettings.instance.t(
                '🎉 Tahniah! Semua surah diterokai! +3 ⭐',
                '🎉 Well done! All surahs explored! +3 ⭐')),
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
      appBar: AppBar(title: Text(item.nameMs)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: AppTheme.softShadow(opacity: 0.06),
            ),
            child: Text(
              item.arabic,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 26, height: 2.0, color: AppTheme.textDark),
            ),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFE3F5EB),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(item.rumi,
                style: const TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    height: 1.6,
                    color: AppTheme.textDark)),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF3D6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              s.isMs ? item.meaningMs : item.meaningEn,
              style: const TextStyle(
                  fontSize: 15, height: 1.5, color: AppTheme.textDark),
            ),
          ),
          const SizedBox(height: 18),
          FilledButton.icon(
            icon: const Icon(Icons.volume_up, size: 26),
            label: Text(s.t('Dengar Bacaan Qari', 'Listen to Qari')),
            onPressed: () async {
              final usedQari = await AudioService.instance
                  .playQariOrTts(item.id, item.arabic);
              if (!usedQari && context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(s.t(
                        'Rakaman qari tiada — guna TTS (pengenalan sahaja)',
                        'Qari recording not found — using TTS (familiarisation only)')),
                    duration: const Duration(seconds: 2),
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            icon: const Icon(Icons.stop, size: 22),
            label: Text(s.t('Henti', 'Stop')),
            onPressed: () => AudioService.instance.stopSfx(),
          ),
          const SizedBox(height: 8),
          Text(
            s.t('🎧 Bacaan qari sebenar disertakan untuk semua surah. Untuk hafazan formal, belajar bersama guru.',
                '🎧 Real qari recitation is included for all surahs. For formal memorisation, learn with a teacher.'),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12.5, color: AppTheme.textDark),
          ),
        ],
      ),
    );
  }
}
