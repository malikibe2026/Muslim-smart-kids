import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/app_data.dart';

/// Satu soalan dalam kolam "Semakan Pintar", diambil secara automatik
/// daripada pelbagai modul pembelajaran sedia ada (ABC, Hijaiyah, Haiwan,
/// dll). Tidak perlu internet / AI - semuanya data yang sudah ada dalam app.
class QuizItem {
  final String module;
  final String id; // Unik dalam modul tersebut.
  final String? emoji; // Huruf/nombor/emoji/teks Arab dipaparkan besar.
  final int? swatchColor; // Digunakan khusus untuk modul Warna.
  final String promptMs;
  final String promptEn;
  final String answerMs;
  final String answerEn;
  final String? speakText; // Teks untuk didengar sebagai petunjuk (opsyenal).
  final String? speakLang; // Cth. 'ar' untuk bacaan Arab.

  const QuizItem({
    required this.module,
    required this.id,
    this.emoji,
    this.swatchColor,
    required this.promptMs,
    required this.promptEn,
    required this.answerMs,
    required this.answerEn,
    this.speakText,
    this.speakLang,
  });

  /// Kunci unik merentas semua modul - digunakan untuk simpan kemajuan.
  String get key => '$module#$id';
}

/// Rekod penguasaan satu item, menggunakan kaedah "kotak Leitner"
/// (spaced repetition ringkas): kotak 0 = baru/lemah, kotak 5 = dikuasai.
class _Mastery {
  int box;
  int dueAt; // Bila patut diulang semula (epoch ms).
  int seen;
  int correct;
  int lastSeenAt;

  _Mastery({
    this.box = 0,
    required this.dueAt,
    this.seen = 0,
    this.correct = 0,
    this.lastSeenAt = 0,
  });

  Map<String, dynamic> toJson() =>
      {'b': box, 'd': dueAt, 's': seen, 'c': correct, 'l': lastSeenAt};

  static _Mastery fromJson(Map<String, dynamic> j) => _Mastery(
        box: j['b'] as int? ?? 0,
        dueAt: j['d'] as int? ?? 0,
        seen: j['s'] as int? ?? 0,
        correct: j['c'] as int? ?? 0,
        lastSeenAt: j['l'] as int? ?? 0,
      );
}

/// Ringkasan kemajuan satu modul - untuk skrin Wawasan Pintar (ibu bapa).
class ModuleMastery {
  final String module;
  final int totalItems;
  final int trackedItems;
  final int masteredItems;
  final int dueItems;
  final double avgBox; // 0.0 - 5.0, purata kotak penguasaan.
  const ModuleMastery({
    required this.module,
    required this.totalItems,
    required this.trackedItems,
    required this.masteredItems,
    required this.dueItems,
    required this.avgBox,
  });
}

/// Maklumat paparan ringkas untuk setiap modul kuiz (emoji + label dwibahasa).
class ModuleDisplay {
  final String emoji;
  final String ms;
  final String en;
  const ModuleDisplay(this.emoji, this.ms, this.en);
}

/// Label paparan untuk setiap modul yang disertakan dalam kolam Semakan Pintar.
const Map<String, ModuleDisplay> quizModuleDisplay = {
  'abc': ModuleDisplay('🔤', 'ABC', 'ABC'),
  'numbers': ModuleDisplay('🔢', 'Nombor', 'Numbers'),
  'colors': ModuleDisplay('🎨', 'Warna', 'Colours'),
  'shapes': ModuleDisplay('🔷', 'Bentuk', 'Shapes'),
  'animals': ModuleDisplay('🐘', 'Haiwan', 'Animals'),
  'hijaiyah': ModuleDisplay('🕌', 'Huruf Hijaiyah', 'Hijaiyah Letters'),
  'doa': ModuleDisplay('🤲', 'Doa Harian', 'Daily Duas'),
  'rukun': ModuleDisplay('🕋', 'Rukun Islam', 'Pillars of Islam'),
  'asmaul_husna': ModuleDisplay('☪️', '99 Nama Allah', '99 Names of Allah'),
  'bodyparts': ModuleDisplay('🧍', 'Anggota Badan', 'Body Parts'),
  'fruits': ModuleDisplay('🍎', 'Buah & Sayur', 'Fruits & Veggies'),
  'vehicles': ModuleDisplay('🚗', 'Kenderaan', 'Vehicles'),
  'opposites': ModuleDisplay('🔄', 'Lawan Kata', 'Opposites'),
  'family': ModuleDisplay('👨‍👩‍👧', 'Keluarga', 'Family'),
  'weather': ModuleDisplay('☀️', 'Cuaca', 'Weather'),
  'prophet_names': ModuleDisplay('🧕', 'Nama-nama Rasul', 'Names of Prophets'),
};

/// Enjin Pembelajaran Adaptif - 100% offline, tiada AI/internet diperlukan.
///
/// Guna kaedah "spaced repetition" (kotak Leitner) untuk kesan item yang
/// anak kuat/lemah secara automatik, simpan kemajuan dalam telefon sahaja,
/// dan cadangkan semakan yang paling berguna setiap hari.
class SmartEngine extends ChangeNotifier {
  SmartEngine._();
  static final SmartEngine instance = SmartEngine._();

  static const int maxBox = 5;
  // Jarak hari sebelum diulang semula, mengikut kotak 0..5.
  static const List<int> _intervalDays = [0, 1, 2, 4, 7, 15];
  static const int _oneDayMs = 86400000;

  final Map<String, _Mastery> _progress = {};
  final Random _random = Random();

  int streak = 0;
  String _lastActiveDate = '';
  int totalSessions = 0;
  bool _loaded = false;

  List<QuizItem>? _poolCache;

  /// Kolam soalan penuh, dibina sekali sahaja daripada semua modul yang sesuai.
  List<QuizItem> get pool => _poolCache ??= _buildPool();

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString('smart_progress_v1');
    if (raw != null) {
      try {
        final map = jsonDecode(raw) as Map<String, dynamic>;
        _progress.clear();
        map.forEach((k, v) {
          _progress[k] = _Mastery.fromJson(v as Map<String, dynamic>);
        });
      } catch (_) {
        // Abaikan data rosak - mula semula dengan senarai kosong.
      }
    }
    streak = prefs.getInt('smart_streak') ?? 0;
    _lastActiveDate = prefs.getString('smart_last_active') ?? '';
    totalSessions = prefs.getInt('smart_sessions') ?? 0;
    _loaded = true;
    notifyListeners();
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    final map = <String, dynamic>{};
    _progress.forEach((k, v) => map[k] = v.toJson());
    await prefs.setString('smart_progress_v1', jsonEncode(map));
    await prefs.setInt('smart_streak', streak);
    await prefs.setString('smart_last_active', _lastActiveDate);
    await prefs.setInt('smart_sessions', totalSessions);
  }

  String _today() {
    final n = DateTime.now();
    return '${n.year}-${n.month.toString().padLeft(2, '0')}-${n.day.toString().padLeft(2, '0')}';
  }

  /// Kemas kini "streak" hari berturut-turut anak guna aplikasi.
  /// Selamat dipanggil berulang kali - hanya dikira sekali sehari.
  void touchStreak() {
    if (!_loaded) return;
    final today = _today();
    if (_lastActiveDate == today) return;
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    final yStr = '${yesterday.year}-${yesterday.month.toString().padLeft(2, '0')}-'
        '${yesterday.day.toString().padLeft(2, '0')}';
    streak = (_lastActiveDate == yStr) ? streak + 1 : 1;
    _lastActiveDate = today;
    _save();
    notifyListeners();
  }

  /// Rekod satu jawapan (betul/salah) untuk satu item & kemas kini jadual ulangan.
  void recordAttempt(QuizItem item, bool correct) {
    final now = DateTime.now().millisecondsSinceEpoch;
    final rec = _progress.putIfAbsent(item.key, () => _Mastery(dueAt: now));
    rec.seen++;
    if (correct) {
      rec.correct++;
      rec.box = min(rec.box + 1, maxBox);
    } else {
      rec.box = 0; // Salah - kembali ke kotak paling awal, diulang esok.
    }
    rec.lastSeenAt = now;
    rec.dueAt = now + _intervalDays[rec.box] * _oneDayMs;
    _save();
    notifyListeners();
  }

  /// Pilih [count] soalan paling berguna untuk sesi semakan sekarang,
  /// diseimbangkan merentas modul (supaya tidak berat sebelah ke satu modul
  /// besar seperti 99 Nama Allah), dan mengutamakan item lemah/tertunggak.
  /// [onlyModule] - jika diberi, hanya pilih daripada satu modul sahaja.
  List<QuizItem> pickSession({int count = 10, String? onlyModule}) {
    final now = DateTime.now().millisecondsSinceEpoch;
    final source = onlyModule == null
        ? pool
        : pool.where((e) => e.module == onlyModule).toList();

    final byModule = <String, List<QuizItem>>{};
    for (final item in source) {
      byModule.putIfAbsent(item.module, () => []).add(item);
    }

    num urgency(QuizItem item) {
      final rec = _progress[item.key];
      if (rec == null) return -1000000; // Belum pernah dicuba - paling utama.
      final overdueMs = now - rec.dueAt;
      // Kotak rendah + lebih lewat ditinjau semula = lebih utama (nombor kecil).
      return -(rec.box * 1000000) - overdueMs;
    }

    final moduleKeys = byModule.keys.toList()..shuffle(_random);
    for (final m in moduleKeys) {
      byModule[m]!.sort((a, b) => urgency(a).compareTo(urgency(b)));
    }

    final chosen = <QuizItem>[];
    var rank = 0;
    var hasMore = true;
    while (chosen.length < count && hasMore) {
      hasMore = false;
      for (final m in moduleKeys) {
        if (chosen.length >= count) break;
        final list = byModule[m]!;
        if (rank < list.length) {
          chosen.add(list[rank]);
          if (rank + 1 < list.length) hasMore = true;
        }
      }
      rank++;
    }
    chosen.shuffle(_random);
    totalSessions++;
    _save();
    return chosen.take(count).toList();
  }

  /// Bina [optionCount] pilihan jawapan (termasuk jawapan betul) untuk satu
  /// soalan, diambil secara rawak daripada item lain dalam modul yang sama.
  List<QuizItem> buildOptions(QuizItem correct, int optionCount) {
    final sameModule = pool
        .where((e) => e.module == correct.module && e.id != correct.id)
        .toList()
      ..shuffle(_random);
    final distractors = sameModule.take(optionCount - 1).toList();
    final options = <QuizItem>[correct, ...distractors];
    options.shuffle(_random);
    return options;
  }

  /// Cadangan ringkas untuk banner "Cadangan Pintar Hari Ini" di skrin utama.
  /// Pulangkan null jika enjin belum sedia (jarang berlaku).
  String? dailyRecommendation(bool isMs) {
    if (!_loaded) return null;
    final now = DateTime.now().millisecondsSinceEpoch;
    var dueCount = 0;
    var newCount = 0;
    for (final item in pool) {
      final rec = _progress[item.key];
      if (rec == null) {
        newCount++;
      } else if (rec.dueAt <= now) {
        dueCount++;
      }
    }
    if (dueCount >= 5) {
      return isMs
          ? '$dueCount soalan sedia untuk diulang kaji hari ini.'
          : '$dueCount questions are ready to review today.';
    }
    if (_progress.isEmpty) {
      return isMs
          ? 'Jom mula Semakan Pintar pertama anak! 🎉'
          : "Let's start your child's first Smart Review! 🎉";
    }
    if (newCount > 0) {
      return isMs
          ? 'Cuba beberapa soalan baru untuk tambah ilmu hari ini.'
          : 'Try a few new questions to learn something new today.';
    }
    return isMs
        ? 'Hebat! Semua soalan dikuasai buat masa ini. 🎉'
        : 'Amazing! Everything is mastered for now. 🎉';
  }

  /// Statistik kemajuan setiap modul (ikut urutan kurikulum), untuk skrin
  /// Wawasan Pintar.
  List<ModuleMastery> moduleStats() {
    final now = DateTime.now().millisecondsSinceEpoch;
    final byModule = <String, List<QuizItem>>{};
    for (final item in pool) {
      byModule.putIfAbsent(item.module, () => []).add(item);
    }
    final result = <ModuleMastery>[];
    byModule.forEach((module, items) {
      var tracked = 0;
      var mastered = 0;
      var due = 0;
      var boxSum = 0;
      for (final item in items) {
        final rec = _progress[item.key];
        if (rec == null) continue;
        tracked++;
        boxSum += rec.box;
        if (rec.box >= maxBox) mastered++;
        if (rec.dueAt <= now) due++;
      }
      result.add(ModuleMastery(
        module: module,
        totalItems: items.length,
        trackedItems: tracked,
        masteredItems: mastered,
        dueItems: due,
        avgBox: tracked == 0 ? 0.0 : boxSum / tracked,
      ));
    });
    return result;
  }

  /// Modul paling lemah (sudah dicuba sekurang-kurangnya 3 kali, purata kotak
  /// paling rendah dahulu) - panduan ringkas untuk ibu bapa fokus pada apa.
  List<ModuleMastery> weakestModules({int count = 3}) {
    final tracked = moduleStats().where((m) => m.trackedItems >= 3).toList();
    tracked.sort((a, b) => a.avgBox.compareTo(b.avgBox));
    return tracked.take(count).toList();
  }

  int get totalAttempts => _progress.values.fold(0, (sum, r) => sum + r.seen);
  int get totalCorrect => _progress.values.fold(0, (sum, r) => sum + r.correct);
  double get overallAccuracy =>
      totalAttempts == 0 ? 0.0 : totalCorrect / totalAttempts;
  int get itemsMastered =>
      _progress.values.where((r) => r.box >= maxBox).length;
  int get itemsTracked => _progress.length;

  List<QuizItem> _buildPool() {
    final list = <QuizItem>[];

    for (final a in abcItems) {
      list.add(QuizItem(
        module: 'abc',
        id: a.letter,
        emoji: a.letter,
        promptMs: 'Apa bermula dengan huruf ini?',
        promptEn: 'What starts with this letter?',
        answerMs: a.msWord,
        answerEn: a.enWord,
        speakText: a.letter,
      ));
    }

    for (var i = 0; i < numberWordsMs.length; i++) {
      list.add(QuizItem(
        module: 'numbers',
        id: '${i + 1}',
        emoji: '${i + 1}',
        promptMs: 'Nombor berapa ini?',
        promptEn: 'What number is this?',
        answerMs: numberWordsMs[i],
        answerEn: numberWordsEn[i],
      ));
    }

    for (final c in colorItems) {
      list.add(QuizItem(
        module: 'colors',
        id: c.ms,
        swatchColor: c.value,
        promptMs: 'Apa warna ini?',
        promptEn: 'What colour is this?',
        answerMs: c.ms,
        answerEn: c.en,
      ));
    }

    const shapeEmoji = {
      'Bulatan': '🔵',
      'Segi Empat': '🟦',
      'Segi Tiga': '🔺',
      'Bintang': '⭐',
      'Hati': '❤️',
    };
    for (final sh in shapeItems) {
      list.add(QuizItem(
        module: 'shapes',
        id: sh.ms,
        emoji: shapeEmoji[sh.ms] ?? '🔷',
        promptMs: 'Apa bentuk ini?',
        promptEn: 'What shape is this?',
        answerMs: sh.ms,
        answerEn: sh.en,
      ));
    }

    for (final a in animalItems) {
      list.add(QuizItem(
        module: 'animals',
        id: a.ms,
        emoji: a.emoji,
        promptMs: 'Apa haiwan ini?',
        promptEn: 'What animal is this?',
        answerMs: a.ms,
        answerEn: a.en,
        speakText: a.sound,
      ));
    }

    for (final h in hijaiyahItems) {
      list.add(QuizItem(
        module: 'hijaiyah',
        id: h.char,
        emoji: h.char,
        promptMs: 'Apa nama huruf ini?',
        promptEn: 'What is this letter called?',
        answerMs: h.name,
        answerEn: h.name,
        speakText: h.arName,
        speakLang: 'ar',
      ));
    }

    for (final d in doaItems) {
      list.add(QuizItem(
        module: 'doa',
        id: d.id,
        emoji: d.emoji,
        promptMs: 'Doa ini dibaca bila?',
        promptEn: 'When do we recite this dua?',
        answerMs: d.titleMs,
        answerEn: d.titleEn,
        speakText: d.arabic,
        speakLang: 'ar',
      ));
    }

    for (final r in rukunItems) {
      list.add(QuizItem(
        module: 'rukun',
        id: r.titleMs,
        emoji: r.emoji,
        promptMs: 'Rukun Islam yang mana ini?',
        promptEn: 'Which Pillar of Islam is this?',
        answerMs: r.titleMs,
        answerEn: r.titleEn,
      ));
    }

    for (final a in asmaulHusnaItems) {
      list.add(QuizItem(
        module: 'asmaul_husna',
        id: '${a.number}',
        emoji: a.arabic,
        promptMs: 'Nama Allah ini bermaksud?',
        promptEn: 'This name of Allah means?',
        answerMs: a.meaningMs,
        answerEn: a.meaningEn,
        speakText: a.arabic,
        speakLang: 'ar',
      ));
    }

    for (final b in bodyPartItems) {
      list.add(QuizItem(
        module: 'bodyparts',
        id: b.ms,
        emoji: b.emoji,
        promptMs: 'Apa nama anggota badan ini?',
        promptEn: 'What is this body part called?',
        answerMs: b.ms,
        answerEn: b.en,
      ));
    }

    for (final f in fruitItems) {
      list.add(QuizItem(
        module: 'fruits',
        id: f.ms,
        emoji: f.emoji,
        promptMs: 'Apa ini?',
        promptEn: 'What is this?',
        answerMs: f.ms,
        answerEn: f.en,
        speakText: f.sound,
      ));
    }

    for (final v in vehicleItems) {
      list.add(QuizItem(
        module: 'vehicles',
        id: v.ms,
        emoji: v.emoji,
        promptMs: 'Apa kenderaan ini?',
        promptEn: 'What vehicle is this?',
        answerMs: v.ms,
        answerEn: v.en,
        speakText: v.sound,
      ));
    }

    for (final o in oppositeItems) {
      list.add(QuizItem(
        module: 'opposites',
        id: '${o.ms1}_1',
        emoji: o.emoji1,
        promptMs: 'Apa lawan bagi "${o.ms1}"?',
        promptEn: 'What is the opposite of "${o.en1}"?',
        answerMs: o.ms2,
        answerEn: o.en2,
      ));
      list.add(QuizItem(
        module: 'opposites',
        id: '${o.ms2}_2',
        emoji: o.emoji2,
        promptMs: 'Apa lawan bagi "${o.ms2}"?',
        promptEn: 'What is the opposite of "${o.en2}"?',
        answerMs: o.ms1,
        answerEn: o.en1,
      ));
    }

    for (final f in familyItems) {
      list.add(QuizItem(
        module: 'family',
        id: f.ms,
        emoji: f.emoji,
        promptMs: 'Siapa ini?',
        promptEn: 'Who is this?',
        answerMs: f.ms,
        answerEn: f.en,
      ));
    }

    for (final w in weatherItems) {
      list.add(QuizItem(
        module: 'weather',
        id: w.ms,
        emoji: w.emoji,
        promptMs: 'Cuaca apa ini?',
        promptEn: 'What weather is this?',
        answerMs: w.ms,
        answerEn: w.en,
      ));
    }

    for (final p in prophetNameItems) {
      list.add(QuizItem(
        module: 'prophet_names',
        id: p.nameMs,
        emoji: p.emoji,
        promptMs: 'Siapa nama Nabi/Rasul ini?',
        promptEn: 'Who is this Prophet?',
        answerMs: p.nameMs,
        answerEn: p.nameEn,
        speakText: p.arabic,
        speakLang: 'ar',
      ));
    }

    return list;
  }
}
