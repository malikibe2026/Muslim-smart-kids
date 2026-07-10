import 'package:flutter/material.dart';

/// Kad pastel besar yang mudah ditekan oleh kanak-kanak.
class LearnCard extends StatelessWidget {
  final Color color;
  final VoidCallback onTap;
  final Widget child;

  const LearnCard({
    super.key,
    required this.color,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: child,
        ),
      ),
    );
  }
}
