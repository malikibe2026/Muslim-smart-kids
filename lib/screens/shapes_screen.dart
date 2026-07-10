import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../services/app_settings.dart';
import '../theme/app_theme.dart';
import '../widgets/learn_card.dart';
import '../widgets/learn_helpers.dart';

class ShapesScreen extends StatelessWidget {
  const ShapesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    return Scaffold(
      appBar: AppBar(title: Text('🔷 ${s.t('Bentuk', 'Shapes')}')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        itemCount: shapeItems.length,
        itemBuilder: (context, i) {
          final item = shapeItems[i];
          final name = s.isMs ? item.ms : item.en;
          return LearnCard(
            color: AppTheme.cardColors[i % AppTheme.cardColors.length],
            onTap: () => learnTap(
              context,
              module: 'shapes',
              id: item.en,
              total: shapeItems.length,
              text: name,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item.icon, size: 72, color: Color(item.color)),
                const SizedBox(height: 8),
                Text(name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: AppTheme.textDark)),
              ],
            ),
          );
        },
      ),
    );
  }
}
