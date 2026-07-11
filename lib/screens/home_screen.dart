import 'package:flutter/material.dart';

import '../services/app_settings.dart';
import '../services/audio_service.dart';
import '../services/rewards_service.dart';
import '../theme/app_theme.dart';
import '../widgets/menu_card.dart';
import '../widgets/star_counter.dart';
import 'abc_screen.dart';
import 'animals_screen.dart';
import 'asmaul_husna_screen.dart';
import 'body_parts_screen.dart';
import 'colors_screen.dart';
import 'doa_screen.dart';
import 'games_menu_screen.dart';
import 'hijaiyah_screen.dart';
import 'kebesaran_screen.dart';
import 'name_call_screen.dart';
import 'numbers_screen.dart';
import 'prophet_names_screen.dart';
import 'prophets_screen.dart';
import 'rewards_screen.dart';
import 'rhymes_screen.dart';
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
      _Menu('🌍', s.t('Kebesaran Allah', "Allah's Greatness"),
          const KebesaranScreen()),
      _Menu('☪️', s.t('99 Nama Allah', '99 Names of Allah'),
          const AsmaulHusnaScreen()),
      const _Menu('📖', 'Kisah 25 Rasul', ProphetsScreen()),
      _Menu('🧕', s.t('Nama-nama Rasul', 'Names of Prophets'),
          const ProphetNamesScreen()),
      _Menu('🎵', s.t('Lagu Kanak-kanak', 'Nursery Rhymes'),
          const RhymesScreen()),
      _Menu('🧍', s.t('Anggota Badan', 'Body Parts'), const BodyPartsScreen()),
      _Menu('🥰', s.t('Panggil Nama Sayang', 'Call My Sweetie'),
          const NameCallScreen()),
      _Menu('🧩', s.t('Permainan IQ', 'IQ Games'), const GamesMenuScreen()),
      _Menu('🏆', s.t('Ganjaran', 'Rewards'), const RewardsScreen()),
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // ------- Banner hero premium -------
            Container(
              margin: const EdgeInsets.fromLTRB(16, 12, 16, 4),
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
              decoration: BoxDecoration(
                gradient: AppTheme.heroGradient,
                borderRadius: BorderRadius.circular(28),
                boxShadow: AppTheme.softShadow(opacity: 0.18),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('🕌 Muslim Smart Kids',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: Colors.white)),
                        const SizedBox(height: 6),
                        Text(
                          s.t('Assalamualaikum! Jom belajar sambil bermain 👋',
                              "Assalamualaikum! Let's learn and play 👋"),
                          style: const TextStyle(
                            fontSize: 13.5,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      const StarCounter(),
                      const SizedBox(height: 4),
                      IconButton(
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.25),
                        ),
                        tooltip: s.t('Tetapan', 'Settings'),
                        icon: const Icon(Icons.settings,
                            size: 22, color: Colors.white),
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const SettingsScreen()),
                          );
                          if (mounted) setState(() {});
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.82,
                ),
                itemCount: menus.length,
                itemBuilder: (context, i) => MenuCard(
                  emoji: menus[i].emoji,
                  label: menus[i].label,
                  color: AppTheme.cardColors[i % AppTheme.cardColors.length],
                  deepColor:
                      AppTheme.cardColorsDeep[i % AppTheme.cardColorsDeep.length],
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => menus[i].screen),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
