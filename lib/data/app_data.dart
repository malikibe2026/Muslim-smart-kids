import 'package:flutter/material.dart';

// ============================================================ ABC
class AbcItem {
  final String letter;
  final String msWord;
  final String msEmoji;
  final String enWord;
  final String enEmoji;
  const AbcItem(this.letter, this.msWord, this.msEmoji, this.enWord, this.enEmoji);
}

const List<AbcItem> abcItems = [
  AbcItem('A', 'Ayam', '🐔', 'Apple', '🍎'),
  AbcItem('B', 'Bola', '⚽', 'Ball', '⚽'),
  AbcItem('C', 'Cawan', '☕', 'Cat', '🐱'),
  AbcItem('D', 'Daun', '🍃', 'Dog', '🐶'),
  AbcItem('E', 'Epal', '🍎', 'Elephant', '🐘'),
  AbcItem('F', 'Feri', '⛴️', 'Fish', '🐟'),
  AbcItem('G', 'Gajah', '🐘', 'Goat', '🐐'),
  AbcItem('H', 'Harimau', '🐯', 'House', '🏠'),
  AbcItem('I', 'Ikan', '🐟', 'Ice cream', '🍦'),
  AbcItem('J', 'Jam', '⌚', 'Juice', '🧃'),
  AbcItem('K', 'Kucing', '🐱', 'Kite', '🪁'),
  AbcItem('L', 'Lebah', '🐝', 'Lion', '🦁'),
  AbcItem('M', 'Monyet', '🐵', 'Moon', '🌙'),
  AbcItem('N', 'Nanas', '🍍', 'Nest', '🪺'),
  AbcItem('O', 'Oren', '🍊', 'Orange', '🍊'),
  AbcItem('P', 'Pisang', '🍌', 'Pencil', '✏️'),
  AbcItem('Q', 'Quran', '📖', 'Queen', '👸'),
  AbcItem('R', 'Roti', '🍞', 'Rabbit', '🐰'),
  AbcItem('S', 'Singa', '🦁', 'Sun', '☀️'),
  AbcItem('T', 'Telur', '🥚', 'Tiger', '🐯'),
  AbcItem('U', 'Ular', '🐍', 'Umbrella', '☂️'),
  AbcItem('V', 'Van', '🚐', 'Violin', '🎻'),
  AbcItem('W', 'Wau', '🪁', 'Watch', '⌚'),
  AbcItem('X', 'X-ray', '🩻', 'X-ray', '🩻'),
  AbcItem('Y', 'Yoyo', '🪀', 'Yo-yo', '🪀'),
  AbcItem('Z', 'Zirafah', '🦒', 'Zebra', '🦓'),
];

// ============================================================ Nombor
const List<String> numberWordsMs = [
  'satu', 'dua', 'tiga', 'empat', 'lima',
  'enam', 'tujuh', 'lapan', 'sembilan', 'sepuluh',
  'sebelas', 'dua belas', 'tiga belas', 'empat belas', 'lima belas',
  'enam belas', 'tujuh belas', 'lapan belas', 'sembilan belas', 'dua puluh',
];

const List<String> numberWordsEn = [
  'one', 'two', 'three', 'four', 'five',
  'six', 'seven', 'eight', 'nine', 'ten',
  'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen',
  'sixteen', 'seventeen', 'eighteen', 'nineteen', 'twenty',
];

// ============================================================ Warna
class ColorItem {
  final String ms;
  final String en;
  final int value;
  final bool darkBackground; // true = guna teks putih.
  const ColorItem(this.ms, this.en, this.value, this.darkBackground);
}

const List<ColorItem> colorItems = [
  ColorItem('Merah', 'Red', 0xFFE53935, true),
  ColorItem('Biru', 'Blue', 0xFF1E88E5, true),
  ColorItem('Kuning', 'Yellow', 0xFFFDD835, false),
  ColorItem('Hijau', 'Green', 0xFF43A047, true),
  ColorItem('Oren', 'Orange', 0xFFFB8C00, true),
  ColorItem('Ungu', 'Purple', 0xFF8E24AA, true),
  ColorItem('Merah Jambu', 'Pink', 0xFFF06292, true),
  ColorItem('Coklat', 'Brown', 0xFF795548, true),
  ColorItem('Hitam', 'Black', 0xFF212121, true),
  ColorItem('Putih', 'White', 0xFFFFFFFF, false),
];

// ============================================================ Bentuk
class ShapeItem {
  final String ms;
  final String en;
  final IconData icon;
  final int color;
  const ShapeItem(this.ms, this.en, this.icon, this.color);
}

const List<ShapeItem> shapeItems = [
  ShapeItem('Bulatan', 'Circle', Icons.circle, 0xFF64B5F6),
  ShapeItem('Segi Empat', 'Square', Icons.square, 0xFFF06292),
  ShapeItem('Segi Tiga', 'Triangle', Icons.change_history, 0xFF81C784),
  ShapeItem('Bintang', 'Star', Icons.star, 0xFFFFC107),
  ShapeItem('Hati', 'Heart', Icons.favorite, 0xFFE57373),
];

// ============================================================ Haiwan
class AnimalItem {
  final String emoji;
  final String ms;
  final String en;
  final String sound;
  const AnimalItem(this.emoji, this.ms, this.en, this.sound);
}

const List<AnimalItem> animalItems = [
  AnimalItem('🐱', 'Kucing', 'Cat', 'Miau miau'),
  AnimalItem('🐔', 'Ayam', 'Chicken', 'Kok kok kok'),
  AnimalItem('🐮', 'Lembu', 'Cow', 'Moo moo'),
  AnimalItem('🐐', 'Kambing', 'Goat', 'Mbek mbek'),
  AnimalItem('🐘', 'Gajah', 'Elephant', 'Nguooo'),
  AnimalItem('🦁', 'Singa', 'Lion', 'Roarrr'),
  AnimalItem('🐯', 'Harimau', 'Tiger', 'Aummm'),
  AnimalItem('🐵', 'Monyet', 'Monkey', 'Uk uk uk'),
  AnimalItem('🦆', 'Itik', 'Duck', 'Kuek kuek'),
  AnimalItem('🐴', 'Kuda', 'Horse', 'Hi hi hi'),
  AnimalItem('🐦', 'Burung', 'Bird', 'Ciap ciap'),
  AnimalItem('🐸', 'Katak', 'Frog', 'Kroak kroak'),
];

// ============================================================ Huruf Hijaiyah
class HijaiyahItem {
  final String char;
  final String name; // Nama rumi.
  final String arName; // Nama Arab (untuk TTS Arab).
  const HijaiyahItem(this.char, this.name, this.arName);
}

const List<HijaiyahItem> hijaiyahItems = [
  HijaiyahItem('ا', 'Alif', 'ألف'),
  HijaiyahItem('ب', 'Ba', 'باء'),
  HijaiyahItem('ت', 'Ta', 'تاء'),
  HijaiyahItem('ث', 'Tsa', 'ثاء'),
  HijaiyahItem('ج', 'Jim', 'جيم'),
  HijaiyahItem('ح', 'Ha', 'حاء'),
  HijaiyahItem('خ', 'Kho', 'خاء'),
  HijaiyahItem('د', 'Dal', 'دال'),
  HijaiyahItem('ذ', 'Zal', 'ذال'),
  HijaiyahItem('ر', 'Ro', 'راء'),
  HijaiyahItem('ز', 'Zai', 'زاي'),
  HijaiyahItem('س', 'Sin', 'سين'),
  HijaiyahItem('ش', 'Syin', 'شين'),
  HijaiyahItem('ص', 'Sod', 'صاد'),
  HijaiyahItem('ض', 'Dhod', 'ضاد'),
  HijaiyahItem('ط', 'Tho', 'طاء'),
  HijaiyahItem('ظ', 'Zho', 'ظاء'),
  HijaiyahItem('ع', 'Ain', 'عين'),
  HijaiyahItem('غ', 'Ghoin', 'غين'),
  HijaiyahItem('ف', 'Fa', 'فاء'),
  HijaiyahItem('ق', 'Qof', 'قاف'),
  HijaiyahItem('ك', 'Kaf', 'كاف'),
  HijaiyahItem('ل', 'Lam', 'لام'),
  HijaiyahItem('م', 'Mim', 'ميم'),
  HijaiyahItem('ن', 'Nun', 'نون'),
  HijaiyahItem('ه', 'Ha', 'هاء'),
  HijaiyahItem('و', 'Wau', 'واو'),
  HijaiyahItem('ي', 'Ya', 'ياء'),
];

// ============================================================ Doa Harian
class DoaItem {
  final String id;
  final String emoji;
  final String titleMs;
  final String titleEn;
  final String arabic;
  final String rumi;
  final String meaningMs;
  final String meaningEn;
  const DoaItem(this.id, this.emoji, this.titleMs, this.titleEn, this.arabic,
      this.rumi, this.meaningMs, this.meaningEn);
}

const List<DoaItem> doaItems = [
  DoaItem(
    'bangun_tidur',
    '🌅',
    'Doa Bangun Tidur',
    'Waking Up',
    'اَلْحَمْدُ لِلّٰهِ الَّذِيْ أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُوْرُ',
    "Alhamdulillahil-lazi ahyana ba'da ma amatana wa ilaihin-nusyur.",
    'Segala puji bagi Allah yang menghidupkan kami selepas mematikan kami (tidur), dan kepada-Nya kami dibangkitkan.',
    'Praise be to Allah who gave us life after causing us to die (sleep), and to Him is the resurrection.',
  ),
  DoaItem(
    'sebelum_makan',
    '🍽️',
    'Doa Sebelum Makan',
    'Before Eating',
    'اَللّٰهُمَّ بَارِكْ لَنَا فِيْمَا رَزَقْتَنَا وَقِنَا عَذَابَ النَّارِ',
    "Allahumma barik lana fima razaqtana waqina 'azaban-nar.",
    'Ya Allah, berkatilah rezeki yang Engkau kurniakan kepada kami dan peliharalah kami daripada azab neraka.',
    'O Allah, bless the provision You have given us and protect us from the punishment of the Fire.',
  ),
  DoaItem(
    'selepas_makan',
    '😋',
    'Doa Selepas Makan',
    'After Eating',
    'اَلْحَمْدُ لِلّٰهِ الَّذِيْ أَطْعَمَنَا وَسَقَانَا وَجَعَلَنَا مِنَ الْمُسْلِمِيْنَ',
    "Alhamdulillahil-lazi at'amana wa saqana wa ja'alana minal-muslimin.",
    'Segala puji bagi Allah yang memberi kami makan dan minum serta menjadikan kami dalam kalangan orang Islam.',
    'Praise be to Allah who fed us, gave us drink, and made us among the Muslims.',
  ),
  DoaItem(
    'masuk_tandas',
    '🚪',
    'Doa Masuk Tandas',
    'Entering the Toilet',
    'اَللّٰهُمَّ إِنِّيْ أَعُوْذُ بِكَ مِنَ الْخُبُثِ وَالْخَبَائِثِ',
    "Allahumma inni a'uzu bika minal-khubusi wal-khaba'is.",
    'Ya Allah, aku berlindung dengan-Mu daripada syaitan jantan dan syaitan betina.',
    'O Allah, I seek refuge in You from the male and female devils.',
  ),
  DoaItem(
    'keluar_tandas',
    '🚽',
    'Doa Keluar Tandas',
    'Leaving the Toilet',
    'غُفْرَانَكَ',
    'Ghufranak.',
    'Aku memohon keampunan-Mu (ya Allah).',
    'I seek Your forgiveness (O Allah).',
  ),
  DoaItem(
    'keluar_rumah',
    '🏠',
    'Doa Keluar Rumah',
    'Leaving Home',
    'بِسْمِ اللّٰهِ تَوَكَّلْتُ عَلَى اللّٰهِ وَلَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللّٰهِ',
    "Bismillahi tawakkaltu 'alallah, wa la haula wa la quwwata illa billah.",
    'Dengan nama Allah, aku bertawakal kepada Allah; tiada daya dan kekuatan melainkan dengan pertolongan Allah.',
    'In the name of Allah, I place my trust in Allah; there is no power and no strength except with Allah.',
  ),
];

// ============================================================ Rukun Islam
class RukunItem {
  final String emoji;
  final String titleMs;
  final String titleEn;
  final String descMs;
  final String descEn;
  const RukunItem(this.emoji, this.titleMs, this.titleEn, this.descMs, this.descEn);
}

const List<RukunItem> rukunItems = [
  RukunItem('☝️', 'Mengucap Dua Kalimah Syahadah', 'Declaration of Faith (Syahadah)',
      'Beriman bahawa tiada Tuhan melainkan Allah dan Nabi Muhammad itu pesuruh Allah.',
      'Believing there is no god but Allah, and Muhammad is His Messenger.'),
  RukunItem('🕌', 'Menunaikan Solat', 'Performing Prayer (Solat)',
      'Bersolat lima kali sehari: Subuh, Zohor, Asar, Maghrib dan Isyak.',
      'Praying five times a day: Fajr, Zuhr, Asr, Maghrib and Isha.'),
  RukunItem('💝', 'Mengeluarkan Zakat', 'Giving Charity (Zakat)',
      'Berkongsi rezeki dengan orang yang memerlukan.',
      'Sharing our wealth with those in need.'),
  RukunItem('🌙', 'Berpuasa di Bulan Ramadan', 'Fasting in Ramadan',
      'Menahan diri daripada makan dan minum dari subuh hingga maghrib.',
      'Not eating or drinking from dawn until sunset.'),
  RukunItem('🕋', 'Menunaikan Haji', 'Pilgrimage (Haji)',
      'Mengerjakan haji di Makkah bagi yang berkemampuan.',
      'Visiting Makkah for pilgrimage, for those who are able.'),
];

// ============================================================ Data permainan
class PicItem {
  final String emoji;
  final String ms;
  final String en;
  const PicItem(this.emoji, this.ms, this.en);
}

const List<PicItem> picItems = [
  PicItem('🐱', 'Kucing', 'Cat'),
  PicItem('🐔', 'Ayam', 'Chicken'),
  PicItem('🐮', 'Lembu', 'Cow'),
  PicItem('🐘', 'Gajah', 'Elephant'),
  PicItem('🦁', 'Singa', 'Lion'),
  PicItem('🐵', 'Monyet', 'Monkey'),
  PicItem('🦆', 'Itik', 'Duck'),
  PicItem('🐰', 'Arnab', 'Rabbit'),
  PicItem('🍎', 'Epal', 'Apple'),
  PicItem('🍌', 'Pisang', 'Banana'),
  PicItem('🍊', 'Oren', 'Orange'),
  PicItem('⚽', 'Bola', 'Ball'),
  PicItem('🚗', 'Kereta', 'Car'),
  PicItem('🌙', 'Bulan', 'Moon'),
  PicItem('⭐', 'Bintang', 'Star'),
  PicItem('🏠', 'Rumah', 'House'),
];

/// Emoji untuk permainan Memory Card.
const List<String> gameEmojis = [
  '🐱', '🐔', '🐮', '🐘', '🦁', '🐵', '🦆', '🐰',
  '🍎', '🍌', '🍊', '🍇', '⚽', '🚗', '🌙', '⭐',
];

/// Emoji untuk permainan Kira Objek.
const List<String> countEmojis = ['🍎', '⭐', '🎈', '🐟', '🌸', '🍪'];
