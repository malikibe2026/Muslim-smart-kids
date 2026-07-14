import 'dart:math';

import 'package:flutter/material.dart';

import '../services/app_settings.dart';
import '../services/audio_service.dart';
import '../theme/app_theme.dart';

class _Bubble {
  final double x; // 0..1 kedudukan melintang
  final double size;
  final Color color;
  final int seed;
  bool popped = false;
  _Bubble(this.x, this.size, this.color, this.seed);
}

/// Zon Bayi: sentuh buih untuk memecahkannya - latihan sebab-akibat.
class BubblesScreen extends StatefulWidget {
  const BubblesScreen({super.key});

  @override
  State<BubblesScreen> createState() => _BubblesScreenState();
}

class _BubblesScreenState extends State<BubblesScreen>
    with SingleTickerProviderStateMixin {
  final Random _random = Random();
  late final AnimationController _controller;
  final List<_Bubble> _bubbles = [];
  int _popCount = 0;

  @override
  void initState() {
    super.initState();
    _spawn();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 8))
          ..addListener(() => setState(() {}))
          ..repeat();
  }

  void _spawn() {
    _bubbles
      ..clear()
      ..addAll(List.generate(8, (i) {
        return _Bubble(
          0.05 + _random.nextDouble() * 0.75,
          54 + _random.nextDouble() * 40,
          AppTheme.cardColorsDeep[i % AppTheme.cardColorsDeep.length],
          _random.nextInt(1000),
        );
      }));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _pop(_Bubble b) {
    if (b.popped) return;
    AudioService.instance.pop();
    setState(() {
      b.popped = true;
      _popCount++;
    });
    // Semua pecah -> jana semula.
    if (_bubbles.every((x) => x.popped)) {
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) setState(_spawn);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('🫧 ${s.t('Sentuh & Pecah', 'Tap & Pop')}'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text('💥 $_popCount',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.textDark)),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          for (final b in _bubbles)
            if (!b.popped)
              Positioned(
                // Buih naik dari bawah ke atas, berulang; fasa berbeza ikut seed.
                left: b.x * size.width +
                    12 * sin((_controller.value * 2 * pi) + b.seed),
                top: size.height -
                    ((_controller.value + b.seed / 1000) % 1.0) *
                        (size.height + 100),
                child: GestureDetector(
                  onTap: () => _pop(b),
                  child: Container(
                    width: b.size,
                    height: b.size,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.white, b.color],
                      ),
                      boxShadow: AppTheme.softShadow(opacity: 0.15),
                    ),
                    child: const Align(
                      alignment: Alignment(-0.4, -0.4),
                      child: Text('✨', style: TextStyle(fontSize: 14)),
                    ),
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
