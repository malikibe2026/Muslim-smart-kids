import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../services/app_settings.dart';
import '../services/rewards_service.dart';
import '../theme/app_theme.dart';

class _ModuleInfo {
  final String key;
  final String emoji;
  final String labelMs;
  final String labelEn;
  final int total;
  const _ModuleInfo(this.key, this.emoji, this.labelMs, this.labelEn, this.total);
}

final List<_ModuleInfo> _modules = [
  _ModuleInfo('abc', '🔤', 'ABC', 'ABC', abcItems.length),
  const _ModuleInfo('numbers', '🔢', 'Nombor', 'Numbers', 20),
  _ModuleInfo('colors', '🎨', 'Warna', 'Colours', colorItems.length),
  _ModuleInfo('shapes', '🔷', 'Bentuk', 'Shapes', shapeItems.length),
  _ModuleInfo('animals', '🐘', 'Haiwan', 'Animals', animalItems.length),
  _ModuleInfo('hijaiyah', '🕌', 'Hijaiyah', 'Hijaiyah', hijaiyahItems.length),
  _ModuleInfo('doa', '🤲', 'Doa Harian', 'Daily Duas', doaItems.length),
  _ModuleInfo('rukun', '🕋', 'Rukun Islam', 'Pillars of Islam', rukunItems.length),
];

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    return Scaffold(
      appBar: AppBar(title: Text('🏆 ${s.t('Ganjaran', 'Rewards')}')),
      body: AnimatedBuilder(
        animation: RewardsService.instance,
        builder: (context, _) {
          final r = RewardsService.instance;
          final nextBadge = RewardsService.badges
              .where((b) => r.stars < b.need)
              .fold<BadgeInfo?>(null, (prev, b) => prev ?? b);
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Jumlah bintang.
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF3B0),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  children: [
                    Text('⭐ ${r.stars}',
                        style: const TextStyle(
                            fontSize: 48, fontWeight: FontWeight.w900)),
                    Text(s.t('Jumlah Bintang', 'Total Stars'),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    if (nextBadge != null) ...[
                      const SizedBox(height: 12),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: LinearProgressIndicator(
                          value: (r.stars / nextBadge.need).clamp(0.0, 1.0),
                          minHeight: 10,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        s.t(
                          '${nextBadge.need - r.stars} bintang lagi untuk ${nextBadge.emoji} ${nextBadge.ms}',
                          '${nextBadge.need - r.stars} more stars for ${nextBadge.emoji} ${nextBadge.en}',
                        ),
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(s.t('Lencana Saya', 'My Badges'),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w800)),
              const SizedBox(height: 10),
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  for (final badge in RewardsService.badges)
                    _BadgeTile(badge: badge, earned: r.stars >= badge.need),
                ],
              ),
              const SizedBox(height: 20),
              Text(s.t('Kemajuan Modul', 'Module Progress'),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w800)),
              const SizedBox(height: 10),
              for (var i = 0; i < _modules.length; i++)
                _ModuleProgressTile(
                  info: _modules[i],
                  color: AppTheme.cardColors[i % AppTheme.cardColors.length],
                ),
            ],
          );
        },
      ),
    );
  }
}

class _BadgeTile extends StatelessWidget {
  final BadgeInfo badge;
  final bool earned;
  const _BadgeTile({required this.badge, required this.earned});

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    return Container(
      decoration: BoxDecoration(
        color: earned ? const Color(0xFFD4F5DD) : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
            opacity: earned ? 1 : 0.35,
            child: Text(badge.emoji, style: const TextStyle(fontSize: 34)),
          ),
          const SizedBox(height: 4),
          Text(
            s.isMs ? badge.ms : badge.en,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: earned ? AppTheme.textDark : Colors.grey,
            ),
          ),
          if (!earned)
            Text('🔒 ${badge.need} ⭐',
                style: const TextStyle(fontSize: 11, color: Colors.grey)),
        ],
      ),
    );
  }
}

class _ModuleProgressTile extends StatelessWidget {
  final _ModuleInfo info;
  final Color color;
  const _ModuleProgressTile({required this.info, required this.color});

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    final r = RewardsService.instance;
    final done = r.exploredCount(info.key).clamp(0, info.total);
    final complete = r.isModuleComplete(info.key);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Text(info.emoji, style: const TextStyle(fontSize: 28)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  s.isMs ? info.labelMs : info.labelEn,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 4),
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: LinearProgressIndicator(
                    value: info.total == 0 ? 0 : done / info.total,
                    minHeight: 8,
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            complete ? '✅' : '$done/${info.total}',
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
