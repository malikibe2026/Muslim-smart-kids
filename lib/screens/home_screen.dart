import 'package:flutter/material.dart';

import '../services/app_settings.dart';
import '../services/audio_service.dart';
import '../theme/app_theme.dart';
import '../widgets/menu_card.dart';
import '../widgets/star_counter.dart';
import 'abc_screen.dart';
import 'animals_screen.dart';
import 'colors_screen.dart';
import 'doa_screen.dart';
import 'games_menu_screen.dart';
import 'hijaiyah_screen.dart';
import 'numbers_screen.dart';
import 'rewards_screen.dart';
import 'rukun_screen.dart';
import 'settings_screen.dart';
import 'shapes_screen.dart';

class _Menu {
  final String emoji;
  final String label;
  final Widget screen;
  const _Menu(this.emoji, this.label, this.screen);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Mula muzik latar selepas paparan pertama.
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => AudioService.instance.updateMusic(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    final menus = <_Menu>[
      const _Menu('🔤', 'ABC', AbcScreen()),
      _Menu('🔢', s.t('Nombor', 'Numbers'), const NumbersScreen()),
      _Menu('🎨', s.t('Warna', 'Colours'), const ColorsScreen()),
      _Menu('🔷', s.t('Bentuk', 'Shapes'), const ShapesScreen()),
      _Menu('🐘', s.t('Haiwan', 'Animals'), const AnimalsScreen()),
      const _Menu('🕌', 'Huruf Hijaiyah', HijaiyahScreen()),
      _Menu('🤲', s.t('Doa Harian', 'Daily Duas'), const DoaScreen()),
      const _Menu('🕋', 'Rukun Islam', RukunScreen()),
      _Menu('🧩', s.t('Permainan IQ', 'IQ Games'), const GamesMenuScreen()),
      _Menu('🏆', s.t('Ganjaran', 'Rewards'), const RewardsScreen()),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Muslim Smart Kids'),
        actions: [
          const StarCounter(),
          IconButton(
            tooltip: s.t('Tetapan', 'Settings'),
            icon: const Icon(Icons.settings, size: 28),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              );
              if (mounted) setState(() {});
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
            child: Text(
              s.t('Assalamualaikum! Jom belajar sambil bermain! 👋',
                  "Assalamualaikum! Let's learn and play! 👋"),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppTheme.textDark,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                childAspectRatio: 1.05,
              ),
              itemCount: menus.length,
              itemBuilder: (context, i) => MenuCard(
                emoji: menus[i].emoji,
                label: menus[i].label,
                color: AppTheme.cardColors[i % AppTheme.cardColors.length],
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => menus[i].screen),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
