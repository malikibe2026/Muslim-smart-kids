import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../services/app_settings.dart';
import '../theme/app_theme.dart';
import '../widgets/learn_helpers.dart';

/// Skrin generik "langkah demi langkah" (solat, wudhu, adab harian).
class StepsScreen extends StatelessWidget {
  final String titleEmoji;
  final String titleMs;
  final String titleEn;
  final String moduleKey;
  final List<StepItem> steps;
  final bool numbered;

  const StepsScreen({
    super.key,
    required this.titleEmoji,
    required this.titleMs,
    required this.titleEn,
    required this.moduleKey,
    required this.steps,
    this.numbered = true,
  });

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    return Scaffold(
      appBar: AppBar(title: Text('$titleEmoji ${s.t(titleMs, titleEn)}')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: steps.length,
        itemBuilder: (context, i) {
          final step = steps[i];
          final title = s.isMs ? step.titleMs : step.titleEn;
          final desc = s.isMs ? step.descMs : step.descEn;
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: Material(
              color: AppTheme.cardColors[i % AppTheme.cardColors.length],
              borderRadius: BorderRadius.circular(24),
              child: InkWell(
                borderRadius: BorderRadius.circular(24),
                onTap: () => learnTap(
                  context,
                  module: moduleKey,
                  id: step.titleEn,
                  total: steps.length,
                  text: '$title. $desc',
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (numbered)
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.white,
                          child: Text('${i + 1}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: AppTheme.textDark)),
                        ),
                      if (numbered) const SizedBox(width: 12),
                      Text(step.emoji, style: const TextStyle(fontSize: 36)),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(title,
                                style: const TextStyle(
                                    fontSize: 16.5,
                                    fontWeight: FontWeight.w800,
                                    color: AppTheme.textDark)),
                            const SizedBox(height: 4),
                            Text(desc,
                                style: const TextStyle(
                                    fontSize: 14,
                                    height: 1.4,
                                    color: AppTheme.textDark)),
                          ],
                        ),
                      ),
                      const Icon(Icons.volume_up,
                          size: 20, color: AppTheme.textDark),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
