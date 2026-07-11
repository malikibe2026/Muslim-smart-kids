import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../services/app_settings.dart';
import '../services/audio_service.dart';
import '../services/rewards_service.dart';
import '../theme/app_theme.dart';

/// Modul Kisah 25 Rasul.
class ProphetsScreen extends StatelessWidget {
  const ProphetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    return Scaffold(
      appBar: AppBar(
          title: Text('📖 ${s.t('Kisah 25 Rasul', 'Stories of 25 Prophets')}')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: prophetItems.length,
        itemBuilder: (context, i) {
          final item = prophetItems[i];
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Material(
              color: AppTheme.cardColors[i % AppTheme.cardColors.length],
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ProphetDetailScreen(index: i)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.white,
                        child: Text('${i + 1}',
                            style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                color: AppTheme.textDark)),
                      ),
                      const SizedBox(width: 12),
                      Text(item.emoji, style: const TextStyle(fontSize: 30)),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          s.isMs ? item.nameMs : item.nameEn,
                          style: const TextStyle(
                              fontSize: 16,
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

class ProphetDetailScreen extends StatefulWidget {
  final int index;
  const ProphetDetailScreen({super.key, required this.index});

  @override
  State<ProphetDetailScreen> createState() => _ProphetDetailScreenState();
}

class _ProphetDetailScreenState extends State<ProphetDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final item = prophetItems[widget.index];
      final justCompleted = RewardsService.instance.markExplored(
          'prophets', item.nameEn, prophetItems.length);
      if (justCompleted && mounted) {
        AudioService.instance.ding();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppSettings.instance.t(
                '🎉 Tahniah! Semua kisah rasul diterokai! +3 ⭐',
                '🎉 Well done! All prophet stories explored! +3 ⭐')),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    final item = prophetItems[widget.index];
    final story = s.isMs ? item.storyMs : item.storyEn;
    return Scaffold(
      appBar: AppBar(title: Text(s.isMs ? item.nameMs : item.nameEn)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: 140,
              height: 140,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppTheme.cardColors[
                    widget.index % AppTheme.cardColors.length],
                shape: BoxShape.circle,
              ),
              child: Text(item.emoji, style: const TextStyle(fontSize: 72)),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.black12),
              ),
              child: Text(
                story,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 18, height: 1.6, color: AppTheme.textDark),
              ),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              icon: const Icon(Icons.volume_up, size: 28),
              label: Text(s.t('Dengar Kisah', 'Listen to the Story')),
              onPressed: () => AudioService.instance.speak(story),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton.icon(
                  onPressed: widget.index == 0
                      ? null
                      : () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ProphetDetailScreen(
                                    index: widget.index - 1)),
                          ),
                  icon: const Icon(Icons.arrow_back),
                  label: Text(s.t('Sebelum', 'Previous')),
                ),
                OutlinedButton.icon(
                  onPressed: widget.index == prophetItems.length - 1
                      ? null
                      : () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ProphetDetailScreen(
                                    index: widget.index + 1)),
                          ),
                  icon: const Icon(Icons.arrow_forward),
                  label: Text(s.t('Seterus', 'Next')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
