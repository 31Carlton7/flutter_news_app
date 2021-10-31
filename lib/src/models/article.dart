import 'dart:convert';

class Article {
  String? id;
  String? name;
  String? author;
  String? title;
  String? content;
  String? imagePath;
  String? publishedAt;

  Article({
    this.id,
    this.name,
    this.author,
    this.title,
    this.content,
    this.imagePath,
    this.publishedAt,
  });

  String get getImageUrl => '$imagePath';

  String get getPublishedAtFormattedTime {
    return (DateTime.now().difference(DateTime.parse(publishedAt!)).inHours < 1)
        ? DateTime.now().difference(DateTime.parse(publishedAt!)).inMinutes.toString() + 'm ago'
        : DateTime.now().difference(DateTime.parse(publishedAt!)).inHours.toString() + 'h ago';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'author': author,
      'title': title,
      'content': content,
      'urlToImage': imagePath,
      'publishedAt': publishedAt,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      id: map['source']['id'] as String?,
      name: map['source']['name'] as String?,
      author: map['author'] as String?,
      title: map['title'] as String?,
      content: map['content'] as String?,
      imagePath: map['urlToImage'] as String?,
      publishedAt: map['publishedAt'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory Article.fromJson(String name) => Article.fromMap(json.decode(name));
}
