import 'dart:math';

import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../services/app_settings.dart';
import '../services/audio_service.dart';
import '../theme/app_theme.dart';
import '../widgets/game_helpers.dart';

/// Permainan 1: Memory Card - cari pasangan emoji yang sama.
class MemoryGameScreen extends StatefulWidget {
  final int level;
  const MemoryGameScreen({super.key, required this.level});

  @override
  State<MemoryGameScreen> createState() => _MemoryGameScreenState();
}

class _MemoryGameScreenState extends State<MemoryGameScreen> {
  final Random _random = Random();
  late List<String> _cards;
  late List<bool> _faceUp;
  final Set<int> _matched = {};
  int? _firstIndex;
  bool _busy = false;

  int get _pairs => switch (widget.level) { 1 => 3, 2 => 4, _ => 6 };

  @override
  void initState() {
    super.initState();
    _setup();
  }

  void _setup() {
    final pool = [...gameEmojis]..shuffle(_random);
    final chosen = pool.take(_pairs).toList();
    _cards = [...chosen, ...chosen]..shuffle(_random);
    _faceUp = List.filled(_cards.length, false);
    _matched.clear();
    _firstIndex = null;
    _busy = false;
  }

  Future<void> _onTap(int index) async {
    if (_busy || _faceUp[index] || _matched.contains(index)) return;
    AudioService.instance.pop();
    setState(() => _faceUp[index] = true);

    if (_firstIndex == null) {
      _firstIndex = index;
      return;
    }

    final first = _firstIndex!;
    _firstIndex = null;

    if (_cards[first] == _cards[index]) {
      setState(() => _matched.addAll([first, index]));
      if (_matched.length == _cards.length && mounted) {
        await showWinDialog(
          context,
          stars: widget.level,
          onReplay: () => setState(_setup),
        );
      }
    } else {
      _busy = true;
      await Future.delayed(const Duration(milliseconds: 800));
      if (!mounted) return;
      setState(() {
        _faceUp[first] = false;
        _faceUp[index] = false;
        _busy = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    final columns = widget.level == 3 ? 3 : 2;
    return Scaffold(
      appBar: AppBar(title: const Text('🃏 Memory Card')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              s.t('Cari pasangan yang sama!', 'Find the matching pairs!'),
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textDark),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ),
              itemCount: _cards.length,
              itemBuilder: (context, i) {
                final revealed = _faceUp[i] || _matched.contains(i);
                return GestureDetector(
                  onTap: () => _onTap(i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    decoration: BoxDecoration(
                      color: _matched.contains(i)
                          ? const Color(0xFFD4F5DD)
                          : revealed
                              ? Colors.white
                              : const Color(0xFFE3D8FF),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Center(
                      child: Text(
                        revealed ? _cards[i] : '❓',
                        style: const TextStyle(fontSize: 44),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
