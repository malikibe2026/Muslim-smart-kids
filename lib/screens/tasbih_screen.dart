import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/app_data.dart';
import '../services/app_settings.dart';
import '../services/audio_service.dart';
import '../theme/app_theme.dart';

/// Tasbih Digital - ketuk untuk kira zikir, kiraan disimpan.
class TasbihScreen extends StatefulWidget {
  const TasbihScreen({super.key});

  @override
  State<TasbihScreen> createState() => _TasbihScreenState();
}

class _TasbihScreenState extends State<TasbihScreen> {
  int _zikirIndex = 0;
  final Map<String, int> _counts = {};
  SharedPreferences? _prefs;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    _prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    setState(() {
      for (final z in zikirItems) {
        _counts[z.id] = _prefs?.getInt('tasbih_${z.id}') ?? 0;
      }
    });
  }

  void _tap() {
    final z = zikirItems[_zikirIndex];
    AudioService.instance.pop();
    setState(() => _counts[z.id] = (_counts[z.id] ?? 0) + 1);
    _prefs?.setInt('tasbih_${z.id}', _counts[z.id]!);
    final count = _counts[z.id]!;
    if (count % 33 == 0) {
      AudioService.instance.ding();
    }
  }

  void _reset() {
    final z = zikirItems[_zikirIndex];
    setState(() => _counts[z.id] = 0);
    _prefs?.setInt('tasbih_${z.id}', 0);
  }

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    final z = zikirItems[_zikirIndex];
    final count = _counts[z.id] ?? 0;
    return Scaffold(
      appBar: AppBar(
        title: Text('📿 ${s.t('Tasbih Digital', 'Digital Tasbih')}'),
        actions: [
          IconButton(
            tooltip: s.t('Set semula', 'Reset'),
            icon: const Icon(Icons.refresh),
            onPressed: _reset,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Wrap(
              spacing: 8,
              alignment: WrapAlignment.center,
              children: [
                for (var i = 0; i < zikirItems.length; i++)
                  ChoiceChip(
                    label: Text(zikirItems[i].rumi),
                    selected: _zikirIndex == i,
                    onSelected: (_) => setState(() => _zikirIndex = i),
                  ),
              ],
            ),
            const SizedBox(height: 20),
            Text(z.arabic,
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.textDark)),
            Text(
              s.isMs ? z.meaningMs : z.meaningEn,
              style: const TextStyle(fontSize: 15, color: AppTheme.textDark),
            ),
            const SizedBox(height: 20),
            // Butang kira besar.
            Expanded(
              child: Center(
                child: GestureDetector(
                  onTap: _tap,
                  child: Container(
                    width: 220,
                    height: 220,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: AppTheme.heroGradient,
                      boxShadow: AppTheme.softShadow(opacity: 0.25),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('$count',
                            style: const TextStyle(
                                fontSize: 64,
                                fontWeight: FontWeight.w900,
                                color: Colors.white)),
                        Text(s.t('Ketuk untuk kira', 'Tap to count'),
                            style: const TextStyle(
                                fontSize: 14, color: Colors.white70)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Text(
              s.t('Setiap 33 kali akan berbunyi "ding" 🔔',
                  'Every 33 counts plays a "ding" 🔔'),
              style: const TextStyle(fontSize: 13, color: AppTheme.textDark),
            ),
          ],
        ),
      ),
    );
  }
}
