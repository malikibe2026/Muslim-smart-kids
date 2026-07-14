import 'package:flutter/material.dart';

import '../services/app_settings.dart';
import '../services/audio_service.dart';
import '../theme/app_theme.dart';

/// Modul Trace - lukis huruf/nombor dengan jari (latihan pra-menulis).
class TraceScreen extends StatefulWidget {
  const TraceScreen({super.key});

  @override
  State<TraceScreen> createState() => _TraceScreenState();
}

class _TraceScreenState extends State<TraceScreen> {
  static final List<String> _chars = [
    ...List.generate(26, (i) => String.fromCharCode(65 + i)), // A-Z
    ...List.generate(10, (i) => '$i'), // 0-9
  ];
  int _index = 0;
  final List<List<Offset>> _strokes = [];

  void _clear() => setState(_strokes.clear);

  void _select(int i) {
    setState(() {
      _index = i;
      _strokes.clear();
    });
    AudioService.instance.speak(_chars[i]);
  }

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text('✏️ ${s.t('Jom Menulis', "Let's Write")}'),
        actions: [
          IconButton(
            tooltip: s.t('Padam', 'Clear'),
            icon: const Icon(Icons.refresh),
            onPressed: _clear,
          ),
        ],
      ),
      body: Column(
        children: [
          // Pemilih huruf/nombor.
          SizedBox(
            height: 56,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: _chars.length,
              itemBuilder: (context, i) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: ChoiceChip(
                  label: Text(_chars[i],
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w800)),
                  selected: _index == i,
                  onSelected: (_) => _select(i),
                ),
              ),
            ),
          ),
          // Kanvas lukisan dengan huruf pandu di belakang.
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
                boxShadow: AppTheme.softShadow(opacity: 0.08),
              ),
              clipBehavior: Clip.antiAlias,
              child: GestureDetector(
                onPanStart: (d) =>
                    setState(() => _strokes.add([d.localPosition])),
                onPanUpdate: (d) =>
                    setState(() => _strokes.last.add(d.localPosition)),
                child: CustomPaint(
                  size: Size.infinite,
                  painter: _TracePainter(_chars[_index], _strokes),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              s.t('Ikut bentuk huruf dengan jari!',
                  'Trace the letter with your finger!'),
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textDark),
            ),
          ),
        ],
      ),
    );
  }
}

class _TracePainter extends CustomPainter {
  final String char;
  final List<List<Offset>> strokes;
  _TracePainter(this.char, this.strokes);

  @override
  void paint(Canvas canvas, Size size) {
    // Huruf pandu kelabu besar di tengah.
    final tp = TextPainter(
      text: TextSpan(
        text: char,
        style: TextStyle(
          fontSize: size.height * 0.68,
          fontWeight: FontWeight.w900,
          color: const Color(0xFFE4E1F5),
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(
      canvas,
      Offset((size.width - tp.width) / 2, (size.height - tp.height) / 2),
    );

    // Lukisan jari kanak-kanak.
    final paint = Paint()
      ..color = const Color(0xFF7C77C6)
      ..strokeWidth = 14
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    for (final stroke in strokes) {
      final path = Path();
      for (var i = 0; i < stroke.length; i++) {
        if (i == 0) {
          path.moveTo(stroke[i].dx, stroke[i].dy);
        } else {
          path.lineTo(stroke[i].dx, stroke[i].dy);
        }
      }
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _TracePainter old) => true;
}
