import 'package:pocketquran/models/ayah_in_juz.dart';
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

class AyahListOfSurah {
  int number;
  int sequence;
  int numberOfVerses;
  Name name;
  Revelation revelation;
  Tafsir tafsir;
  PreBismillah? preBismillah;
  List<Verse> verses;

  AyahListOfSurah({
    required this.number,
    required this.sequence,
    required this.numberOfVerses,
    required this.name,
    required this.revelation,
    required this.tafsir,
    this.preBismillah,
    required this.verses,
  });

  factory AyahListOfSurah.fromJson(Map<String, dynamic> json) {
    final jsonData = json['data'];
    var verseList = List<Verse>.from(
        (jsonData['verses'] as List).map((verse) => Verse.fromJson(verse)));
    return AyahListOfSurah(
      number: jsonData['number'],
      sequence: jsonData['sequence'],
      numberOfVerses: jsonData['numberOfVerses'],
      name: Name.fromJson(jsonData['name']),
      revelation: Revelation.fromJson(jsonData['revelation']),
      tafsir: Tafsir.fromJson(jsonData['tafsir']),
      preBismillah: jsonData['preBismillah'] != null
          ? PreBismillah.fromJson(jsonData['preBismillah'])
          : null,
      verses: verseList,
    );
  }
}
