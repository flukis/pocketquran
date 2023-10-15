class TextData {
  String arab;
  TransliterationData transliteration;

  TextData({
    required this.arab,
    required this.transliteration,
  });

  factory TextData.fromJson(Map<String, dynamic> json) {
    return TextData(
      arab: json['arab'],
      transliteration: TransliterationData.fromJson(json['transliteration']),
    );
  }
}

class TransliterationData {
  String en;

  TransliterationData({
    required this.en,
  });

  factory TransliterationData.fromJson(Map<String, dynamic> json) {
    return TransliterationData(
      en: json['en'],
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
  TextData id;
  String long;

  TafsirData({
    required this.id,
    required this.long,
  });

  factory TafsirData.fromJson(Map<String, dynamic> json) {
    return TafsirData(
      id: TextData.fromJson(json['id']),
      long: json['long'],
    );
  }
}

class SurahData {
  TextData text;
  TranslationData translation;
  AudioData audio;
  TafsirData tafsir;

  SurahData({
    required this.text,
    required this.translation,
    required this.audio,
    required this.tafsir,
  });

  factory SurahData.fromJson(Map<String, dynamic> json) {
    return SurahData(
      text: TextData.fromJson(json['text']),
      translation: TranslationData.fromJson(json['translation']),
      audio: AudioData.fromJson(json['audio']),
      tafsir: TafsirData.fromJson(json['tafsir']),
    );
  }
}

class Surah {
  Map<String, int> number;
  MetaData meta;
  SurahData surah;

  Surah({
    required this.number,
    required this.meta,
    required this.surah,
  });

  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
      number: Map<String, int>.from(json['number']),
      meta: MetaData.fromJson(json['meta']),
      surah: SurahData.fromJson(json['surah']),
    );
  }
}

class MetaData {
  int juz;
  int page;
  int manzil;
  int ruku;
  int hizbQuarter;
  SajdaData sajda;

  MetaData({
    required this.juz,
    required this.page,
    required this.manzil,
    required this.ruku,
    required this.hizbQuarter,
    required this.sajda,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) {
    return MetaData(
      juz: json['juz'],
      page: json['page'],
      manzil: json['manzil'],
      ruku: json['ruku'],
      hizbQuarter: json['hizbQuarter'],
      sajda: SajdaData.fromJson(json['sajda']),
    );
  }
}

class SajdaData {
  bool recommended;
  bool obligatory;

  SajdaData({
    required this.recommended,
    required this.obligatory,
  });

  factory SajdaData.fromJson(Map<String, dynamic> json) {
    return SajdaData(
      recommended: json['recommended'],
      obligatory: json['obligatory'],
    );
  }
}
