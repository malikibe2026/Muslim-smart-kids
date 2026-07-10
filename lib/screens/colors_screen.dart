import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../services/app_settings.dart';
import '../widgets/learn_helpers.dart';

class ColorsScreen extends StatelessWidget {
  const ColorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    return Scaffold(
      appBar: AppBar(title: Text('🎨 ${s.t('Warna', 'Colours')}')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.3,
        ),
        itemCount: colorItems.length,
        itemBuilder: (context, i) {
          final item = colorItems[i];
          final name = s.isMs ? item.ms : item.en;
          return Material(
            color: Color(item.value),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: const BorderSide(color: Colors.black12),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: () => learnTap(
                context,
                module: 'colors',
                id: item.en,
                total: colorItems.length,
                text: name,
              ),
              child: Center(
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: item.darkBackground ? Colors.white : Colors.black87,
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
