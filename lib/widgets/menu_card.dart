import 'package:flutter/material.dart';

import '../services/audio_service.dart';
import '../theme/app_theme.dart';

/// Kad menu halaman utama: ikon emoji besar + label.
class MenuCard extends StatelessWidget {
  final String emoji;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const MenuCard({
    super.key,
    required this.emoji,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(28),
      child: InkWell(
        borderRadius: BorderRadius.circular(28),
        onTap: () {
          AudioService.instance.pop();
          onTap();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 52)),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.textDark,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
