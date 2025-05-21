enum NasaFileType {
  image('image'),
  video('video'),
  audio('audio');

  final String mapName;

  const NasaFileType(this.mapName);

  factory NasaFileType.fromString(String mapName) {
    return values.firstWhere((e) => e.mapName == mapName);
  }
}

class NasaMediaSearchModel {
  final NasaFileType type;
  final String title;
  final String subTitle;
  final String image;
  final String date;
  final String id;
  final String center;
  final String mediaLink;
  final List<String>? keyWord;

  NasaMediaSearchModel({
    required this.type,
    required this.title,
    required this.subTitle,
    required this.image,
    required this.date,
    required this.id,
    required this.center,
    required this.mediaLink,
    required this.keyWord,
  });

  @override
  String toString() {
    return 'NasaMediaSearchDBModel{type: $type, title: $title, subTitle: $subTitle, image: $image, date: $date, id: $id, center: $center, mediaLink: $mediaLink, keyWord: $keyWord}';
  }
}
