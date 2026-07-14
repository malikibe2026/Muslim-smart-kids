import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/app_settings.dart';
import '../theme/app_theme.dart';

class _GrowthEntry {
  final String date; // "YYYY-MM-DD"
  final double weight; // kg
  final double height; // cm
  final String note;
  _GrowthEntry(this.date, this.weight, this.height, this.note);

  Map<String, dynamic> toJson() =>
      {'date': date, 'weight': weight, 'height': height, 'note': note};

  static _GrowthEntry fromJson(Map<String, dynamic> j) => _GrowthEntry(
        j['date'] as String,
        (j['weight'] as num).toDouble(),
        (j['height'] as num).toDouble(),
        (j['note'] as String?) ?? '',
      );
}

/// Alat Ibu Bapa: Rekod Pertumbuhan (berat & tinggi) - disimpan dalam telefon.
class GrowthScreen extends StatefulWidget {
  const GrowthScreen({super.key});

  @override
  State<GrowthScreen> createState() => _GrowthScreenState();
}

class _GrowthScreenState extends State<GrowthScreen> {
  final List<_GrowthEntry> _entries = [];
  SharedPreferences? _prefs;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    _prefs = await SharedPreferences.getInstance();
    final raw = _prefs?.getString('growth_entries');
    if (raw != null) {
      final list = (jsonDecode(raw) as List)
          .map((e) => _GrowthEntry.fromJson(e as Map<String, dynamic>))
          .toList();
      if (mounted) {
        setState(() => _entries
          ..clear()
          ..addAll(list));
      }
    }
  }

  Future<void> _save() async {
    await _prefs?.setString(
        'growth_entries', jsonEncode(_entries.map((e) => e.toJson()).toList()));
  }

  Future<void> _addEntry() async {
    final s = AppSettings.instance;
    final weightCtrl = TextEditingController();
    final heightCtrl = TextEditingController();
    final noteCtrl = TextEditingController();
    final saved = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: Text(s.t('Rekod Baru', 'New Record')),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: weightCtrl,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: s.t('Berat (kg)', 'Weight (kg)'),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: heightCtrl,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: s.t('Tinggi (cm)', 'Height (cm)'),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: noteCtrl,
              decoration: InputDecoration(
                labelText: s.t('Nota (pilihan)', 'Note (optional)'),
                border: const OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(s.t('Batal', 'Cancel')),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(s.t('Simpan', 'Save')),
          ),
        ],
      ),
    );
    if (saved != true) return;
    final weight = double.tryParse(weightCtrl.text.replaceAll(',', '.'));
    final height = double.tryParse(heightCtrl.text.replaceAll(',', '.'));
    if (weight == null || height == null) return;
    final now = DateTime.now();
    final date =
        '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
    setState(() =>
        _entries.insert(0, _GrowthEntry(date, weight, height, noteCtrl.text)));
    await _save();
  }

  Future<void> _delete(int i) async {
    setState(() => _entries.removeAt(i));
    await _save();
  }

  @override
  Widget build(BuildContext context) {
    final s = AppSettings.instance;
    return Scaffold(
      appBar: AppBar(
          title: Text('📊 ${s.t('Rekod Pertumbuhan', 'Growth Tracker')}')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addEntry,
        icon: const Icon(Icons.add),
        label: Text(s.t('Tambah', 'Add')),
      ),
      body: _entries.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('📏', style: TextStyle(fontSize: 64)),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      s.t('Belum ada rekod. Tekan "Tambah" untuk simpan berat & tinggi anak.',
                          'No records yet. Tap "Add" to save your child\'s weight & height.'),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 16, color: AppTheme.textDark),
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 90),
              itemCount: _entries.length,
              itemBuilder: (context, i) {
                final e = _entries[i];
                // Perbezaan dengan rekod sebelumnya (jika ada).
                String diff = '';
                if (i < _entries.length - 1) {
                  final prev = _entries[i + 1];
                  final dw = e.weight - prev.weight;
                  final dh = e.height - prev.height;
                  diff =
                      '${dw >= 0 ? '+' : ''}${dw.toStringAsFixed(1)} kg, ${dh >= 0 ? '+' : ''}${dh.toStringAsFixed(1)} cm';
                }
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.cardColors[i % AppTheme.cardColors.length],
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: AppTheme.softShadow(opacity: 0.05),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e.date,
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: AppTheme.textDark)),
                            const SizedBox(height: 4),
                            Text(
                              '⚖️ ${e.weight.toStringAsFixed(1)} kg    📏 ${e.height.toStringAsFixed(1)} cm',
                              style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w800,
                                  color: AppTheme.textDark),
                            ),
                            if (diff.isNotEmpty)
                              Text(diff,
                                  style: const TextStyle(
                                      fontSize: 12.5,
                                      color: AppTheme.textDark)),
                            if (e.note.isNotEmpty)
                              Text('📝 ${e.note}',
                                  style: const TextStyle(
                                      fontSize: 13,
                                      color: AppTheme.textDark)),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline,
                            color: AppTheme.textDark),
                        onPressed: () => _delete(i),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
