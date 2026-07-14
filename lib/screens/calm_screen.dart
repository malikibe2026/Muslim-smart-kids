import 'dart:math';

import 'package:flutter/material.dart';

import '../services/app_settings.dart';

/// Zon Bayi: visual tenang - bintang & bulatan bergerak perlahan.
class CalmScreen extends StatefulWidget {
  const CalmScreen({super.key});

  @override
  State<CalmScreen> createState() => _CalmScreenState();
}

class _CalmScreenState extends State<CalmScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final Random _random = Random(3);
  late final List<_Star> _stars;

  @override
  void initState() {
    super.initState();
    _stars = List.generate(
      18,
      (i) => _Star(
        _random.nextDouble(),
        _random.nextDouble(),
        10 + _random.nextDouble() * 22,
        _random.nextDouble() * 2 * pi,
      ),
    );
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 12))
          ..addListener(() => setState(() {}))
          ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    final size = MediaQuery.of(context).size;
    final t = _controller.value * 2 * pi;
    return Scaffold(
      backgroundColor: const Color(0xFF1B1A3A),
      appBar: AppBar(
        title: Text('⭐ ${s.t('Visual Tenang', 'Calm Visuals')}',
            style: const TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          for (final star in _stars)
            Positioned(
              left: star.x * size.width + 20 * sin(t + star.phase),
              top: star.y * size.height * 0.8 + 14 * cos(t * 0.7 + star.phase),
              child: Opacity(
                opacity: 0.5 + 0.5 * sin(t * 1.3 + star.phase).abs(),
                child: Text('✨',
                    style: TextStyle(fontSize: star.size)),
              ),
            ),
          Align(
            alignment: Alignment(0, -0.3 + 0.05 * sin(t)),
            child: const Text('🌙', style: TextStyle(fontSize: 90)),
          ),
        ],
      ),
    );
  }
}

class _Star {
  final double x;
  final double y;
  final double size;
  final double phase;
  const _Star(this.x, this.y, this.size, this.phase);
}
