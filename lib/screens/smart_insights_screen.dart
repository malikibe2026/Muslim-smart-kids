import 'package:flutter/material.dart';

import '../services/app_settings.dart';
import '../services/smart_engine.dart';
import '../theme/app_theme.dart';
import 'smart_review_screen.dart';

/// Skrin Ibu Bapa: Wawasan Pintar - papan pemuka kemajuan pembelajaran anak,
/// dikuasakan oleh enjin pembelajaran adaptif (spaced repetition).
/// 100% offline, tiada data dihantar ke mana-mana.
class SmartInsightsScreen extends StatelessWidget {
  const SmartInsightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    return Scaffold(
      appBar:
          AppBar(title: Text('📈 ${s.t('Wawasan Pintar', 'Smart Insights')}')),
      body: AnimatedBuilder(
        animation: SmartEngine.instance,
        builder: (context, _) {
          final engine = SmartEngine.instance;
          final stats = engine.moduleStats();
          final weakest = engine.weakestModules();
          final accuracyPct = (engine.overallAccuracy * 100).round();
          final noDataYet = stats.every((m) => m.trackedItems == 0);

          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: AppTheme.heroGradient,
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: AppTheme.softShadow(opacity: 0.16),
                ),
                child: Row(
                  children: [
                    _StatBlock(
                      emoji: '🔥',
                      value: '${engine.streak}',
                      label: s.t('Hari Berturut', 'Day Streak'),
                    ),
                    _StatBlock(
                      emoji: '📚',
                      value: '${engine.itemsTracked}',
                      label: s.t('Item Dipelajari', 'Items Learned'),
                    ),
                    _StatBlock(
                      emoji: '🎯',
                      value:
                          engine.totalAttempts == 0 ? '–' : '$accuracyPct%',
                      label: s.t('Ketepatan', 'Accuracy'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const SmartReviewScreen()),
                  ),
                  icon: const Icon(Icons.psychology_alt),
                  label:
                      Text(s.t('Mula Semakan Pintar', 'Start Smart Review')),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                s.t(
                  'Enjin pintar pilih soalan secara automatik mengikut apa yang anak paling perlu diulang - sepenuhnya di dalam telefon, tiada internet diperlukan.',
                  "The smart engine automatically picks questions based on what your child needs to review most - fully on-device, no internet needed.",
                ),
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 12.5, color: AppTheme.textDark),
              ),
              const SizedBox(height: 24),
              if (weakest.isNotEmpty) ...[
                Text(s.t('Perlu Perhatian', 'Needs Attention'),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w800)),
                const SizedBox(height: 4),
                Text(
                  s.t(
                    'Modul yang anak masih keliru - sesuai untuk fokus dahulu.',
                    'Modules your child still finds tricky - worth focusing on first.',
                  ),
                  style:
                      const TextStyle(fontSize: 13, color: AppTheme.textDark),
                ),
                const SizedBox(height: 10),
                for (final m in weakest) _ModuleTile(stat: m, highlight: true),
                const SizedBox(height: 20),
              ],
              Text(s.t('Kemajuan Semua Modul', 'All Module Progress'),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w800)),
              const SizedBox(height: 10),
              if (noDataYet)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    s.t(
                      'Belum ada data. Jom mula Semakan Pintar pertama anak!',
                      "No data yet. Let's start your child's first Smart Review!",
                    ),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14),
                  ),
                )
              else
                for (final m in stats) _ModuleTile(stat: m, highlight: false),
            ],
          );
        },
      ),
    );
  }
}

class _StatBlock extends StatelessWidget {
  final String emoji;
  final String value;
  final String label;
  const _StatBlock(
      {required this.emoji, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 4),
          Text(value,
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: Colors.white)),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _ModuleTile extends StatelessWidget {
  final ModuleMastery stat;
  final bool highlight;
  const _ModuleTile({required this.stat, required this.highlight});

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    final display = quizModuleDisplay[stat.module];
    final label =
        display == null ? stat.module : (s.isMs ? display.ms : display.en);
    final emoji = display?.emoji ?? '❓';
    final progress =
        stat.trackedItems == 0 ? 0.0 : stat.avgBox / SmartEngine.maxBox;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: highlight ? const Color(0xFFFFE8C8) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 26)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 8,
                    backgroundColor: Colors.grey.shade200,
                  ),
                ),
                if (stat.dueItems > 0)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      s.t('${stat.dueItems} perlu diulang',
                          '${stat.dueItems} due for review'),
                      style: const TextStyle(
                          fontSize: 11.5, color: AppTheme.textDark),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 4),
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => SmartReviewScreen(onlyModule: stat.module)),
            ),
            icon: const Icon(Icons.play_circle_fill,
                color: AppTheme.accent, size: 30),
            tooltip: s.t('Latih', 'Practice'),
          ),
        ],
      ),
    );
  }
}
