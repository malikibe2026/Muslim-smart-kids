import 'package:flutter/material.dart';

import '../services/rewards_service.dart';
import '../theme/app_theme.dart';

/// Cip kecil pada bar atas yang memaparkan jumlah bintang semasa.
class StarCounter extends StatelessWidget {
  const StarCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: RewardsService.instance,
      builder: (context, _) => Center(
        child: Container(
          margin: const EdgeInsets.only(right: 8),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF3B0),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            '⭐ ${RewardsService.instance.stars}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: AppTheme.textDark,
            ),
          ),
        ),
      ),
    );
  }
}
