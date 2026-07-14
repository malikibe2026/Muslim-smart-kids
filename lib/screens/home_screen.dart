import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../services/app_settings.dart';
import '../services/audio_service.dart';
import '../theme/app_theme.dart';
import '../widgets/menu_card.dart';
import '../widgets/star_counter.dart';
import 'abc_screen.dart';
import 'animals_screen.dart';
import 'asmaul_husna_screen.dart';
import 'baby_sounds_screen.dart';
import 'body_parts_screen.dart';
import 'bubbles_screen.dart';
import 'calm_screen.dart';
import 'colors_screen.dart';
import 'doa_screen.dart';
import 'games_menu_screen.dart';
import 'growth_screen.dart';
import 'hijaiyah_screen.dart';
import 'kebesaran_screen.dart';
import 'lullaby_screen.dart';
import 'name_call_screen.dart';
import 'numbers_screen.dart';
import 'opposites_screen.dart';
import 'prophet_names_screen.dart';
import 'prophets_screen.dart';
import 'rewards_screen.dart';
import 'rhymes_screen.dart';
import 'rukun_screen.dart';
import 'settings_screen.dart';
import 'shapes_screen.dart';
import 'simple_grid_screen.dart';
import 'steps_screen.dart';
import 'surah_screen.dart';
import 'tasbih_screen.dart';
import 'trace_screen.dart';
import 'weather_days_screen.dart';

class _Menu {
  final String emoji;
  final String label;
  final Widget screen;
  const _Menu(this.emoji, this.label, this.screen);
}

class _Section {
  final String title;
  final List<_Menu> menus;
  const _Section(this.title, this.menus);
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
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => AudioService.instance.updateMusic(),
    );
  }

  List<_Section> _sections(AppSettings s) => [
        _Section(s.t('👶 Zon Bayi', '👶 Baby Zone'), [
          _Menu('🫧', s.t('Sentuh & Pecah', 'Tap & Pop'),
              const BubblesScreen()),
          _Menu('🔊', s.t('Bunyi Seronok', 'Fun Sounds'),
              const BabySoundsScreen()),
          _Menu('🌙', s.t('Muzik Tidur', 'Sleep Sounds'),
              const LullabyScreen()),
          _Menu('⭐', s.t('Visual Tenang', 'Calm Visuals'),
              const CalmScreen()),
        ]),
        _Section(s.t('📚 Jom Belajar', "📚 Let's Learn"), [
          const _Menu('🔤', 'ABC', AbcScreen()),
          _Menu('🔢', s.t('Nombor', 'Numbers'), const NumbersScreen()),
          _Menu('✏️', s.t('Jom Menulis', "Let's Write"), const TraceScreen()),
          _Menu('🎨', s.t('Warna', 'Colours'), const ColorsScreen()),
          _Menu('🔷', s.t('Bentuk', 'Shapes'), const ShapesScreen()),
          _Menu('🐘', s.t('Haiwan', 'Animals'), const AnimalsScreen()),
          _Menu(
              '🍎',
              s.t('Buah & Sayur', 'Fruits & Veggies'),
              const SimpleGridScreen(
                titleEmoji: '🍎',
                titleMs: 'Buah & Sayur',
                titleEn: 'Fruits & Veggies',
                moduleKey: 'fruits',
                items: fruitItems,
              )),
          _Menu(
              '🚗',
              s.t('Kenderaan', 'Vehicles'),
              const SimpleGridScreen(
                titleEmoji: '🚗',
                titleMs: 'Kenderaan',
                titleEn: 'Vehicles',
                moduleKey: 'vehicles',
                items: vehicleItems,
                speakSound: true,
              )),
          _Menu('🧍', s.t('Anggota Badan', 'Body Parts'),
              const BodyPartsScreen()),
          _Menu('🔄', s.t('Lawan Kata', 'Opposites'), const OppositesScreen()),
          _Menu(
              '👨‍👩‍👧',
              s.t('Keluarga', 'Family'),
              const SimpleGridScreen(
                titleEmoji: '👨‍👩‍👧',
                titleMs: 'Ahli Keluarga',
                titleEn: 'Family Members',
                moduleKey: 'family',
                items: familyItems,
              )),
          _Menu('☀️', s.t('Cuaca & Hari', 'Weather & Days'),
              const WeatherDaysScreen()),
        ]),
        _Section(s.t('🕌 Zon Islamik', '🕌 Islamic Zone'), [
          const _Menu('🕌', 'Huruf Hijaiyah', HijaiyahScreen()),
          _Menu('🤲', s.t('Doa Harian', 'Daily Duas'), const DoaScreen()),
          _Menu('📗', s.t('Surah Pendek', 'Short Surahs'),
              const SurahScreen()),
          const _Menu('🕋', 'Rukun Islam', RukunScreen()),
          _Menu(
              '🕌',
              s.t('Langkah Solat', 'How to Pray'),
              const StepsScreen(
                titleEmoji: '🕌',
                titleMs: 'Langkah Solat',
                titleEn: 'How to Pray',
                moduleKey: 'solat',
                steps: solatSteps,
              )),
          _Menu(
              '💧',
              s.t('Langkah Wudhu', 'How to Wudhu'),
              const StepsScreen(
                titleEmoji: '💧',
                titleMs: 'Langkah Wudhu',
                titleEn: 'How to Wudhu',
                moduleKey: 'wudhu',
                steps: wudhuSteps,
              )),
          _Menu(
              '🧼',
              s.t('Adab Harian', 'Daily Manners'),
              const StepsScreen(
                titleEmoji: '🧼',
                titleMs: 'Adab Harian',
                titleEn: 'Daily Manners',
                moduleKey: 'adab',
                steps: adabItems,
                numbered: false,
              )),
          _Menu('📿', s.t('Tasbih Digital', 'Digital Tasbih'),
              const TasbihScreen()),
          _Menu('🌍', s.t('Kebesaran Allah', "Allah's Greatness"),
              const KebesaranScreen()),
          _Menu('☪️', s.t('99 Nama Allah', '99 Names of Allah'),
              const AsmaulHusnaScreen()),
          const _Menu('📖', 'Kisah 25 Rasul', ProphetsScreen()),
          _Menu('🧕', s.t('Nama-nama Rasul', 'Names of Prophets'),
              const ProphetNamesScreen()),
        ]),
        _Section(s.t('🎈 Zon Seronok', '🎈 Fun Zone'), [
          _Menu('🎵', s.t('Lagu Kanak-kanak', 'Nursery Rhymes'),
              const RhymesScreen()),
          _Menu('🥰', s.t('Panggil Nama Sayang', 'Call My Sweetie'),
              const NameCallScreen()),
          _Menu('🧩', s.t('Permainan IQ', 'IQ Games'),
              const GamesMenuScreen()),
          _Menu('🏆', s.t('Ganjaran', 'Rewards'), const RewardsScreen()),
        ]),
        _Section(s.t('👨‍👩‍👧 Untuk Ibu Bapa', '👨‍👩‍👧 For Parents'), [
          _Menu('📊', s.t('Rekod Pertumbuhan', 'Growth Tracker'),
              const GrowthScreen()),
        ]),
      ];

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    final sections = _sections(s);
    // Offset indeks warna untuk setiap seksyen (dikira awal, stabil).
    final offsets = <int>[];
    var acc = 0;
    for (final sec in sections) {
      offsets.add(acc);
      acc += sec.menus.length;
    }

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // ------- Banner hero premium -------
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.fromLTRB(16, 12, 16, 8),
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
            ),
            // ------- Seksyen berkategori -------
            for (var sIdx = 0; sIdx < sections.length; sIdx++) ...[
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 14, 20, 8),
                  child: Text(
                    sections[sIdx].title,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w900,
                      color: AppTheme.textDark,
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverGrid(
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.82,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, i) {
                      final menu = sections[sIdx].menus[i];
                      final idx = offsets[sIdx] + i;
                      return MenuCard(
                        emoji: menu.emoji,
                        label: menu.label,
                        color: AppTheme
                            .cardColors[idx % AppTheme.cardColors.length],
                        deepColor: AppTheme.cardColorsDeep[
                            idx % AppTheme.cardColorsDeep.length],
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => menu.screen),
                        ),
                      );
                    },
                    childCount: sections[sIdx].menus.length,
                  ),
                ),
              ),
            ],
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
          ],
        ),
      ),
    );
  }
}
