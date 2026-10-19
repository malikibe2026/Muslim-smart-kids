// Entrypoint KHAS untuk tangkapan skrin video promosi (cawangan video-web).
// Tidak digunakan oleh APK. Buka skrin terus melalui ?s=<nama>.
import 'package:flutter/material.dart';

import 'data/app_data.dart';
import 'games/memory_game.dart';
import 'screens/abc_screen.dart';
import 'screens/animals_screen.dart';
import 'screens/asmaul_husna_screen.dart';
import 'screens/bubbles_screen.dart';
import 'screens/games_menu_screen.dart';
import 'screens/hijaiyah_screen.dart';
import 'screens/home_screen.dart';
import 'screens/lullaby_screen.dart';
import 'screens/smart_insights_screen.dart';
import 'screens/smart_review_screen.dart';
import 'screens/surah_screen.dart';
import 'services/app_settings.dart';
import 'services/audio_service.dart';
import 'services/rewards_service.dart';
import 'services/smart_engine.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSettings.instance.load();
  AppSettings.instance.musicOn = false;
  AppSettings.instance.soundOn = false;
  await RewardsService.instance.load();
  await AudioService.instance.init();
  await SmartEngine.instance.load();
  _seedDemo();
  runApp(const _VideoApp());
}

/// Data contoh supaya Wawasan Pintar & banner ada isi (bukan data sebenar).
void _seedDemo() {
  final e = SmartEngine.instance;
  if (e.itemsTracked > 0) return;
  // Bilangan jawapan betul berturut ikut modul (lebih = lebih dikuasai).
  const plan = {
    'abc': 4, 'numbers': 5, 'colors': 5, 'animals': 4, 'fruits': 3,
    'shapes': 4, 'family': 3, 'hijaiyah': 1, 'doa': 2, 'asmaul_husna': 0,
    'prophet_names': 1, 'bodyparts': 2,
  };
  final counts = <String, int>{};
  for (final item in e.pool) {
    final n = plan[item.module];
    if (n == null) continue;
    final i = counts[item.module] = (counts[item.module] ?? 0) + 1;
    if (i > 14) continue;
    final good = n == 0 ? (i % 3 == 0 ? 1 : 0) : n - (i % 4 == 0 ? 1 : 0);
    for (var k = 0; k < good; k++) {
      e.recordAttempt(item, true);
    }
    if (good < 2) e.recordAttempt(item, false);
  }
  e.streak = 12;
  RewardsService.instance.stars = 86;
}

Widget _target(String s) {
  switch (s) {
    case 'hijaiyah':
      return const HijaiyahScreen();
    case 'surah':
      return SurahDetailScreen(item: surahItems.first);
    case 'asmaul':
      return const AsmaulHusnaScreen();
    case 'abc':
      return const AbcScreen();
    case 'animals':
      return const AnimalsScreen();
    case 'games':
      return const GamesMenuScreen();
    case 'memory':
      return const MemoryGameScreen(level: 2);
    case 'bubbles':
      return const BubblesScreen();
    case 'lullaby':
      return const LullabyScreen();
    case 'review':
      return const SmartReviewScreen();
    case 'insights':
      return const SmartInsightsScreen();
    default:
      return const HomeScreen();
  }
}

class _VideoApp extends StatelessWidget {
  const _VideoApp();

  @override
  Widget build(BuildContext context) {
    final s = Uri.base.queryParameters['s'] ?? 'home';
    return MaterialApp(
      title: 'Humaira Smart Kids',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: s == 'home' ? const HomeScreen() : _Launcher(target: _target(s)),
    );
  }
}

/// Papar HomeScreen di belakang, kemudian tolak skrin sasaran tanpa animasi
/// supaya butang "kembali" kelihatan seperti penggunaan sebenar.
class _Launcher extends StatefulWidget {
  final Widget target;
  const _Launcher({required this.target});

  @override
  State<_Launcher> createState() => _LauncherState();
}

class _LauncherState extends State<_Launcher> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).push(PageRouteBuilder(
        transitionDuration: Duration.zero,
        pageBuilder: (_, __, ___) => widget.target,
      ));
    });
  }

  @override
  Widget build(BuildContext context) => const HomeScreen();
}
