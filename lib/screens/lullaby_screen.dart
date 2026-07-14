import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../services/app_settings.dart';
import '../services/audio_service.dart';
import '../theme/app_theme.dart';

/// Zon Bayi: muzik tidur & bunyi menenangkan (loop).
class LullabyScreen extends StatefulWidget {
  const LullabyScreen({super.key});

  @override
  State<LullabyScreen> createState() => _LullabyScreenState();
}

class _LullabyScreenState extends State<LullabyScreen> {
  @override
  void dispose() {
    // Henti loop bila keluar skrin supaya tak bertindih dgn muzik latar.
    AudioService.instance.stopLoop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    final current = AudioService.instance.currentLoop;
    return Scaffold(
      backgroundColor: const Color(0xFF2D2B55),
      appBar: AppBar(
        title: Text('🌙 ${s.t('Muzik Tidur', 'Sleep Sounds')}',
            style: const TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text('💤', style: TextStyle(fontSize: 64)),
            const SizedBox(height: 8),
            Text(
              s.t('Pilih bunyi yang menenangkan untuk si manja tidur',
                  'Choose a calming sound for your little one'),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white70, fontSize: 15),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                children: [
                  for (final loop in loopSounds)
                    _LoopCard(
                      loop: loop,
                      active: current == loop.id,
                      onTap: () async {
                        if (current == loop.id) {
                          await AudioService.instance.stopLoop();
                        } else {
                          await AudioService.instance.playLoop(loop.id);
                        }
                        if (mounted) setState(() {});
                      },
                    ),
                ],
              ),
            ),
            if (current != null)
              FilledButton.icon(
                style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFFFFB4B4)),
                icon: const Icon(Icons.stop),
                label: Text(s.t('Henti', 'Stop')),
                onPressed: () async {
                  await AudioService.instance.stopLoop();
                  if (mounted) setState(() {});
                },
              ),
          ],
        ),
      ),
    );
  }
}

class _LoopCard extends StatelessWidget {
  final LoopSound loop;
  final bool active;
  final VoidCallback onTap;
  const _LoopCard(
      {required this.loop, required this.active, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    return Material(
      color: active ? const Color(0xFF7C77C6) : const Color(0xFF3E3B70),
      borderRadius: BorderRadius.circular(26),
      child: InkWell(
        borderRadius: BorderRadius.circular(26),
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(loop.emoji, style: const TextStyle(fontSize: 44)),
            const SizedBox(height: 8),
            Text(
              s.isMs ? loop.labelMs : loop.labelEn,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w800),
            ),
            if (active)
              const Padding(
                padding: EdgeInsets.only(top: 6),
                child: Text('▶️ Sedang main...',
                    style: TextStyle(color: Colors.white70, fontSize: 12)),
              ),
          ],
        ),
      ),
    );
  }
}
