import 'package:flutter/material.dart';

import '../services/app_settings.dart';
import '../services/audio_service.dart';
import '../theme/app_theme.dart';

/// Skrin pilih tahap kesukaran (Mudah / Sederhana / Sukar).
class LevelPickerScreen extends StatelessWidget {
  final String title;
  final Widget Function(int level) builder;

  const LevelPickerScreen({
    super.key,
    required this.title,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    final levels = [
      (1, s.t('Mudah', 'Easy'), '⭐', const Color(0xFFD4F5DD)),
      (2, s.t('Sederhana', 'Medium'), '⭐⭐', const Color(0xFFFFE8C8)),
      (3, s.t('Sukar', 'Hard'), '⭐⭐⭐', const Color(0xFFFFD6E0)),
    ];
    return Scaffold(
      appBar: AppBar(title: Text(title, style: const TextStyle(fontSize: 20))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              s.t('Pilih Tahap', 'Choose a Level'),
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.textDark),
            ),
            const SizedBox(height: 24),
            for (final level in levels)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: SizedBox(
                  width: double.infinity,
                  height: 80,
                  child: Material(
                    color: level.$4,
                    borderRadius: BorderRadius.circular(24),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(24),
                      onTap: () {
                        AudioService.instance.pop();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => builder(level.$1)),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(level.$2,
                              style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  color: AppTheme.textDark)),
                          const SizedBox(width: 12),
                          Text(level.$3,
                              style: const TextStyle(fontSize: 22)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
