import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../services/app_settings.dart';
import '../services/audio_service.dart';
import '../theme/app_theme.dart';

/// Zon Bayi: tekan objek -> keluar bunyi & animasi (sebab-akibat).
class BabySoundsScreen extends StatefulWidget {
  const BabySoundsScreen({super.key});

  @override
  State<BabySoundsScreen> createState() => _BabySoundsScreenState();
}

class _BabySoundsScreenState extends State<BabySoundsScreen> {
  int? _bouncing;

  Future<void> _play(int i) async {
    final item = babySoundItems[i];
    AudioService.instance.pop();
    setState(() => _bouncing = i);
    AudioService.instance.speak(item.sound);
    await Future.delayed(const Duration(milliseconds: 400));
    if (mounted) setState(() => _bouncing = null);
  }

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    return Scaffold(
      appBar: AppBar(title: Text('🔊 ${s.t('Bunyi Seronok', 'Fun Sounds')}')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        itemCount: babySoundItems.length,
        itemBuilder: (context, i) {
          final item = babySoundItems[i];
          return GestureDetector(
            onTap: () => _play(i),
            child: AnimatedScale(
              scale: _bouncing == i ? 1.18 : 1.0,
              duration: const Duration(milliseconds: 200),
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.cardColors[i % AppTheme.cardColors.length],
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: AppTheme.softShadow(opacity: 0.08),
                ),
                child: Center(
                  child: Text(item.emoji, style: const TextStyle(fontSize: 48)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
