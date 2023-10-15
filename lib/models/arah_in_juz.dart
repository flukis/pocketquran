class VerseNumber {
  int inQuran;
  int inSurah;

  VerseNumber({
    required this.inQuran,
    required this.inSurah,
  });

  factory VerseNumber.fromJson(Map<String, dynamic> json) {
    return VerseNumber(
      inQuran: json['inQuran'],
      inSurah: json['inSurah'],
    );
  }
}

class Sajda {
  bool recommended;
  bool obligatory;

  Sajda({
    required this.recommended,
    required this.obligatory,
  });

  factory Sajda.fromJson(Map<String, dynamic> json) {
    return Sajda(
      recommended: json['recommended'],
      obligatory: json['obligatory'],
    );
  }
}

class TextData {
  String arab;
  Map<String, String> transliteration;

  TextData({
    required this.arab,
    required this.transliteration,
  });

  factory TextData.fromJson(Map<String, dynamic> json) {
    return TextData(
      arab: json['arab'],
      transliteration: Map<String, String>.from(json['transliteration']),
    );
  }
}

class TranslationData {
  String en;
  String id;

  TranslationData({
    required this.en,
    required this.id,
  });

  factory TranslationData.fromJson(Map<String, dynamic> json) {
    return TranslationData(
      en: json['en'],
      id: json['id'],
    );
  }
}

class AudioData {
  String primary;
  List<String> secondary;

  AudioData({
    required this.primary,
    required this.secondary,
  });

  factory AudioData.fromJson(Map<String, dynamic> json) {
    return AudioData(
      primary: json['primary'],
      secondary: List<String>.from(json['secondary']),
    );
  }
}

class TafsirData {
  String id;
  String long;

  TafsirData({
    required this.id,
    required this.long,
  });

  factory TafsirData.fromJson(Map<String, dynamic> json) {
    return TafsirData(
      id: json['id'],
      long: json['long'],
    );
  }
}

class Verse {
  VerseNumber number;
  Map<String, dynamic> meta;
  TextData text;
  TranslationData translation;
  AudioData audio;
  TafsirData tafsir;

  Verse({
    required this.number,
    required this.meta,
    required this.text,
    required this.translation,
    required this.audio,
    required this.tafsir,
  });

  factory Verse.fromJson(Map<String, dynamic> json) {
    return Verse(
      number: VerseNumber.fromJson(json['number']),
      meta: Map<String, dynamic>.from(json['meta']),
      text: TextData.fromJson(json['text']),
      translation: TranslationData.fromJson(json['translation']),
      audio: AudioData.fromJson(json['audio']),
      tafsir: TafsirData.fromJson(json['tafsir']),
    );
  }
}

class JuzData {
  int juz;
  int juzStartSurahNumber;
  int juzEndSurahNumber;
  String juzStartInfo;
  String juzEndInfo;
  int totalVerses;
  List<Verse> verses;

  JuzData({
    required this.juz,
    required this.juzStartSurahNumber,
    required this.juzEndSurahNumber,
    required this.juzStartInfo,
    required this.juzEndInfo,
    required this.totalVerses,
    required this.verses,
  });

  factory JuzData.fromJson(Map<String, dynamic> json) {
    var verseList = List<Verse>.from(
        (json['verses'] as List).map((verse) => Verse.fromJson(verse)));
    return JuzData(
      juz: json['juz'],
      juzStartSurahNumber: json['juzStartSurahNumber'],
      juzEndSurahNumber: json['juzEndSurahNumber'],
      juzStartInfo: json['juzStartInfo'],
      juzEndInfo: json['juzEndInfo'],
      totalVerses: json['totalVerses'],
      verses: verseList,
    );
  }
}
