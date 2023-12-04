class SurahData {
  int surahNumber;
  int startAtVerse;
  int endAtVerse;

  // constructor
  SurahData(
      {required this.surahNumber,
      required this.startAtVerse,
      required this.endAtVerse});

  // serialize
  Map<String, dynamic> toJson() {
    return {
      'surahNumber': surahNumber,
      'startAtVerse': startAtVerse,
      'endAtVerse': endAtVerse
    };
  }

  factory SurahData.fromJson(Map<String, dynamic> json) {
    return SurahData(
        surahNumber: json['surahNumber'],
        startAtVerse: json['startAtVerse'],
        endAtVerse: json['endAtVerse']);
  }
  
}
