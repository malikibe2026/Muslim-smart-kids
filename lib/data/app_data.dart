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

// ============================================================ Kebesaran Allah
class KebesaranItem {
  final String id;
  final String emoji;
  final String titleMs;
  final String titleEn;
  final String textMs;
  final String textEn;
  const KebesaranItem(this.id, this.emoji, this.titleMs, this.titleEn,
      this.textMs, this.textEn);
}

const List<KebesaranItem> kebesaranItems = [
  KebesaranItem(
    'gunung',
    '⛰️',
    'Gunung Ganang',
    'The Mountains',
    'Allah ciptakan gunung ganang yang tinggi dan gagah supaya bumi tidak goyang. Subhanallah, hebatnya ciptaan Allah!',
    'Allah created tall, mighty mountains so the earth would not shake. SubhanAllah, how amazing Allah\'s creation is!',
  ),
  KebesaranItem(
    'bukit',
    '🏞️',
    'Bukit Bukau',
    'Hills and Valleys',
    'Allah jadikan bukit bukau dan lembah yang cantik untuk kita lihat dan jadikan tempat tumbuhan hidup subur.',
    'Allah made beautiful hills and valleys where plants can grow and flourish for us to enjoy.',
  ),
  KebesaranItem(
    'laut',
    '🌊',
    'Lautan Luas',
    'The Vast Ocean',
    'Allah ciptakan lautan yang sangat luas, penuh dengan ikan dan hidupan yang pelbagai. Semuanya rezeki daripada Allah.',
    'Allah created the vast ocean, full of fish and many creatures. All of it is sustenance from Allah.',
  ),
  KebesaranItem(
    'langit',
    '☁️',
    'Langit Tanpa Tiang',
    'The Sky Without Pillars',
    'Allah bina langit yang tinggi tanpa tiang untuk menopangnya. Hanya Allah yang mampu buat begitu.',
    'Allah raised the sky high without any pillars to hold it up. Only Allah can do such a thing.',
  ),
  KebesaranItem(
    'matahari_bulan',
    '🌞',
    'Matahari dan Bulan',
    'The Sun and the Moon',
    'Allah jadikan matahari menyinar siang hari dan bulan menyinar malam hari, silih berganti tanpa pernah lupa.',
    'Allah made the sun shine by day and the moon shine by night, taking turns without ever failing.',
  ),
  KebesaranItem(
    'hujan',
    '🌧️',
    'Air Hujan',
    'The Rain',
    'Allah turunkan hujan dari langit untuk menyuburkan tanah, memberi minum kepada semua makhluk di bumi.',
    'Allah sends rain down from the sky to nourish the land and give drink to every creature on earth.',
  ),
  KebesaranItem(
    'makanan',
    '🍚',
    'Allah Beri Kita Makan',
    'Allah Provides Our Food',
    'Allah yang memberi rezeki kepada semua makhluk-Nya — manusia, haiwan dan tumbuhan. Kita mesti sentiasa bersyukur.',
    'Allah provides sustenance to all His creatures — humans, animals and plants. We must always be grateful.',
  ),
  KebesaranItem(
    'tumbuhan',
    '🌳',
    'Pokok dan Tumbuhan',
    'Trees and Plants',
    'Allah tumbuhkan pokok-pokok dan tumbuhan yang memberi kita buah, oksigen dan keteduhan.',
    'Allah grows trees and plants that give us fruit, oxygen and cool shade.',
  ),
  KebesaranItem(
    'haiwan_ciptaan',
    '🐾',
    'Pelbagai Haiwan',
    'All Kinds of Animals',
    'Allah ciptakan berjuta-juta jenis haiwan yang berbeza — besar, kecil, terbang, berenang. Semuanya tanda kebesaran Allah.',
    'Allah created millions of different kinds of animals — big, small, flying, swimming. Each one is a sign of Allah\'s greatness.',
  ),
  KebesaranItem(
    'diri_kita',
    '🧒',
    'Diri Kita Sendiri',
    'Ourselves',
    'Allah ciptakan kita dengan mata untuk melihat, telinga untuk mendengar dan hati untuk berfikir. Sungguh sempurna ciptaan Allah.',
    'Allah created us with eyes to see, ears to hear, and a heart to think. Allah\'s creation is truly perfect.',
  ),
  KebesaranItem(
    'syurga',
    '🌺',
    'Syurga di Akhirat',
    'Paradise in the Hereafter',
    'Allah janjikan syurga yang indah di akhirat untuk orang yang beriman dan buat kebaikan. Penuh dengan nikmat yang kekal.',
    'Allah promises a beautiful paradise in the Hereafter for those who believe and do good. Full of everlasting blessings.',
  ),
  KebesaranItem(
    'akhirat',
    '🌌',
    'Hari Akhirat',
    'The Day of Judgement',
    'Allah akan hidupkan semula semua manusia di akhirat untuk dihitung amalan mereka. Allah Maha Adil kepada semua.',
    'Allah will bring all people back to life on the Day of Judgement to account for their deeds. Allah is Most Just to all.',
  ),
];

// ============================================================ Lagu Kanak-kanak (English)
class RhymeItem {
  final String id;
  final String emoji;
  final String title;
  final String lyrics;
  const RhymeItem(this.id, this.emoji, this.title, this.lyrics);
}

const List<RhymeItem> rhymeItems = [
  RhymeItem(
    'twinkle',
    '⭐',
    'Twinkle Twinkle Little Star',
    'Twinkle, twinkle, little star,\nHow I wonder what you are.\nUp above the world so high,\nLike a diamond in the sky.\nTwinkle, twinkle, little star,\nHow I wonder what you are.',
  ),
  RhymeItem(
    'row_boat',
    '🚣',
    'Row Row Row Your Boat',
    'Row, row, row your boat,\nGently down the stream.\nMerrily, merrily, merrily, merrily,\nLife is but a dream.',
  ),
  RhymeItem(
    'old_macdonald',
    '🚜',
    'Old MacDonald Had a Farm',
    'Old MacDonald had a farm, E-I-E-I-O!\nAnd on his farm he had a cow, E-I-E-I-O!\nWith a moo-moo here and a moo-moo there,\nHere a moo, there a moo, everywhere a moo-moo.\nOld MacDonald had a farm, E-I-E-I-O!',
  ),
  RhymeItem(
    'baa_baa',
    '🐑',
    'Baa Baa Black Sheep',
    'Baa, baa, black sheep,\nHave you any wool?\nYes sir, yes sir,\nThree bags full!\nOne for the master,\nOne for the dame,\nAnd one for the little boy\nWho lives down the lane.',
  ),
  RhymeItem(
    'itsy_bitsy',
    '🕷️',
    'Itsy Bitsy Spider',
    'The itsy bitsy spider climbed up the waterspout.\nDown came the rain and washed the spider out.\nOut came the sun and dried up all the rain,\nAnd the itsy bitsy spider climbed up the spout again.',
  ),
  RhymeItem(
    'head_shoulders',
    '🙆',
    'Head, Shoulders, Knees and Toes',
    'Head, shoulders, knees and toes,\nKnees and toes!\nHead, shoulders, knees and toes,\nKnees and toes!\nAnd eyes and ears and mouth and nose,\nHead, shoulders, knees and toes,\nKnees and toes!',
  ),
  RhymeItem(
    'wheels_bus',
    '🚌',
    'The Wheels on the Bus',
    'The wheels on the bus go round and round,\nRound and round, round and round.\nThe wheels on the bus go round and round,\nAll through the town.',
  ),
  RhymeItem(
    'happy',
    '😊',
    'If You\'re Happy and You Know It',
    'If you\'re happy and you know it, clap your hands!\nIf you\'re happy and you know it, clap your hands!\nIf you\'re happy and you know it, and you really want to show it,\nIf you\'re happy and you know it, clap your hands!',
  ),
];

// ============================================================ Anggota Badan
class BodyPartItem {
  final String emoji;
  final String ms;
  final String en;
  const BodyPartItem(this.emoji, this.ms, this.en);
}

const List<BodyPartItem> bodyPartItems = [
  BodyPartItem('👤', 'Kepala', 'Head'),
  BodyPartItem('👁️', 'Mata', 'Eyes'),
  BodyPartItem('👃', 'Hidung', 'Nose'),
  BodyPartItem('👂', 'Telinga', 'Ears'),
  BodyPartItem('👄', 'Mulut', 'Mouth'),
  BodyPartItem('🦷', 'Gigi', 'Teeth'),
  BodyPartItem('💇', 'Rambut', 'Hair'),
  BodyPartItem('🤚', 'Tangan', 'Hands'),
  BodyPartItem('👆', 'Jari', 'Fingers'),
  BodyPartItem('🦵', 'Kaki', 'Legs'),
  BodyPartItem('🦶', 'Tapak Kaki', 'Feet'),
  BodyPartItem('🫃', 'Perut', 'Tummy'),
  BodyPartItem('🦴', 'Bahu', 'Shoulders'),
  BodyPartItem('🫱', 'Lutut', 'Knees'),
  BodyPartItem('❤️', 'Hati', 'Heart'),
];

// ============================================================ Kisah 25 Rasul
class ProphetItem {
  final String emoji;
  final String nameMs;
  final String nameEn;
  final String storyMs;
  final String storyEn;
  const ProphetItem(this.emoji, this.nameMs, this.nameEn, this.storyMs, this.storyEn);
}

const List<ProphetItem> prophetItems = [
  ProphetItem('👨', 'Nabi Adam A.S.', 'Prophet Adam (A.S.)',
      'Manusia dan nabi yang pertama, diciptakan Allah terus di syurga.',
      'The first human and the first prophet, created by Allah directly in Paradise.'),
  ProphetItem('📜', 'Nabi Idris A.S.', 'Prophet Idris (A.S.)',
      'Nabi yang bijaksana, antara orang pertama yang pandai menulis.',
      'A wise prophet, among the first people to be skilled in writing.'),
  ProphetItem('🚢', 'Nabi Nuh A.S.', 'Prophet Nuh (A.S.)',
      'Membina bahtera besar untuk selamatkan orang beriman daripada banjir besar.',
      'Built a great ark to save the believers from a huge flood.'),
  ProphetItem('🏜️', 'Nabi Hud A.S.', 'Prophet Hud (A.S.)',
      'Diutus kepada kaum Aad, mengajak mereka sembah Allah sahaja.',
      'Sent to the people of Aad, calling them to worship Allah alone.'),
  ProphetItem('🐫', 'Nabi Soleh A.S.', 'Prophet Soleh (A.S.)',
      'Diutus kepada kaum Thamud bersama mukjizat unta betina.',
      'Sent to the people of Thamud with the miracle of a she-camel.'),
  ProphetItem('🔥', 'Nabi Ibrahim A.S.', 'Prophet Ibrahim (A.S.)',
      'Dilemparkan ke dalam api kerana imannya, tetapi Allah selamatkan dia — api jadi sejuk!',
      'Thrown into a fire for his faith, but Allah saved him — the fire became cool!'),
  ProphetItem('🌆', 'Nabi Lut A.S.', 'Prophet Lut (A.S.)',
      'Mengajak kaumnya berhenti buat kejahatan dan kembali taat kepada Allah.',
      'Called his people to stop wrongdoing and return to obeying Allah.'),
  ProphetItem('🐏', 'Nabi Ismail A.S.', 'Prophet Ismail (A.S.)',
      'Anak Nabi Ibrahim yang taat, sanggup dikorbankan demi mentaati Allah.',
      'The obedient son of Prophet Ibrahim, willing to be sacrificed to obey Allah.'),
  ProphetItem('🕋', 'Nabi Ishaq A.S.', 'Prophet Ishaq (A.S.)',
      'Anak Nabi Ibrahim yang juga menjadi nabi dan ayah kepada Nabi Yaakub.',
      'Son of Prophet Ibrahim who also became a prophet and father of Prophet Yaakub.'),
  ProphetItem('👪', 'Nabi Yaakub A.S.', 'Prophet Yaakub (A.S.)',
      'Ayah kepada 12 orang anak, termasuk Nabi Yusuf yang disayangi.',
      'Father of 12 sons, including the beloved Prophet Yusuf.'),
  ProphetItem('🌙', 'Nabi Yusuf A.S.', 'Prophet Yusuf (A.S.)',
      'Terkenal dengan mimpi indah dan kesabarannya, akhirnya menjadi menteri di Mesir.',
      'Famous for his beautiful dream and patience, he became a minister in Egypt.'),
  ProphetItem('🩹', 'Nabi Ayub A.S.', 'Prophet Ayub (A.S.)',
      'Diuji dengan sakit yang lama, tetapi tetap sabar dan tidak putus berdoa.',
      'Tested with a long illness, yet remained patient and never stopped praying.'),
  ProphetItem('🏘️', 'Nabi Syuaib A.S.', 'Prophet Syuaib (A.S.)',
      'Mengajak kaumnya berlaku jujur dalam berniaga dan menyukat dengan adil.',
      'Called his people to be honest in trade and to measure fairly.'),
  ProphetItem('🌊', 'Nabi Musa A.S.', 'Prophet Musa (A.S.)',
      'Diberi mukjizat tongkat yang boleh membelah laut untuk selamatkan kaumnya.',
      'Given the miracle of a staff that could split the sea to save his people.'),
  ProphetItem('🗣️', 'Nabi Harun A.S.', 'Prophet Harun (A.S.)',
      'Abang Nabi Musa yang membantunya berdakwah kerana pandai bercakap.',
      'Brother of Prophet Musa who helped him preach, as he was skilled in speech.'),
  ProphetItem('🕌', 'Nabi Zulkifli A.S.', 'Prophet Zulkifli (A.S.)',
      'Dikenali kerana kesabaran dan keadilannya memimpin kaumnya.',
      'Known for his patience and fairness in leading his people.'),
  ProphetItem('👑', 'Nabi Daud A.S.', 'Prophet Daud (A.S.)',
      'Diberi suara merdu dan kitab Zabur, juga mengalahkan Jalut yang gagah.',
      'Given a beautiful voice and the Zabur scripture, and he defeated the mighty Jalut.'),
  ProphetItem('💍', 'Nabi Sulaiman A.S.', 'Prophet Sulaiman (A.S.)',
      'Boleh bercakap dengan haiwan dan memerintah kerajaan yang sangat hebat.',
      'Could speak with animals and ruled over a magnificent kingdom.'),
  ProphetItem('⛰️', 'Nabi Ilyas A.S.', 'Prophet Ilyas (A.S.)',
      'Mengajak kaumnya berhenti menyembah berhala dan kembali kepada Allah.',
      'Called his people to stop idol worship and return to Allah.'),
  ProphetItem('🤝', 'Nabi Ilyasa A.S.', 'Prophet Ilyasa (A.S.)',
      'Meneruskan dakwah Nabi Ilyas dengan penuh kasih sayang.',
      'Continued Prophet Ilyas\'s mission with great compassion.'),
  ProphetItem('🐋', 'Nabi Yunus A.S.', 'Prophet Yunus (A.S.)',
      'Ditelan ikan paus besar, lalu selamat kerana sentiasa berzikir kepada Allah.',
      'Swallowed by a huge whale, and was saved because he kept remembering Allah.'),
  ProphetItem('🙏', 'Nabi Zakaria A.S.', 'Prophet Zakaria (A.S.)',
      'Berdoa lama untuk mendapat anak, dan Allah kurniakan Nabi Yahya.',
      'Prayed for a long time for a child, and Allah blessed him with Prophet Yahya.'),
  ProphetItem('📖', 'Nabi Yahya A.S.', 'Prophet Yahya (A.S.)',
      'Sejak kecil sudah bersungguh-sungguh belajar dan beribadat kepada Allah.',
      'Since childhood he was diligent in learning and worshipping Allah.'),
  ProphetItem('✨', 'Nabi Isa A.S.', 'Prophet Isa (A.S.)',
      'Dilahirkan tanpa bapa sebagai mukjizat, dan boleh bercakap sejak bayi.',
      'Born without a father as a miracle, and could speak as a baby.'),
  ProphetItem('🕌', 'Nabi Muhammad S.A.W.', 'Prophet Muhammad (S.A.W.)',
      'Rasul terakhir dan penutup segala nabi, contoh akhlak terbaik untuk seluruh manusia.',
      'The final messenger and seal of all prophets, the best example of character for all mankind.'),
];

// ============================================================ Panggil Nama Anak
class NameOption {
  final String label;
  final String nameToSpeak;
  const NameOption(this.label, this.nameToSpeak);
}

const List<NameOption> childNameOptions = [
  NameOption('Adni', 'Adni'),
  NameOption('Humaira', 'Humaira'),
  NameOption('Adni Humaira', 'Adni Humaira'),
  NameOption('Adni Humaira binti Ahmad Maliki', 'Adni Humaira binti Ahmad Maliki'),
];

class VoiceStyle {
  final String emoji;
  final String labelMs;
  final String labelEn;
  final double pitch;
  final double rate;
  const VoiceStyle(this.emoji, this.labelMs, this.labelEn, this.pitch, this.rate);
}

const List<VoiceStyle> voiceStyles = [
  VoiceStyle('😊', 'Suara Lembut', 'Gentle Voice', 1.0, 0.42),
  VoiceStyle('🎈', 'Suara Comel', 'Cute Voice', 1.5, 0.5),
  VoiceStyle('🎉', 'Suara Ceria', 'Cheerful Voice', 1.25, 0.62),
  VoiceStyle('🐢', 'Suara Perlahan', 'Slow Voice', 0.9, 0.3),
];

// ============================================================ Nama-nama 25 Rasul (kad nama)
class ProphetNameItem {
  final String emoji;
  final String arabic;
  final String nameMs;
  final String nameEn;
  const ProphetNameItem(this.emoji, this.arabic, this.nameMs, this.nameEn);
}

const List<ProphetNameItem> prophetNameItems = [
  ProphetNameItem('👨', 'آدَم', 'Adam', 'Adam'),
  ProphetNameItem('📜', 'إِدْرِيس', 'Idris', 'Idris'),
  ProphetNameItem('🚢', 'نُوح', 'Nuh', 'Nuh'),
  ProphetNameItem('🏜️', 'هُود', 'Hud', 'Hud'),
  ProphetNameItem('🐫', 'صَالِح', 'Soleh', 'Soleh'),
  ProphetNameItem('🔥', 'إِبْرَاهِيم', 'Ibrahim', 'Ibrahim'),
  ProphetNameItem('🌆', 'لُوط', 'Lut', 'Lut'),
  ProphetNameItem('🐏', 'إِسْمَاعِيل', 'Ismail', 'Ismail'),
  ProphetNameItem('🕋', 'إِسْحَاق', 'Ishaq', 'Ishaq'),
  ProphetNameItem('👪', 'يَعْقُوب', 'Yaakub', 'Yaakub'),
  ProphetNameItem('🌙', 'يُوسُف', 'Yusuf', 'Yusuf'),
  ProphetNameItem('🩹', 'أَيُّوب', 'Ayub', 'Ayub'),
  ProphetNameItem('🏘️', 'شُعَيْب', 'Syuaib', 'Syuaib'),
  ProphetNameItem('🌊', 'مُوسَى', 'Musa', 'Musa'),
  ProphetNameItem('🗣️', 'هَارُون', 'Harun', 'Harun'),
  ProphetNameItem('🕌', 'ذُو الْكِفْل', 'Zulkifli', 'Zulkifli'),
  ProphetNameItem('👑', 'دَاوُد', 'Daud', 'Daud'),
  ProphetNameItem('💍', 'سُلَيْمَان', 'Sulaiman', 'Sulaiman'),
  ProphetNameItem('⛰️', 'إِلْيَاس', 'Ilyas', 'Ilyas'),
  ProphetNameItem('🤝', 'اَلْيَسَع', 'Ilyasa', 'Ilyasa'),
  ProphetNameItem('🐋', 'يُونُس', 'Yunus', 'Yunus'),
  ProphetNameItem('🙏', 'زَكَرِيَّا', 'Zakaria', 'Zakaria'),
  ProphetNameItem('📖', 'يَحْيَى', 'Yahya', 'Yahya'),
  ProphetNameItem('✨', 'عِيسَى', 'Isa', 'Isa'),
  ProphetNameItem('🕌', 'مُحَمَّد ﷺ', 'Muhammad', 'Muhammad'),
];

// ============================================================ 99 Nama Allah (Asmaul Husna)
class AsmaulHusnaItem {
  final int number;
  final String arabic;
  final String transliteration;
  final String meaningMs;
  final String meaningEn;
  const AsmaulHusnaItem(this.number, this.arabic, this.transliteration,
      this.meaningMs, this.meaningEn);
}

const List<AsmaulHusnaItem> asmaulHusnaItems = [
  AsmaulHusnaItem(1, 'اَللّٰه', 'Allah', 'Nama Allah Yang Maha Esa', 'The One True God'),
  AsmaulHusnaItem(2, 'اَلرَّحْمٰن', 'Ar-Rahman', 'Yang Maha Pemurah', 'The Most Compassionate'),
  AsmaulHusnaItem(3, 'اَلرَّحِيْم', 'Ar-Rahim', 'Yang Maha Penyayang', 'The Most Merciful'),
  AsmaulHusnaItem(4, 'اَلْمَلِك', 'Al-Malik', 'Yang Maha Merajai', 'The King and Owner of Dominion'),
  AsmaulHusnaItem(5, 'اَلْقُدُّوْس', 'Al-Quddus', 'Yang Maha Suci', 'The Most Sacred'),
  AsmaulHusnaItem(6, 'اَلسَّلَام', 'As-Salam', 'Yang Maha Sejahtera', 'The Source of Peace'),
  AsmaulHusnaItem(7, 'اَلْمُؤْمِن', 'Al-Mu\'min', 'Yang Maha Memberi Keamanan', 'The Giver of Faith and Security'),
  AsmaulHusnaItem(8, 'اَلْمُهَيْمِن', 'Al-Muhaimin', 'Yang Maha Memelihara', 'The Guardian and Protector'),
  AsmaulHusnaItem(9, 'اَلْعَزِيْز', 'Al-Aziz', 'Yang Maha Gagah', 'The Almighty'),
  AsmaulHusnaItem(10, 'اَلْجَبَّار', 'Al-Jabbar', 'Yang Maha Perkasa', 'The Compeller'),
  AsmaulHusnaItem(11, 'اَلْمُتَكَبِّر', 'Al-Mutakabbir', 'Yang Maha Megah', 'The Supreme in Greatness'),
  AsmaulHusnaItem(12, 'اَلْخَالِق', 'Al-Khaliq', 'Yang Maha Pencipta', 'The Creator'),
  AsmaulHusnaItem(13, 'اَلْبَارِئ', 'Al-Bari\'', 'Yang Maha Menjadikan', 'The Maker'),
  AsmaulHusnaItem(14, 'اَلْمُصَوِّر', 'Al-Musawwir', 'Yang Maha Membentuk Rupa', 'The Fashioner'),
  AsmaulHusnaItem(15, 'اَلْغَفَّار', 'Al-Ghaffar', 'Yang Maha Pengampun', 'The Ever-Forgiving'),
  AsmaulHusnaItem(16, 'اَلْقَهَّار', 'Al-Qahhar', 'Yang Maha Perkasa', 'The Subduer'),
  AsmaulHusnaItem(17, 'اَلْوَهَّاب', 'Al-Wahhab', 'Yang Maha Pemberi', 'The Bestower'),
  AsmaulHusnaItem(18, 'اَلرَّزَّاق', 'Ar-Razzaq', 'Yang Maha Pemberi Rezeki', 'The Provider'),
  AsmaulHusnaItem(19, 'اَلْفَتَّاح', 'Al-Fattah', 'Yang Maha Pembuka Pintu Rahmat', 'The Opener'),
  AsmaulHusnaItem(20, 'اَلْعَلِيْم', 'Al-\'Alim', 'Yang Maha Mengetahui', 'The All-Knowing'),
  AsmaulHusnaItem(21, 'اَلْقَابِض', 'Al-Qabid', 'Yang Maha Penyempit Rezeki', 'The Restrainer'),
  AsmaulHusnaItem(22, 'اَلْبَاسِط', 'Al-Basit', 'Yang Maha Melapangkan Rezeki', 'The Extender'),
  AsmaulHusnaItem(23, 'اَلْخَافِض', 'Al-Khafid', 'Yang Maha Merendahkan', 'The Reducer'),
  AsmaulHusnaItem(24, 'اَلرَّافِع', 'Ar-Rafi\'', 'Yang Maha Meninggikan', 'The Exalter'),
  AsmaulHusnaItem(25, 'اَلْمُعِزّ', 'Al-Mu\'izz', 'Yang Maha Memberi Kemuliaan', 'The Bestower of Honour'),
  AsmaulHusnaItem(26, 'اَلْمُذِلّ', 'Al-Muzill', 'Yang Maha Menghinakan', 'The Humiliator'),
  AsmaulHusnaItem(27, 'اَلسَّمِيْع', 'As-Sami\'', 'Yang Maha Mendengar', 'The All-Hearing'),
  AsmaulHusnaItem(28, 'اَلْبَصِيْر', 'Al-Basir', 'Yang Maha Melihat', 'The All-Seeing'),
  AsmaulHusnaItem(29, 'اَلْحَكَم', 'Al-Hakam', 'Yang Maha Menghukum', 'The Judge'),
  AsmaulHusnaItem(30, 'اَلْعَدْل', 'Al-\'Adl', 'Yang Maha Adil', 'The Utterly Just'),
  AsmaulHusnaItem(31, 'اَللَّطِيْف', 'Al-Latif', 'Yang Maha Lembut', 'The Most Subtle and Gentle'),
  AsmaulHusnaItem(32, 'اَلْخَبِيْر', 'Al-Khabir', 'Yang Maha Mengetahui Perkara Ghaib', 'The All-Aware'),
  AsmaulHusnaItem(33, 'اَلْحَلِيْم', 'Al-Halim', 'Yang Maha Penyabar', 'The Most Forbearing'),
  AsmaulHusnaItem(34, 'اَلْعَظِيْم', 'Al-\'Azim', 'Yang Maha Agung', 'The Magnificent'),
  AsmaulHusnaItem(35, 'اَلْغَفُوْر', 'Al-Ghafur', 'Yang Maha Pengampun', 'The Great Forgiver'),
  AsmaulHusnaItem(36, 'اَلشَّكُوْر', 'Asy-Syakur', 'Yang Maha Berterima Kasih', 'The Most Appreciative'),
  AsmaulHusnaItem(37, 'اَلْعَلِيّ', 'Al-\'Aliyy', 'Yang Maha Tinggi', 'The Most High'),
  AsmaulHusnaItem(38, 'اَلْكَبِيْر', 'Al-Kabir', 'Yang Maha Besar', 'The Most Great'),
  AsmaulHusnaItem(39, 'اَلْحَفِيْظ', 'Al-Hafiz', 'Yang Maha Memelihara', 'The Preserver'),
  AsmaulHusnaItem(40, 'اَلْمُقِيْت', 'Al-Muqit', 'Yang Maha Pemberi Kecukupan', 'The Sustainer'),
  AsmaulHusnaItem(41, 'اَلْحَسِيْب', 'Al-Hasib', 'Yang Maha Membuat Perhitungan', 'The Reckoner'),
  AsmaulHusnaItem(42, 'اَلْجَلِيْل', 'Al-Jalil', 'Yang Maha Mulia', 'The Majestic'),
  AsmaulHusnaItem(43, 'اَلْكَرِيْم', 'Al-Karim', 'Yang Maha Pemurah', 'The Most Generous'),
  AsmaulHusnaItem(44, 'اَلرَّقِيْب', 'Ar-Raqib', 'Yang Maha Mengawasi', 'The Watchful'),
  AsmaulHusnaItem(45, 'اَلْمُجِيْب', 'Al-Mujib', 'Yang Maha Memperkenankan', 'The Responsive One'),
  AsmaulHusnaItem(46, 'اَلْوَاسِع', 'Al-Wasi\'', 'Yang Maha Luas', 'The All-Encompassing'),
  AsmaulHusnaItem(47, 'اَلْحَكِيْم', 'Al-Hakim', 'Yang Maha Bijaksana', 'The All-Wise'),
  AsmaulHusnaItem(48, 'اَلْوَدُوْد', 'Al-Wadud', 'Yang Maha Mengasihi', 'The Most Loving'),
  AsmaulHusnaItem(49, 'اَلْمَجِيْد', 'Al-Majid', 'Yang Maha Mulia', 'The Most Glorious'),
  AsmaulHusnaItem(50, 'اَلْبَاعِث', 'Al-Ba\'ith', 'Yang Maha Membangkitkan', 'The Resurrector'),
  AsmaulHusnaItem(51, 'اَلشَّهِيْد', 'Asy-Syahid', 'Yang Maha Menyaksikan', 'The Witness'),
  AsmaulHusnaItem(52, 'اَلْحَقّ', 'Al-Haqq', 'Yang Maha Benar', 'The Absolute Truth'),
  AsmaulHusnaItem(53, 'اَلْوَكِيْل', 'Al-Wakil', 'Yang Maha Pentadbir', 'The Trustee'),
  AsmaulHusnaItem(54, 'اَلْقَوِيّ', 'Al-Qawiyy', 'Yang Maha Kuat', 'The All-Strong'),
  AsmaulHusnaItem(55, 'اَلْمَتِيْن', 'Al-Matin', 'Yang Maha Kukuh', 'The Firm One'),
  AsmaulHusnaItem(56, 'اَلْوَلِيّ', 'Al-Waliyy', 'Yang Maha Melindungi', 'The Protecting Friend'),
  AsmaulHusnaItem(57, 'اَلْحَمِيْد', 'Al-Hamid', 'Yang Maha Terpuji', 'The Praiseworthy'),
  AsmaulHusnaItem(58, 'اَلْمُحْصِي', 'Al-Muhsi', 'Yang Maha Menghitung', 'The All-Enumerating'),
  AsmaulHusnaItem(59, 'اَلْمُبْدِئ', 'Al-Mubdi\'', 'Yang Maha Memulakan', 'The Originator'),
  AsmaulHusnaItem(60, 'اَلْمُعِيْد', 'Al-Mu\'id', 'Yang Maha Mengembalikan', 'The Restorer'),
  AsmaulHusnaItem(61, 'اَلْمُحْيِي', 'Al-Muhyi', 'Yang Maha Menghidupkan', 'The Giver of Life'),
  AsmaulHusnaItem(62, 'اَلْمُمِيْت', 'Al-Mumit', 'Yang Maha Mematikan', 'The Bringer of Death'),
  AsmaulHusnaItem(63, 'اَلْحَيّ', 'Al-Hayy', 'Yang Maha Hidup', 'The Ever-Living'),
  AsmaulHusnaItem(64, 'اَلْقَيُّوْم', 'Al-Qayyum', 'Yang Maha Berdiri Sendiri', 'The Self-Subsisting'),
  AsmaulHusnaItem(65, 'اَلْوَاجِد', 'Al-Wajid', 'Yang Maha Kaya', 'The Perceiver'),
  AsmaulHusnaItem(66, 'اَلْمَاجِد', 'Al-Majid', 'Yang Maha Mulia', 'The Illustrious'),
  AsmaulHusnaItem(67, 'اَلْوَاحِد', 'Al-Wahid', 'Yang Maha Esa', 'The One'),
  AsmaulHusnaItem(68, 'اَلْأَحَد', 'Al-Ahad', 'Yang Maha Tunggal', 'The Unique One'),
  AsmaulHusnaItem(69, 'اَلصَّمَد', 'As-Samad', 'Yang Menjadi Tumpuan', 'The Eternal Refuge'),
  AsmaulHusnaItem(70, 'اَلْقَادِر', 'Al-Qadir', 'Yang Maha Berkuasa', 'The All-Powerful'),
  AsmaulHusnaItem(71, 'اَلْمُقْتَدِر', 'Al-Muqtadir', 'Yang Maha Berkuasa', 'The All-Determiner'),
  AsmaulHusnaItem(72, 'اَلْمُقَدِّم', 'Al-Muqaddim', 'Yang Maha Mendahulukan', 'The Expediter'),
  AsmaulHusnaItem(73, 'اَلْمُؤَخِّر', 'Al-Mu\'akhkhir', 'Yang Maha Melambatkan', 'The Delayer'),
  AsmaulHusnaItem(74, 'اَلْأَوَّل', 'Al-Awwal', 'Yang Maha Awal', 'The First'),
  AsmaulHusnaItem(75, 'اَلْآخِر', 'Al-Akhir', 'Yang Maha Akhir', 'The Last'),
  AsmaulHusnaItem(76, 'اَلظَّاهِر', 'Az-Zahir', 'Yang Maha Nyata', 'The Manifest'),
  AsmaulHusnaItem(77, 'اَلْبَاطِن', 'Al-Batin', 'Yang Maha Ghaib', 'The Hidden'),
  AsmaulHusnaItem(78, 'اَلْوَالِي', 'Al-Wali', 'Yang Maha Memerintah', 'The Governor'),
  AsmaulHusnaItem(79, 'اَلْمُتَعَالِي', 'Al-Muta\'ali', 'Yang Maha Tinggi', 'The Most Exalted'),
  AsmaulHusnaItem(80, 'اَلْبَرّ', 'Al-Barr', 'Yang Maha Melimpahkan Kebajikan', 'The Source of All Goodness'),
  AsmaulHusnaItem(81, 'اَلتَّوَّاب', 'At-Tawwab', 'Yang Maha Penerima Taubat', 'The Ever-Accepting of Repentance'),
  AsmaulHusnaItem(82, 'اَلْمُنْتَقِم', 'Al-Muntaqim', 'Yang Maha Pemberi Balasan', 'The Avenger'),
  AsmaulHusnaItem(83, 'اَلْعَفُوّ', 'Al-\'Afuww', 'Yang Maha Pemaaf', 'The Pardoner'),
  AsmaulHusnaItem(84, 'اَلرَّؤُوْف', 'Ar-Ra\'uf', 'Yang Maha Pengasih', 'The Most Kind'),
  AsmaulHusnaItem(85, 'مَالِكُ الْمُلْك', 'Malik-ul-Mulk', 'Pemilik Segala Kerajaan', 'The Owner of All Sovereignty'),
  AsmaulHusnaItem(86, 'ذُو الْجَلَالِ وَالْإِكْرَام', 'Zul-Jalali wal-Ikram', 'Yang Maha Memiliki Kebesaran & Kemuliaan', 'Lord of Majesty and Generosity'),
  AsmaulHusnaItem(87, 'اَلْمُقْسِط', 'Al-Muqsit', 'Yang Maha Adil', 'The Equitable One'),
  AsmaulHusnaItem(88, 'اَلْجَامِع', 'Al-Jami\'', 'Yang Maha Mengumpulkan', 'The Gatherer'),
  AsmaulHusnaItem(89, 'اَلْغَنِيّ', 'Al-Ghaniyy', 'Yang Maha Kaya', 'The Self-Sufficient'),
  AsmaulHusnaItem(90, 'اَلْمُغْنِي', 'Al-Mughni', 'Yang Maha Memberi Kekayaan', 'The Enricher'),
  AsmaulHusnaItem(91, 'اَلْمَانِع', 'Al-Mani\'', 'Yang Maha Mencegah', 'The Preventer'),
  AsmaulHusnaItem(92, 'اَلضَّار', 'Ad-Darr', 'Yang Menimpakan Kemudaratan', 'The Distresser'),
  AsmaulHusnaItem(93, 'اَلنَّافِع', 'An-Nafi\'', 'Yang Memberi Manfaat', 'The Propitious'),
  AsmaulHusnaItem(94, 'اَلنُّوْر', 'An-Nur', 'Yang Maha Bercahaya', 'The Light'),
  AsmaulHusnaItem(95, 'اَلْهَادِي', 'Al-Hadi', 'Yang Maha Pemberi Petunjuk', 'The Guide'),
  AsmaulHusnaItem(96, 'اَلْبَدِيْع', 'Al-Badi\'', 'Yang Maha Pencipta Tanpa Contoh', 'The Incomparable Originator'),
  AsmaulHusnaItem(97, 'اَلْبَاقِي', 'Al-Baqi', 'Yang Maha Kekal', 'The Everlasting'),
  AsmaulHusnaItem(98, 'اَلْوَارِث', 'Al-Warith', 'Yang Maha Mewarisi', 'The Ultimate Inheritor'),
  AsmaulHusnaItem(99, 'اَلصَّبُوْر', 'As-Sabur', 'Yang Maha Penyabar', 'The Most Patient'),
];

// ============================================================ Buah & Sayur
const List<AnimalItem> fruitItems = [
  AnimalItem('🍎', 'Epal', 'Apple', 'Epal merah manis'),
  AnimalItem('🍌', 'Pisang', 'Banana', 'Pisang kuning'),
  AnimalItem('🍊', 'Oren', 'Orange', 'Oren berair'),
  AnimalItem('🍉', 'Tembikai', 'Watermelon', 'Tembikai merah'),
  AnimalItem('🍇', 'Anggur', 'Grapes', 'Anggur ungu'),
  AnimalItem('🥭', 'Mangga', 'Mango', 'Mangga manis'),
  AnimalItem('🍍', 'Nanas', 'Pineapple', 'Nanas masam manis'),
  AnimalItem('🥕', 'Lobak Merah', 'Carrot', 'Lobak merah rangup'),
  AnimalItem('🌽', 'Jagung', 'Corn', 'Jagung kuning manis'),
  AnimalItem('🍅', 'Tomato', 'Tomato', 'Tomato merah bulat'),
  AnimalItem('🥒', 'Timun', 'Cucumber', 'Timun hijau sejuk'),
  AnimalItem('🥬', 'Sayur Hijau', 'Leafy Greens', 'Sayur hijau sihat'),
];

// ============================================================ Kenderaan
const List<AnimalItem> vehicleItems = [
  AnimalItem('🚗', 'Kereta', 'Car', 'Vroom vroom!'),
  AnimalItem('🚌', 'Bas', 'Bus', 'Bas besar'),
  AnimalItem('🚂', 'Kereta Api', 'Train', 'Choo choo!'),
  AnimalItem('✈️', 'Kapal Terbang', 'Aeroplane', 'Terbang tinggi!'),
  AnimalItem('🚁', 'Helikopter', 'Helicopter', 'Berpusing-pusing!'),
  AnimalItem('🚢', 'Kapal', 'Ship', 'Belayar di laut'),
  AnimalItem('🏍️', 'Motosikal', 'Motorcycle', 'Vroom laju!'),
  AnimalItem('🚲', 'Basikal', 'Bicycle', 'Kring kring!'),
  AnimalItem('🚑', 'Ambulans', 'Ambulance', 'Wiu wiu wiu!'),
  AnimalItem('🚒', 'Bomba', 'Fire Engine', 'Wiu wiu! Bomba datang!'),
  AnimalItem('🚜', 'Traktor', 'Tractor', 'Traktor di sawah'),
  AnimalItem('🚀', 'Roket', 'Rocket', 'Ke angkasa lepas!'),
];

// ============================================================ Lawan Kata
class OppositeItem {
  final String emoji1;
  final String emoji2;
  final String ms1;
  final String ms2;
  final String en1;
  final String en2;
  const OppositeItem(this.emoji1, this.emoji2, this.ms1, this.ms2, this.en1, this.en2);
}

const List<OppositeItem> oppositeItems = [
  OppositeItem('🐘', '🐭', 'Besar', 'Kecil', 'Big', 'Small'),
  OppositeItem('🔥', '🧊', 'Panas', 'Sejuk', 'Hot', 'Cold'),
  OppositeItem('🦒', '🐢', 'Tinggi', 'Rendah', 'Tall', 'Short'),
  OppositeItem('🌞', '🌙', 'Siang', 'Malam', 'Day', 'Night'),
  OppositeItem('😊', '😢', 'Gembira', 'Sedih', 'Happy', 'Sad'),
  OppositeItem('⬆️', '⬇️', 'Atas', 'Bawah', 'Up', 'Down'),
  OppositeItem('🐇', '🐌', 'Laju', 'Perlahan', 'Fast', 'Slow'),
  OppositeItem('💪', '🍃', 'Kuat', 'Lemah', 'Strong', 'Weak'),
  OppositeItem('📖', '📕', 'Buka', 'Tutup', 'Open', 'Close'),
  OppositeItem('🌊', '🏜️', 'Basah', 'Kering', 'Wet', 'Dry'),
];

// ============================================================ Ahli Keluarga
const List<AnimalItem> familyItems = [
  AnimalItem('👨', 'Ayah', 'Father', 'Ayah yang penyayang'),
  AnimalItem('👩', 'Ibu', 'Mother', 'Ibu yang penyayang'),
  AnimalItem('👶', 'Adik', 'Baby', 'Adik comel'),
  AnimalItem('👦', 'Abang', 'Brother', 'Abang yang baik'),
  AnimalItem('👧', 'Kakak', 'Sister', 'Kakak yang baik'),
  AnimalItem('👴', 'Atuk', 'Grandfather', 'Atuk tersayang'),
  AnimalItem('👵', 'Nenek', 'Grandmother', 'Nenek tersayang'),
  AnimalItem('👨‍🦱', 'Pak Cik', 'Uncle', 'Pak cik mesra'),
  AnimalItem('👩‍🦱', 'Mak Cik', 'Aunt', 'Mak cik mesra'),
  AnimalItem('🧒', 'Sepupu', 'Cousin', 'Kawan main bersama'),
];

// ============================================================ Cuaca & Hari
const List<AnimalItem> weatherItems = [
  AnimalItem('☀️', 'Cerah', 'Sunny', 'Hari yang cerah'),
  AnimalItem('☁️', 'Mendung', 'Cloudy', 'Awan tebal'),
  AnimalItem('🌧️', 'Hujan', 'Rainy', 'Hujan turun'),
  AnimalItem('⛈️', 'Ribut Petir', 'Thunderstorm', 'Guruh berdentum'),
  AnimalItem('🌈', 'Pelangi', 'Rainbow', 'Pelangi cantik'),
  AnimalItem('🌬️', 'Berangin', 'Windy', 'Angin bertiup'),
];

const List<String> daysMs = ['Isnin', 'Selasa', 'Rabu', 'Khamis', 'Jumaat', 'Sabtu', 'Ahad'];
const List<String> daysEn = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];

// ============================================================ Bunyi Seronok (bayi)
const List<AnimalItem> babySoundItems = [
  AnimalItem('📱', 'Telefon', 'Phone', 'Kring kring kring!'),
  AnimalItem('🔔', 'Loceng', 'Bell', 'Ting ting ting!'),
  AnimalItem('🥁', 'Dram', 'Drum', 'Dum dum dum!'),
  AnimalItem('🎺', 'Trompet', 'Trumpet', 'Tet tet tet!'),
  AnimalItem('⏰', 'Jam Loceng', 'Alarm Clock', 'Riiiing!'),
  AnimalItem('🚗', 'Kereta', 'Car', 'Vroom vroom!'),
  AnimalItem('🐱', 'Kucing', 'Cat', 'Meow meow!'),
  AnimalItem('🐶', 'Anjing', 'Dog', 'Woof woof!'),
  AnimalItem('🐄', 'Lembu', 'Cow', 'Moo moo!'),
  AnimalItem('🦆', 'Itik', 'Duck', 'Kwek kwek kwek!'),
  AnimalItem('🚂', 'Kereta Api', 'Train', 'Choo choo!'),
  AnimalItem('💧', 'Air', 'Water', 'Titik titik titik!'),
];

// ============================================================ Muzik Tidur (loop)
class LoopSound {
  final String id;
  final String emoji;
  final String labelMs;
  final String labelEn;
  const LoopSound(this.id, this.emoji, this.labelMs, this.labelEn);
}

const List<LoopSound> loopSounds = [
  LoopSound('lullaby', '🎵', 'Lagu Tidur', 'Lullaby'),
  LoopSound('rain', '🌧️', 'Bunyi Hujan', 'Rain Sounds'),
  LoopSound('waves', '🌊', 'Ombak Laut', 'Ocean Waves'),
  LoopSound('heartbeat', '💗', 'Degupan Jantung', 'Heartbeat'),
];

// ============================================================ Langkah Solat
class StepItem {
  final String emoji;
  final String titleMs;
  final String titleEn;
  final String descMs;
  final String descEn;
  const StepItem(this.emoji, this.titleMs, this.titleEn, this.descMs, this.descEn);
}

const List<StepItem> solatSteps = [
  StepItem('🧎', 'Niat', 'Intention', 'Berdiri tegak dan berniat dalam hati untuk solat kerana Allah.', 'Stand straight and make the intention in your heart to pray for Allah.'),
  StepItem('🙌', 'Takbiratul Ihram', 'Opening Takbir', 'Angkat kedua tangan dan sebut "Allahu Akbar".', 'Raise both hands and say "Allahu Akbar".'),
  StepItem('🧍', 'Berdiri & Baca Al-Fatihah', 'Standing & Recite Al-Fatihah', 'Letak tangan di dada dan baca surah Al-Fatihah.', 'Place your hands on your chest and recite Surah Al-Fatihah.'),
  StepItem('🙇', 'Rukuk', 'Bowing (Ruku)', 'Bongkokkan badan, tangan pegang lutut, sebut "Subhana Rabbiyal Azim".', 'Bow down with hands on knees, say "Subhana Rabbiyal Azim".'),
  StepItem('🧍', 'Iktidal', 'Standing Up', 'Bangun semula berdiri tegak sambil sebut "Sami\'allahu liman hamidah".', 'Stand back up straight, saying "Sami\'allahu liman hamidah".'),
  StepItem('🛐', 'Sujud', 'Prostration (Sujud)', 'Sujud dengan dahi ke lantai, sebut "Subhana Rabbiyal A\'la".', 'Prostrate with your forehead on the floor, say "Subhana Rabbiyal A\'la".'),
  StepItem('🧎', 'Duduk Antara Dua Sujud', 'Sitting Between Sujud', 'Duduk sebentar dan mohon keampunan "Rabbighfirli".', 'Sit briefly and ask forgiveness "Rabbighfirli".'),
  StepItem('🛐', 'Sujud Kedua', 'Second Sujud', 'Sujud sekali lagi seperti tadi.', 'Prostrate once more as before.'),
  StepItem('🧎', 'Tahiyat Akhir', 'Final Tashahhud', 'Duduk dan baca tahiyat akhir dengan tenang.', 'Sit and recite the final tashahhud calmly.'),
  StepItem('🤲', 'Salam', 'Salam', 'Toleh ke kanan dan kiri sambil sebut "Assalamualaikum warahmatullah".', 'Turn your head right then left, saying "Assalamualaikum warahmatullah".'),
];

const List<StepItem> wudhuSteps = [
  StepItem('🤲', 'Niat & Bismillah', 'Intention & Bismillah', 'Baca "Bismillah" dan berniat mengambil wudhu.', 'Say "Bismillah" and make the intention for wudhu.'),
  StepItem('🤚', 'Basuh Tangan', 'Wash Hands', 'Basuh kedua tapak tangan hingga pergelangan 3 kali.', 'Wash both hands up to the wrists 3 times.'),
  StepItem('👄', 'Berkumur', 'Rinse Mouth', 'Berkumur-kumur dengan air 3 kali.', 'Rinse your mouth with water 3 times.'),
  StepItem('👃', 'Basuh Hidung', 'Rinse Nose', 'Masukkan air ke hidung dan hembuskan 3 kali.', 'Sniff water into the nose and blow it out 3 times.'),
  StepItem('😊', 'Basuh Muka', 'Wash Face', 'Basuh seluruh muka 3 kali.', 'Wash the whole face 3 times.'),
  StepItem('💪', 'Basuh Tangan ke Siku', 'Wash Arms', 'Basuh tangan kanan lalu kiri hingga siku 3 kali.', 'Wash the right arm then left arm up to the elbows 3 times.'),
  StepItem('💆', 'Sapu Kepala', 'Wipe Head', 'Sapu air di atas kepala sekali.', 'Wipe your head with wet hands once.'),
  StepItem('👂', 'Sapu Telinga', 'Wipe Ears', 'Sapu kedua telinga dengan jari yang basah.', 'Wipe both ears with wet fingers.'),
  StepItem('🦶', 'Basuh Kaki', 'Wash Feet', 'Basuh kaki kanan lalu kiri hingga buku lali 3 kali.', 'Wash the right foot then left foot up to the ankles 3 times.'),
];

// ============================================================ Adab Harian
const List<StepItem> adabItems = [
  StepItem('👋', 'Beri Salam', 'Give Salam', 'Ucap "Assalamualaikum" bila jumpa orang.', 'Say "Assalamualaikum" when you meet someone.'),
  StepItem('🍽️', 'Baca Bismillah Sebelum Makan', 'Bismillah Before Eating', 'Sebut "Bismillah" sebelum mula makan.', 'Say "Bismillah" before you start eating.'),
  StepItem('🤚', 'Makan Guna Tangan Kanan', 'Eat With Right Hand', 'Gunakan tangan kanan untuk makan dan minum.', 'Use your right hand to eat and drink.'),
  StepItem('🧼', 'Cuci Tangan', 'Wash Hands', 'Cuci tangan sebelum dan selepas makan.', 'Wash your hands before and after eating.'),
  StepItem('🙏', 'Ucap Terima Kasih', 'Say Thank You', 'Ucap "Terima kasih" bila orang tolong kita.', 'Say "Thank you" when someone helps you.'),
  StepItem('👨‍👩‍👧', 'Hormat Ibu Bapa', 'Respect Parents', 'Dengar cakap ibu dan ayah, cium tangan mereka.', 'Listen to your parents and kiss their hands.'),
  StepItem('🧸', 'Kongsi Mainan', 'Share Toys', 'Kongsi mainan dengan adik dan kawan-kawan.', 'Share your toys with siblings and friends.'),
  StepItem('😊', 'Sentiasa Senyum', 'Always Smile', 'Senyum itu sedekah! Senyum kepada semua orang.', 'Smiling is charity! Smile at everyone.'),
  StepItem('🤝', 'Tolong Kawan', 'Help Friends', 'Bantu kawan yang memerlukan pertolongan.', 'Help friends who need assistance.'),
  StepItem('🗑️', 'Jaga Kebersihan', 'Keep Clean', 'Buang sampah ke dalam tong sampah.', 'Throw rubbish into the bin.'),
];

// ============================================================ Surah Pendek
class SurahItem {
  final String id;
  final String nameArabic;
  final String nameMs;
  final String arabic;
  final String rumi;
  final String meaningMs;
  final String meaningEn;
  const SurahItem(this.id, this.nameArabic, this.nameMs, this.arabic, this.rumi, this.meaningMs, this.meaningEn);
}

const List<SurahItem> surahItems = [
  SurahItem(
    'fatihah',
    'الفاتحة',
    'Al-Fatihah (Pembukaan)',
    'بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ ﴿١﴾ ٱلۡحَمۡدُ لِلَّهِ رَبِّ ٱلۡعَٰلَمِينَ ﴿٢﴾ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ ﴿٣﴾ مَٰلِكِ يَوۡمِ ٱلدِّينِ ﴿٤﴾ إِيَّاكَ نَعۡبُدُ وَإِيَّاكَ نَسۡتَعِينُ ﴿٥﴾ ٱهۡدِنَا ٱلصِّرَٰطَ ٱلۡمُسۡتَقِيمَ ﴿٦﴾ صِرَٰطَ ٱلَّذِينَ أَنۡعَمۡتَ عَلَيۡهِمۡ غَيۡرِ ٱلۡمَغۡضُوبِ عَلَيۡهِمۡ وَلَا ٱلضَّآلِّينَ ﴿٧﴾',
    'Bismillahir-rahmanir-rahim. Alhamdulillahi rabbil-\'alamin. Ar-rahmanir-rahim. Maliki yaumid-din. Iyyaka na\'budu wa iyyaka nasta\'in. Ihdinas-siratal-mustaqim. Siratal-lazina an\'amta \'alaihim ghairil-maghdubi \'alaihim wa lad-dallin.',
    'Surah pembukaan Al-Quran. Kita memuji Allah dan memohon petunjuk jalan yang lurus. Dibaca dalam setiap rakaat solat.',
    'The opening chapter of the Quran. We praise Allah and ask for guidance on the straight path. Recited in every unit of prayer.',
  ),
  SurahItem(
    'ikhlas',
    'الإخلاص',
    'Al-Ikhlas (Ikhlas)',
    'بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ ۝ قُلۡ هُوَ ٱللَّهُ أَحَدٌ ﴿١﴾ ٱللَّهُ ٱلصَّمَدُ ﴿٢﴾ لَمۡ يَلِدۡ وَلَمۡ يُولَدۡ ﴿٣﴾ وَلَمۡ يَكُن لَّهُۥ كُفُوًا أَحَدُۢ ﴿٤﴾',
    'Qul huwallahu ahad. Allahus-samad. Lam yalid wa lam yulad. Wa lam yakul-lahu kufuwan ahad.',
    'Allah itu Maha Esa. Allah tempat kita bergantung. Dia tidak beranak dan tidak diperanakkan. Tiada sesiapa yang setara dengan-Nya.',
    'Allah is One. Allah is the Eternal Refuge. He neither begets nor is born. There is none comparable to Him.',
  ),
  SurahItem(
    'falaq',
    'الفلق',
    'Al-Falaq (Subuh)',
    'بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ ۝ قُلۡ أَعُوذُ بِرَبِّ ٱلۡفَلَقِ ﴿١﴾ مِن شَرِّ مَا خَلَقَ ﴿٢﴾ وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ ﴿٣﴾ وَمِن شَرِّ ٱلنَّفَّٰثَٰتِ فِي ٱلۡعُقَدِ ﴿٤﴾ وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ ﴿٥﴾',
    'Qul a\'uzu birabbil-falaq. Min syarri ma khalaq. Wa min syarri ghasiqin iza waqab. Wa min syarrin-naffasati fil-\'uqad. Wa min syarri hasidin iza hasad.',
    'Kita mohon perlindungan Allah daripada segala kejahatan. Baca surah ini sebelum tidur untuk perlindungan.',
    'We seek Allah\'s protection from all evil. Recite this surah before sleeping for protection.',
  ),
  SurahItem(
    'nas',
    'الناس',
    'An-Nas (Manusia)',
    'بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ ۝ قُلۡ أَعُوذُ بِرَبِّ ٱلنَّاسِ ﴿١﴾ مَلِكِ ٱلنَّاسِ ﴿٢﴾ إِلَٰهِ ٱلنَّاسِ ﴿٣﴾ مِن شَرِّ ٱلۡوَسۡوَاسِ ٱلۡخَنَّاسِ ﴿٤﴾ ٱلَّذِي يُوَسۡوِسُ فِي صُدُورِ ٱلنَّاسِ ﴿٥﴾ مِنَ ٱلۡجِنَّةِ وَٱلنَّاسِ ﴿٦﴾',
    'Qul a\'uzu birabbin-nas. Malikin-nas. Ilahin-nas. Min syarril-waswasil-khannas. Allazi yuwaswisu fi sudurin-nas. Minal-jinnati wan-nas.',
    'Kita mohon perlindungan Allah daripada bisikan jahat. Baca bersama Al-Falaq sebelum tidur.',
    'We seek Allah\'s protection from evil whispers. Recite together with Al-Falaq before sleeping.',
  ),
  SurahItem(
    'kauthar',
    'الكوثر',
    'Al-Kauthar (Nikmat Banyak)',
    'بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ ۝ إِنَّآ أَعۡطَيۡنَٰكَ ٱلۡكَوۡثَرَ ﴿١﴾ فَصَلِّ لِرَبِّكَ وَٱنۡحَرۡ ﴿٢﴾ إِنَّ شَانِئَكَ هُوَ ٱلۡأَبۡتَرُ ﴿٣﴾',
    'Inna a\'tainakal-kauthar. Fasalli lirabbika wanhar. Inna syani\'aka huwal-abtar.',
    'Surah paling pendek dalam Al-Quran. Allah beri Nabi Muhammad nikmat yang banyak, maka solat dan bersyukurlah.',
    'The shortest surah in the Quran. Allah gave Prophet Muhammad abundant blessings, so pray and be grateful.',
  ),
  SurahItem(
    'asr',
    'العصر',
    'Al-Asr (Masa)',
    'بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ ۝ وَٱلۡعَصۡرِ ﴿١﴾ إِنَّ ٱلۡإِنسَٰنَ لَفِي خُسۡرٍ ﴿٢﴾ إِلَّا ٱلَّذِينَ ءَامَنُواْ وَعَمِلُواْ ٱلصَّٰلِحَٰتِ وَتَوَاصَوۡاْ بِٱلۡحَقِّ وَتَوَاصَوۡاْ بِٱلصَّبۡرِ ﴿٣﴾',
    'Wal-\'asr. Innal-insana lafi khusr. Illal-lazina amanu wa \'amilus-salihati wa tawasau bil-haqqi wa tawasau bis-sabr.',
    'Masa itu sangat berharga. Orang yang beruntung ialah yang beriman, buat kebaikan dan saling menasihati.',
    'Time is precious. The successful ones are those who believe, do good deeds and advise one another.',
  ),
];

// ============================================================ Zikir Tasbih
class ZikirItem {
  final String id;
  final String arabic;
  final String rumi;
  final String meaningMs;
  final String meaningEn;
  const ZikirItem(this.id, this.arabic, this.rumi, this.meaningMs, this.meaningEn);
}

const List<ZikirItem> zikirItems = [
  ZikirItem('subhanallah', 'سُبْحَانَ اللّٰه', 'SubhanAllah', 'Maha Suci Allah', 'Glory be to Allah'),
  ZikirItem('alhamdulillah', 'اَلْحَمْدُ لِلّٰه', 'Alhamdulillah', 'Segala puji bagi Allah', 'All praise is for Allah'),
  ZikirItem('allahuakbar', 'اَللّٰهُ اَكْبَر', 'Allahu Akbar', 'Allah Maha Besar', 'Allah is the Greatest'),
];
