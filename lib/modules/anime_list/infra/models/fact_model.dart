// ignore_for_file: annotate_overrides, overridden_fields

import 'dart:convert';

import 'package:anime_facts_bloc/modules/anime_list/domain/entities/fact.dart';

class FactModel extends Fact {
  final String? fact;
  FactModel({
    this.fact,
  });

  Map<String, dynamic> toMap() {
    return {
      'fact': fact,
    };
  }

  factory FactModel.fromMap(Map<String, dynamic> map) {
    return FactModel(
      fact: map['fact'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FactModel.fromJson(String source) =>
      FactModel.fromMap(json.decode(source));
}
