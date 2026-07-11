import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../services/app_settings.dart';
import '../services/audio_service.dart';
import '../theme/app_theme.dart';

/// Fungsi seronok: panggil nama anak dengan pelbagai gaya suara comel.
class NameCallScreen extends StatefulWidget {
  const NameCallScreen({super.key});

  @override
  State<NameCallScreen> createState() => _NameCallScreenState();
}

class _NameCallScreenState extends State<NameCallScreen> {
  int _nameIndex = 0;

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    final name = childNameOptions[_nameIndex];
    return Scaffold(
      appBar: AppBar(title: Text('🥰 ${s.t('Panggil Nama Sayang', "Call My Sweetie")}')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              s.t('Pilih nama:', 'Choose a name:'),
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textDark),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: [
                for (var i = 0; i < childNameOptions.length; i++)
                  ChoiceChip(
                    label: Text(childNameOptions[i].label),
                    selected: _nameIndex == i,
                    onSelected: (_) => setState(() => _nameIndex = i),
                  ),
              ],
            ),
            const SizedBox(height: 28),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFFFFE1F0),
                borderRadius: BorderRadius.circular(28),
              ),
              child: Column(
                children: [
                  const Text('💗', style: TextStyle(fontSize: 48)),
                  const SizedBox(height: 8),
                  Text(
                    name.label,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                        color: AppTheme.textDark),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              s.t('Pilih gaya suara:', 'Choose a voice style:'),
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textDark),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                children: [
                  for (var i = 0; i < voiceStyles.length; i++)
                    _VoiceButton(
                      style: voiceStyles[i],
                      color: AppTheme.cardColors[
                          i % AppTheme.cardColors.length],
                      onTap: () => AudioService.instance.speakStyled(
                        name.nameToSpeak,
                        pitch: voiceStyles[i].pitch,
                        rate: voiceStyles[i].rate,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _VoiceButton extends StatelessWidget {
  final VoiceStyle style;
  final Color color;
  final VoidCallback onTap;
  const _VoiceButton(
      {required this.style, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(style.emoji, style: const TextStyle(fontSize: 40)),
            const SizedBox(height: 6),
            Text(
              s.isMs ? style.labelMs : style.labelEn,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.textDark),
            ),
          ],
        ),
      ),
    );
  }
}
