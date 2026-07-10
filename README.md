# Muslim Smart Kids 🕌⭐

Aplikasi pembelajaran Android untuk kanak-kanak berumur 1–6 tahun, dibina dengan Flutter dan Material Design 3.

- Pembelajaran menyeronokkan melalui permainan (10–20 minit sehari)
- Asas agama Islam: Huruf Hijaiyah, Doa Harian, Rukun Islam
- 5 permainan IQ, setiap satu dengan 3 tahap kesukaran
- Sistem ganjaran: bintang, lencana & kemajuan
- Dwibahasa (Bahasa Melayu / English), tiada iklan, berfungsi tanpa internet

## Modul

| Modul | Kandungan |
|---|---|
| ABC | A–Z, sebutan audio, gambar (emoji) setiap huruf |
| Nombor | 1–20 + aktiviti mengira objek |
| Warna | 10 warna asas dengan sebutan |
| Bentuk | Bulatan, segi empat, segi tiga, bintang, hati |
| Haiwan | 12 haiwan: gambar, nama & bunyi |
| Huruf Hijaiyah | 28 huruf, paparan besar, sebutan Arab (TTS) |
| Doa Harian | 6 doa: teks Arab, rumi, maksud & audio |
| Rukun Islam | 5 rukun bergambar dengan penjelasan ringkas |
| Permainan IQ | Memory Card, Padankan Gambar, Puzzle, Cari Bayang, Kira Objek |
| Ganjaran | Bintang, 6 lencana, kemajuan modul |

## Cara Bina APK

Keperluan: Flutter SDK 3.19+ dan Android SDK.

```bash
cd muslim_smart_kids

# Langkah 1 (SEKALI SAHAJA): jana folder platform android
flutter create . --org com.mycompany --project-name muslim_smart_kids

# Langkah 2: pasang pakej
flutter pub get

# Langkah 3: uji pada peranti/emulator
flutter run

# Langkah 4: bina APK release
flutter build apk --release
```

APK terhasil di `build/app/outputs/flutter-apk/app-release.apk`.

## Nota Teknikal

- **Audio sebutan** menggunakan Text-to-Speech peranti (`flutter_tts`). Pastikan enjin Google TTS dengan bahasa Melayu, Inggeris & Arab dipasang pada peranti (kebanyakan telefon Android sudah ada). TTS berfungsi tanpa internet selepas data suara dimuat turun sekali.
- **Kemajuan & tetapan** disimpan secara tempatan menggunakan `shared_preferences` — tiada data dihantar ke mana-mana.
- **Audio contoh** (`assets/audio/`): muzik latar, bunyi "ding" dan "pop" yang dijana secara sintetik. Boleh diganti dengan rakaman sebenar (nama fail sama).
- Tiada kebenaran (permission) tambahan diperlukan.

## Sebelum Terbit ke Google Play

1. **Ganti audio doa/hijaiyah TTS dengan rakaman qari sebenar** — kualiti sebutan Arab TTS tidak sesuai sebagai rujukan bacaan. Semak semula teks doa dengan pihak berautoriti agama.
2. Tukar `applicationId` dalam `android/app/build.gradle` kepada pakej syarikat anda.
3. Tambah ikon aplikasi (`flutter_launcher_icons`) dan splash screen.
4. Sediakan keystore & konfigurasi signing untuk release.
5. Lengkapkan borang *Data safety* & *Families Policy* (aplikasi kanak-kanak) di Play Console.

## Struktur Kod

```
lib/
├── main.dart                 # Titik masuk
├── theme/app_theme.dart      # Tema pastel Material 3
├── services/                 # Tetapan, audio/TTS, ganjaran
├── data/app_data.dart        # Semua kandungan (ABC, doa, hijaiyah, dll.)
├── widgets/                  # Kad, dialog menang, pembantu kongsi
├── screens/                  # 12 skrin (utama, modul, tetapan, ganjaran)
└── games/                    # 5 permainan IQ (3 tahap setiap satu)
```

## Bina APK Melalui GitHub (Tanpa Pasang Flutter)

1. Buat repo baru di github.com (butang **New**), pilih **Private**.
2. Upload SEMUA kandungan folder ini: **Add file → Upload files** → seret masuk semua fail & folder → **Commit changes**. Pastikan folder `.github` turut naik (jika upload web tak bawa folder tersembunyi, guna GitHub Desktop).
3. Pergi ke tab **Actions** → tunggu "Bina APK" siap (± 10 minit, tanda hijau ✅).
4. Klik run tersebut → bahagian **Artifacts** → muat turun **app-release** → dalamnya ada `app-release.apk`.
5. Hantar APK ke telefon dan pasang.

Setiap kali kod dikemaskini dan di-upload semula, APK baru akan dibina secara automatik.
