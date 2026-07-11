import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../services/app_settings.dart';
import '../services/audio_service.dart';
import '../services/rewards_service.dart';
import '../theme/app_theme.dart';

/// Modul lagu kanak-kanak popular dalam Bahasa Inggeris.
class RhymesScreen extends StatelessWidget {
  const RhymesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    return Scaffold(
      appBar: AppBar(
          title: Text('🎵 ${s.t('Lagu Kanak-kanak', 'Nursery Rhymes')}')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: rhymeItems.length,
        itemBuilder: (context, i) {
          final item = rhymeItems[i];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: Material(
              color: AppTheme.cardColors[i % AppTheme.cardColors.length],
              borderRadius: BorderRadius.circular(24),
              child: InkWell(
                borderRadius: BorderRadius.circular(24),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => RhymeDetailScreen(item: item)),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Text(item.emoji, style: const TextStyle(fontSize: 40)),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          item.title,
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                              color: AppTheme.textDark),
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

class RhymeDetailScreen extends StatefulWidget {
  final RhymeItem item;
  const RhymeDetailScreen({super.key, required this.item});

  @override
  State<RhymeDetailScreen> createState() => _RhymeDetailScreenState();
}

class _RhymeDetailScreenState extends State<RhymeDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final justCompleted = RewardsService.instance
          .markExplored('rhymes', widget.item.id, rhymeItems.length);
      if (justCompleted && mounted) {
        AudioService.instance.ding();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppSettings.instance.t(
                '🎉 Tahniah! Semua lagu diterokai! +3 ⭐',
                '🎉 Well done! All songs explored! +3 ⭐')),
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
      appBar: AppBar(title: Text('${item.emoji} ${item.title}')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Text(
                    item.lyrics,
                    style: const TextStyle(
                        fontSize: 19, height: 1.6, color: AppTheme.textDark),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              icon: const Icon(Icons.volume_up, size: 28),
              label: Text(s.t('Dengar Lagu', 'Listen to the Song')),
              onPressed: () =>
                  AudioService.instance.speak(item.lyrics, lang: 'en-US'),
            ),
          ],
        ),
      ),
    );
  }
}
