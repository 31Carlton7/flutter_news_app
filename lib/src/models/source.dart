import 'dart:convert';

class Source {
  String? id;
  String? name;
  String? category;
  String? country;

  Source({this.id, this.name, this.category, this.country});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'country': country,
    };
  }

  factory Source.fromMap(Map<String, dynamic> map) {
    return Source(
      id: map['id'] as String?,
      name: map['name'] as String?,
      category: map['category'] as String?,
      country: map['country'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory Source.fromJson(String source) => Source.fromMap(json.decode(source));
}
