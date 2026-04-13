import 'dart:convert';

class Article {
  final String? id;
  final String? name;
  final String? author;
  final String? title;
  final String? content;
  final String? imagePath;
  final String? publishedAt;

  const Article({
    this.id,
    this.name,
    this.author,
    this.title,
    this.content,
    this.imagePath,
    this.publishedAt,
  });

  String get imageUrl => imagePath ?? '';

  String get publishedAtFormatted {
    if (publishedAt == null) return '';
    final duration = DateTime.now().difference(DateTime.parse(publishedAt!));
    if (duration.inHours < 1) {
      return '${duration.inMinutes}m ago';
    }
    return '${duration.inHours}h ago';
  }

  /// Safely extracts the display title, stripping the trailing " - Source" suffix
  /// commonly appended by the News API. Returns the full title if no suffix is found.
  String get displayTitle {
    if (title == null) return '';
    final separatorIndex = title!.lastIndexOf(' - ');
    if (separatorIndex == -1) return title!;
    return title!.substring(0, separatorIndex);
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
      id: map['source']?['id'] as String?,
      name: map['source']?['name'] as String?,
      author: map['author'] as String?,
      title: map['title'] as String?,
      content: map['content'] as String?,
      imagePath: map['urlToImage'] as String?,
      publishedAt: map['publishedAt'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory Article.fromJson(String source) => Article.fromMap(json.decode(source));
}
