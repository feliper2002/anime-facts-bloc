// ignore_for_file: annotate_overrides, overridden_fields

import 'dart:convert';

import 'package:anime_facts_bloc/modules/anime_list/domain/entities/fact.dart';

class FactModel extends Fact {
  final String? fact;
  FactModel({
    this.fact,
  });

  factory FactModel.fromMap(Map<String, dynamic> map) {
    return FactModel(
      fact: map['fact'],
    );
  }
}
