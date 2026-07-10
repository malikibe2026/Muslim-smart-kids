import 'package:flutter/material.dart';

import '../services/app_settings.dart';
import '../services/audio_service.dart';
import '../services/rewards_service.dart';

/// Tindakan biasa apabila item pembelajaran ditekan:
/// sebut teks + rekod kemajuan + raikan jika modul lengkap.
void learnTap(
  BuildContext context, {
  required String module,
  required String id,
  required int total,
  required String text,
  String? lang,
}) {
  AudioService.instance.speak(text, lang: lang);
  final justCompleted =
      RewardsService.instance.markExplored(module, id, total);
  if (justCompleted) {
    AudioService.instance.ding();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          AppSettings.instance.t(
            '🎉 Tahniah! Modul selesai! +3 ⭐',
            '🎉 Well done! Module complete! +3 ⭐',
          ),
        ),
      ),
    );
  }
}
