import 'package:flutter/material.dart';

import '../services/app_settings.dart';
import '../services/audio_service.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppSettings.instance,
      builder: (context, _) {
        final s = AppSettings.instance;
        return Scaffold(
          appBar: AppBar(title: Text('⚙️ ${s.t('Tetapan', 'Settings')}')),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    SwitchListTile(
                      secondary: const Text('🎵', style: TextStyle(fontSize: 28)),
                      title: Text(s.t('Muzik Latar', 'Background Music'),
                          style: const TextStyle(fontSize: 18)),
                      value: s.musicOn,
                      onChanged: (v) {
                        s.setMusic(v);
                        AudioService.instance.updateMusic();
                      },
                    ),
                    SwitchListTile(
                      secondary: const Text('🔊', style: TextStyle(fontSize: 28)),
                      title: Text(s.t('Suara & Bunyi', 'Voice & Sounds'),
                          style: const TextStyle(fontSize: 18)),
                      value: s.soundOn,
                      onChanged: s.setSound,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('🌐 ${s.t('Bahasa', 'Language')}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 12),
                      SegmentedButton<String>(
                        segments: const [
                          ButtonSegment(
                              value: 'ms', label: Text('Bahasa Melayu')),
                          ButtonSegment(value: 'en', label: Text('English')),
                        ],
                        selected: {s.language},
                        onSelectionChanged: (set) => s.setLanguage(set.first),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                s.t(
                  'Muslim Smart Kids v1.0\nAplikasi pembelajaran untuk kanak-kanak 1–6 tahun.\nTiada iklan. Boleh digunakan tanpa internet.',
                  'Muslim Smart Kids v1.0\nA learning app for children aged 1–6.\nNo ads. Works fully offline.',
                ),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        );
      },
    );
  }
}
