class Name {
  String short;
  String long;
  Map<String, String> transliteration;
  Map<String, String> translation;

  Name({
    required this.short,
    required this.long,
    required this.transliteration,
    required this.translation,
  });

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      short: json['short'],
      long: json['long'],
      transliteration: Map<String, String>.from(json['transliteration']),
      translation: Map<String, String>.from(json['translation']),
    );
  }
}

class Revelation {
  String arab;
  String en;
  String id;

  Revelation({
    required this.arab,
    required this.en,
    required this.id,
  });

  factory Revelation.fromJson(Map<String, dynamic> json) {
    return Revelation(
      arab: json['arab'],
      en: json['en'],
      id: json['id'],
    );
  }
}

class Tafsir {
  String id;

  Tafsir({
    required this.id,
  });

  factory Tafsir.fromJson(Map<String, dynamic> json) {
    return Tafsir(
      id: json['id'],
    );
  }
}

class Surah {
  int number;
  int sequence;
  int numberOfVerses;
  Name name;
  Revelation revelation;
  Tafsir tafsir;

  Surah({
    required this.number,
    required this.sequence,
    required this.numberOfVerses,
    required this.name,
    required this.revelation,
    required this.tafsir,
  });

  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
      number: json['number'],
      sequence: json['sequence'],
      numberOfVerses: json['numberOfVerses'],
      name: Name.fromJson(json['name']),
      revelation: Revelation.fromJson(json['revelation']),
      tafsir: Tafsir.fromJson(json['tafsir']),
    );
  }
}

class ListSurah {
  ListSurah({
    this.listSurah,
  });

  List<Surah>? listSurah;

  factory ListSurah.fromJson(Map<String, dynamic> json) => ListSurah(
      listSurah: json["data"] == null
          ? []
          : List<Surah>.from(json["data"].map((x) => Surah.fromJson(x))));
}
