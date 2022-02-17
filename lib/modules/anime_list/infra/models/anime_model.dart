// ignore_for_file: annotate_overrides, overridden_fields

import 'dart:convert';

import 'package:anime_facts_bloc/modules/anime_list/domain/entities/anime.dart';

class AnimeModel extends Anime {
  final String? name;
  final String? image;
  AnimeModel({
    this.name,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
    };
  }

  factory AnimeModel.fromMap(Map<String, dynamic> map) {
    return AnimeModel(
      name: map['anime_name'] ?? '',
      image: map['anime_img'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AnimeModel.fromJson(String source) =>
      AnimeModel.fromMap(json.decode(source));
}
