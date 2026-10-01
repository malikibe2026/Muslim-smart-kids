import 'package:flutter/material.dart';

import '../services/app_settings.dart';
import '../services/audio_service.dart';
import '../services/smart_engine.dart';
import '../theme/app_theme.dart';
import '../widgets/game_helpers.dart';

/// Skrin Semakan Pintar: kuiz pelbagai modul yang dipilih secara automatik
/// oleh SmartEngine mengikut item yang anak lemah/perlu diulang.
/// 100% offline - tiada AI/internet diperlukan.
class SmartReviewScreen extends StatefulWidget {
  /// Jika diberi, hanya semak satu modul ini (cth. dari skrin Wawasan Pintar).
  final String? onlyModule;
  const SmartReviewScreen({super.key, this.onlyModule});

  @override
  State<SmartReviewScreen> createState() => _SmartReviewScreenState();
}

class _SmartReviewScreenState extends State<SmartReviewScreen> {
  static const int _optionCount = 4;

  late List<QuizItem> _session;
  int _idx = 0;
  List<QuizItem> _options = [];
  bool _answered = false;
  String? _selectedKey;
  bool _correct = false;
  int _correctCount = 0;

  @override
  void initState() {
    super.initState();
    _session = SmartEngine.instance
        .pickSession(count: 10, onlyModule: widget.onlyModule);
    if (_session.isNotEmpty) _loadOptions();
  }

  void _loadOptions() {
    final current = _session[_idx];
    _options = SmartEngine.instance.buildOptions(current, _optionCount);
  }

  void _choose(QuizItem option) {
    if (_answered) return;
    final current = _session[_idx];
    final correct = option.key == current.key;
    SmartEngine.instance.recordAttempt(current, correct);
    setState(() {
      _answered = true;
      _selectedKey = option.key;
      _correct = correct;
      if (correct) _correctCount++;
    });
    if (correct) {
      AudioService.instance.ding();
    } else {
      final s = AppSettings.instance;
      final answerText = s.isMs ? current.answerMs : current.answerEn;
      AudioService.instance.speak(s.t(
        'Jawapan betul ialah $answerText',
        'The correct answer is $answerText',
      ));
    }
  }

  void _next() {
    if (_idx + 1 >= _session.length) {
      _finish();
      return;
    }
    setState(() {
      _idx++;
      _answered = false;
      _selectedKey = null;
      _loadOptions();
    });
  }

  int _starsFor(int correct) {
    var stars = (correct / 2).ceil();
    if (stars < 1) stars = 1;
    if (stars > 5) stars = 5;
    return stars;
  }

  Future<void> _finish() async {
    final stars = _starsFor(_correctCount);
    await showWinDialog(
      context,
      stars: stars,
      onReplay: () => setState(() {
        _session = SmartEngine.instance
            .pickSession(count: 10, onlyModule: widget.onlyModule);
        _idx = 0;
        _answered = false;
        _selectedKey = null;
        _correctCount = 0;
        if (_session.isNotEmpty) _loadOptions();
      }),
    );
  }

  Color _optionColor(QuizItem option, QuizItem current) {
    if (!_answered) return Colors.white;
    if (option.key == current.key) return const Color(0xFFD4F5DD);
    if (option.key == _selectedKey) return const Color(0xFFFFD6E0);
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;

    if (_session.isEmpty) {
      return Scaffold(
        appBar:
            AppBar(title: Text('🧠 ${s.t('Semakan Pintar', 'Smart Review')}')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              s.t('Belum ada soalan untuk modul ini.',
                  'No questions for this module yet.'),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: AppTheme.textDark),
            ),
          ),
        ),
      );
    }

    final current = _session[_idx];
    return Scaffold(
      appBar:
          AppBar(title: Text('🧠 ${s.t('Semakan Pintar', 'Smart Review')}')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            roundProgress(_idx + 1, _session.length),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: Colors.black12),
              ),
              child: Column(
                children: [
                  if (current.swatchColor != null)
                    Container(
                      width: 84,
                      height: 84,
                      decoration: BoxDecoration(
                        color: Color(current.swatchColor!),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black12, width: 2),
                      ),
                    )
                  else
                    Text(current.emoji ?? '❓',
                        style: const TextStyle(fontSize: 72)),
                  if (current.speakText != null)
                    IconButton(
                      onPressed: () => AudioService.instance.speak(
                        current.speakText!,
                        lang: current.speakLang,
                      ),
                      icon: const Icon(Icons.volume_up,
                          color: AppTheme.accent, size: 28),
                      tooltip: s.t('Dengar', 'Listen'),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              s.isMs ? current.promptMs : current.promptEn,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textDark),
            ),
            if (_answered) ...[
              const SizedBox(height: 8),
              Text(
                _correct
                    ? '✅ ${s.t('Betul!', 'Correct!')}'
                    : '❌ ${s.t('Cuba lagi nanti!', "We'll try this again later!")}',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: _correct
                      ? const Color(0xFF2E9E5B)
                      : const Color(0xFFE0657D),
                ),
              ),
            ],
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: [
                  for (final option in _options)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Material(
                        color: _optionColor(option, current),
                        borderRadius: BorderRadius.circular(18),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(18),
                          onTap: () => _choose(option),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(color: Colors.black12),
                            ),
                            child: Text(
                              s.isMs ? option.answerMs : option.answerEn,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            if (_answered)
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _next,
                  child: Text(_idx + 1 >= _session.length
                      ? s.t('Selesai', 'Finish')
                      : s.t('Seterusnya', 'Next')),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
