import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Maklumat lencana ganjaran.
class BadgeInfo {
  final String emoji;
  final String ms;
  final String en;
  final int need; // Bintang diperlukan.
  const BadgeInfo(this.emoji, this.ms, this.en, this.need);
}

/// Khidmat ganjaran: bintang, lencana & kemajuan modul.
class RewardsService extends ChangeNotifier {
  RewardsService._();
  static final RewardsService instance = RewardsService._();

  static const List<BadgeInfo> badges = [
    BadgeInfo('🌟', 'Bintang Pertama', 'First Star', 1),
    BadgeInfo('🐣', 'Anak Pintar', 'Smart Chick', 10),
    BadgeInfo('🏅', 'Juara Kecil', 'Little Champ', 25),
    BadgeInfo('🎖️', 'Bijak Bistari', 'Clever Star', 50),
    BadgeInfo('👑', 'Raja Bintang', 'Star King', 100),
    BadgeInfo('🏆', 'Genius Muslim', 'Muslim Genius', 200),
  ];

  int stars = 0;
  final Map<String, Set<String>> _explored = {};
  final Set<String> completedModules = {};

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    stars = prefs.getInt('stars') ?? 0;
    completedModules
      ..clear()
      ..addAll(prefs.getStringList('completedModules') ?? const []);
    for (final key in prefs.getKeys()) {
      if (key.startsWith('explored_')) {
        _explored[key.substring('explored_'.length)] =
            (prefs.getStringList(key) ?? const []).toSet();
      }
    }
    notifyListeners();
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('stars', stars);
    await prefs.setStringList('completedModules', completedModules.toList());
    for (final entry in _explored.entries) {
      await prefs.setStringList('explored_${entry.key}', entry.value.toList());
    }
  }

  void addStars(int n) {
    stars += n;
    _save();
    notifyListeners();
  }

  int exploredCount(String module) => _explored[module]?.length ?? 0;

  bool isModuleComplete(String module) => completedModules.contains(module);

  /// Tanda satu item modul telah diterokai.
  /// Pulangkan `true` jika modul baru sahaja lengkap (bonus +3 bintang).
  bool markExplored(String module, String id, int total) {
    final set = _explored.putIfAbsent(module, () => <String>{});
    set.add(id);
    var justCompleted = false;
    if (set.length >= total && !completedModules.contains(module)) {
      completedModules.add(module);
      stars += 3;
      justCompleted = true;
    }
    _save();
    notifyListeners();
    return justCompleted;
  }
}
