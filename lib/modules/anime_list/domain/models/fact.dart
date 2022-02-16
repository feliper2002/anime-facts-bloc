import 'dart:convert';

class Fact {
  final String? fact;
  Fact({
    this.fact,
  });

  Map<String, dynamic> toMap() {
    return {
      'fact': fact,
    };
  }

  factory Fact.fromMap(Map<String, dynamic> map) {
    return Fact(
      fact: map['fact'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Fact.fromJson(String source) => Fact.fromMap(json.decode(source));
}
