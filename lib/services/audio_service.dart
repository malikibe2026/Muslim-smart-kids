import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'app_settings.dart';

/// Khidmat audio: muzik latar, kesan bunyi & sebutan (Text-to-Speech).
class AudioService {
  AudioService._();
  static final AudioService instance = AudioService._();

  final AudioPlayer _music = AudioPlayer();
  final AudioPlayer _sfx = AudioPlayer();
  final AudioPlayer _loop = AudioPlayer();
  final FlutterTts _tts = FlutterTts();
  bool _musicStarted = false;
  String? currentLoop;

  Future<void> init() async {
    await _music.setReleaseMode(ReleaseMode.loop);
    await _music.setVolume(0.35);
    await _loop.setReleaseMode(ReleaseMode.loop);
    await _loop.setVolume(0.6);
    await _tts.setSpeechRate(0.45); // Perlahan sedikit untuk kanak-kanak.
    await _tts.setPitch(1.1);
  }

  /// Main bunyi loop tidur (assets/audio/loops/<id>.wav).
  /// Muzik latar dijeda dahulu supaya tidak bertindih.
  Future<void> playLoop(String id) async {
    try {
      await _music.pause();
      await _loop.stop();
      await _loop.play(AssetSource('audio/loops/$id.wav'));
      currentLoop = id;
    } catch (_) {}
  }

  /// Henti bunyi loop tidur dan pulihkan muzik latar (jika dihidupkan).
  Future<void> stopLoop() async {
    try {
      await _loop.stop();
      currentLoop = null;
      await updateMusic();
    } catch (_) {}
  }

  /// Mula / henti muzik latar mengikut tetapan semasa.
  Future<void> updateMusic() async {
    try {
      if (AppSettings.instance.musicOn) {
        if (_musicStarted) {
          await _music.resume();
        } else {
          await _music.play(AssetSource('audio/music.wav'));
          _musicStarted = true;
        }
      } else {
        await _music.pause();
      }
    } catch (_) {
      // Abaikan ralat audio supaya aplikasi tidak terganggu.
    }
  }

  Future<void> _playSfx(String file) async {
    if (!AppSettings.instance.soundOn) return;
    try {
      await _sfx.play(AssetSource('audio/$file'));
    } catch (_) {}
  }

  /// Main melodi instrumental lagu kanak-kanak (assets/audio/rhymes/<id>.wav).
  Future<void> playMelody(String id) async {
    if (!AppSettings.instance.soundOn) return;
    try {
      await _sfx.stop();
      await _sfx.play(AssetSource('audio/rhymes/$id.wav'));
    } catch (_) {}
  }

  /// Bacaan surah: cuba rakaman qari (assets/audio/surah/<id>.mp3) dahulu.
  /// Jika fail tiada, fallback kepada TTS Arab (untuk pengenalan sahaja).
  /// Pulangkan true jika rakaman qari digunakan.
  Future<bool> playQariOrTts(String id, String arabicText) async {
    if (!AppSettings.instance.soundOn) return false;
    try {
      await _sfx.stop();
      await _sfx.play(AssetSource('audio/surah/$id.mp3'));
      return true;
    } catch (_) {
      await speakArabic(arabicText);
      return false;
    }
  }

  /// Henti bacaan surah / kesan bunyi yang sedang dimainkan.
  Future<void> stopSfx() async {
    try {
      await _sfx.stop();
      await _tts.stop();
    } catch (_) {}
  }

  /// Bunyi "pop" apabila butang ditekan.
  Future<void> pop() => _playSfx('pop.wav');

  /// Bunyi "ding" apabila jawapan betul / menang.
  Future<void> ding() => _playSfx('ding.wav');

  /// Sebut teks. [lang] contohnya 'ms-MY', 'en-US' atau 'ar'.
  Future<void> speak(String text, {String? lang}) async {
    if (!AppSettings.instance.soundOn) return;
    try {
      await _tts.stop();
      await _tts.setLanguage(
        lang ?? (AppSettings.instance.isMs ? 'ms-MY' : 'en-US'),
      );
      await _tts.speak(text);
    } catch (_) {}
  }

  /// Sebutan Arab (huruf hijaiyah & doa).
  Future<void> speakArabic(String text) => speak(text, lang: 'ar');

  /// Sebut teks dengan gaya suara (pic/rate) tersendiri, contohnya untuk
  /// memanggil nama anak dengan pelbagai gaya suara comel.
  /// Tetapan asal (pitch 1.1, rate 0.45) dikembalikan selepas selesai.
  Future<void> speakStyled(String text,
      {required double pitch, required double rate, String? lang}) async {
    if (!AppSettings.instance.soundOn) return;
    try {
      await _tts.stop();
      await _tts.setLanguage(
        lang ?? (AppSettings.instance.isMs ? 'ms-MY' : 'en-US'),
      );
      await _tts.setPitch(pitch);
      await _tts.setSpeechRate(rate);
      await _tts.speak(text);
    } catch (_) {
    } finally {
      // Kembalikan tetapan asal untuk modul lain.
      await _tts.setPitch(1.1);
      await _tts.setSpeechRate(0.45);
    }
  }
}
