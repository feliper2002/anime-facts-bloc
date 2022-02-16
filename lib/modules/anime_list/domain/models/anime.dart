import 'dart:convert';

class Anime {
  final String? name;
  final String? image;
  Anime({
    this.name,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
    };
  }

  factory Anime.fromMap(Map<String, dynamic> map) {
    return Anime(
      name: map['anime_name'],
      image: map['anime_img'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Anime.fromJson(String source) => Anime.fromMap(json.decode(source));
}
