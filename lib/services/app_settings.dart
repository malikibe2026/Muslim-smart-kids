import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Tetapan aplikasi: muzik, suara & bahasa. Disimpan dalam SharedPreferences.
class AppSettings extends ChangeNotifier {
  AppSettings._();
  static final AppSettings instance = AppSettings._();

  bool musicOn = true;
  bool soundOn = true;
  String language = 'ms'; // 'ms' atau 'en'

  bool get isMs => language == 'ms';

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    musicOn = prefs.getBool('musicOn') ?? true;
    soundOn = prefs.getBool('soundOn') ?? true;
    language = prefs.getString('language') ?? 'ms';
    notifyListeners();
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('musicOn', musicOn);
    await prefs.setBool('soundOn', soundOn);
    await prefs.setString('language', language);
  }

  void setMusic(bool value) {
    musicOn = value;
    _save();
    notifyListeners();
  }

  void setSound(bool value) {
    soundOn = value;
    _save();
    notifyListeners();
  }

  void setLanguage(String value) {
    language = value;
    _save();
    notifyListeners();
  }

  /// Pilih teks mengikut bahasa semasa.
  String t(String ms, String en) => isMs ? ms : en;
}
