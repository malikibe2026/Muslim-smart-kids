import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'services/app_settings.dart';
import 'services/audio_service.dart';
import 'services/rewards_service.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSettings.instance.load();
  await RewardsService.instance.load();
  await AudioService.instance.init();
  runApp(const MuslimSmartKidsApp());
}

class MuslimSmartKidsApp extends StatelessWidget {
  const MuslimSmartKidsApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Bina semula seluruh aplikasi apabila tetapan (bahasa) berubah.
    return AnimatedBuilder(
      animation: AppSettings.instance,
      builder: (context, _) => MaterialApp(
        title: 'Muslim Smart Kids',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        home: const HomeScreen(),
      ),
    );
  }
}
