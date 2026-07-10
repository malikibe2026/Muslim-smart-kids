import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../theme/app_theme.dart';
import '../widgets/learn_card.dart';
import '../widgets/learn_helpers.dart';

class HijaiyahScreen extends StatelessWidget {
  const HijaiyahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('🕌 Huruf Hijaiyah')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.9,
        ),
        itemCount: hijaiyahItems.length,
        itemBuilder: (context, i) {
          final item = hijaiyahItems[i];
          return LearnCard(
            color: AppTheme.cardColors[i % AppTheme.cardColors.length],
            onTap: () => learnTap(
              context,
              module: 'hijaiyah',
              id: item.name + item.char,
              total: hijaiyahItems.length,
              text: item.arName,
              lang: 'ar',
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(item.char,
                    style: const TextStyle(
                        fontSize: 52,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textDark)),
                const SizedBox(height: 4),
                Text(item.name,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textDark)),
              ],
            ),
          );
        },
      ),
    );
  }
}
