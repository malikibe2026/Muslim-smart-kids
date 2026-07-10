import 'package:flutter/material.dart';

import '../services/app_settings.dart';
import '../services/audio_service.dart';
import '../services/rewards_service.dart';

/// Dialog kemenangan: beri bintang, mainkan bunyi & tawarkan main semula.
Future<void> showWinDialog(
  BuildContext context, {
  required int stars,
  required VoidCallback onReplay,
}) async {
  RewardsService.instance.addStars(stars);
  AudioService.instance.ding();
  final s = AppSettings.instance;
  await showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      title: Text(
        '🎉 ${s.t('Tahniah!', 'Well Done!')}',
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('⭐' * stars, style: const TextStyle(fontSize: 44)),
          const SizedBox(height: 8),
          Text(
            s.t('Kamu dapat $stars bintang!', 'You earned $stars stars!'),
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(dialogContext);
            onReplay();
          },
          child: Text(s.t('Main Lagi', 'Play Again')),
        ),
        FilledButton(
          onPressed: () {
            Navigator.pop(dialogContext);
            Navigator.pop(context);
          },
          child: Text(s.t('Selesai', 'Done')),
        ),
      ],
    ),
  );
}

/// Teks kemajuan pusingan permainan, cth. "Soalan 2 / 5".
Widget roundProgress(int current, int total) {
  final s = AppSettings.instance;
  return Text(
    '${s.t('Soalan', 'Question')} $current / $total',
    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
  );
}
