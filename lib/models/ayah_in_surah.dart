import 'package:pocketquran/models/arah_in_juz.dart';
import 'package:pocketquran/models/surah.dart';

class PreBismillah {
  TextData text;
  TranslationData translation;
  AudioData audio;

  PreBismillah({
    required this.text,
    required this.translation,
    required this.audio,
  });

  factory PreBismillah.fromJson(Map<String, dynamic> json) {
    return PreBismillah(
      text: TextData.fromJson(json['text']),
      translation: TranslationData.fromJson(json['translation']),
      audio: AudioData.fromJson(json['audio']),
    );
  }
}

class SurahData {
  int number;
  int sequence;
  int numberOfVerses;
  Name name;
  Revelation revelation;
  Tafsir tafsir;
  PreBismillah preBismillah;
  List<Verse> verses;

  SurahData({
    required this.number,
    required this.sequence,
    required this.numberOfVerses,
    required this.name,
    required this.revelation,
    required this.tafsir,
    required this.preBismillah,
    required this.verses,
  });

  factory SurahData.fromJson(Map<String, dynamic> json) {
    var verseList = List<Verse>.from(
        (json['verses'] as List).map((verse) => Verse.fromJson(verse)));
    return SurahData(
      number: json['number'],
      sequence: json['sequence'],
      numberOfVerses: json['numberOfVerses'],
      name: Name.fromJson(json['name']),
      revelation: Revelation.fromJson(json['revelation']),
      tafsir: Tafsir.fromJson(json['tafsir']),
      preBismillah: PreBismillah.fromJson(json['preBismillah']),
      verses: verseList,
    );
  }
}
