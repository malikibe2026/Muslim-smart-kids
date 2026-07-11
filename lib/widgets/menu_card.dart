import 'package:flutter/material.dart';

import '../services/audio_service.dart';
import '../theme/app_theme.dart';

/// Kad menu premium: badge ikon bulat bergradient + bayang lembut + label.
class MenuCard extends StatefulWidget {
  final String emoji;
  final String label;
  final Color color;
  final Color deepColor;
  final VoidCallback onTap;

  const MenuCard({
    super.key,
    required this.emoji,
    required this.label,
    required this.color,
    required this.deepColor,
    required this.onTap,
  });

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  double _scale = 1.0;

  void _setPressed(bool pressed) =>
      setState(() => _scale = pressed ? 0.96 : 1.0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _setPressed(true),
      onTapUp: (_) => _setPressed(false),
      onTapCancel: () => _setPressed(false),
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(26),
            boxShadow: AppTheme.softShadow(),
            border: Border.all(color: widget.color, width: 2),
          ),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(26),
            child: InkWell(
              borderRadius: BorderRadius.circular(26),
              onTap: () {
                AudioService.instance.pop();
                widget.onTap();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [widget.color, widget.deepColor],
                        ),
                        shape: BoxShape.circle,
                        boxShadow: AppTheme.softShadow(opacity: 0.14),
                      ),
                      child: Text(widget.emoji,
                          style: const TextStyle(fontSize: 30)),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Text(
                        widget.label,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14.5,
                          fontWeight: FontWeight.w800,
                          color: AppTheme.textDark,
                          height: 1.15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
