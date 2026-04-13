import 'package:canton_news_app/src/models/article.dart';
import 'package:canton_news_app/src/models/source.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Article', () {
    test('fromMap parses correctly', () {
      final map = {
        'source': {'id': 'test-id', 'name': 'Test Source'},
        'author': 'John Doe',
        'title': 'Test Title - Test Source',
        'content': 'Some content',
        'urlToImage': 'https://example.com/image.png',
        'publishedAt': '2024-01-01T00:00:00Z',
      };

      final article = Article.fromMap(map);
      expect(article.id, 'test-id');
      expect(article.name, 'Test Source');
      expect(article.author, 'John Doe');
      expect(article.title, 'Test Title - Test Source');
      expect(article.content, 'Some content');
      expect(article.imagePath, 'https://example.com/image.png');
    });

    test('displayTitle strips source suffix', () {
      final article = Article(title: 'Breaking News - CNN');
      expect(article.displayTitle, 'Breaking News');
    });

    test('displayTitle returns full title when no separator', () {
      final article = Article(title: 'Breaking News');
      expect(article.displayTitle, 'Breaking News');
    });

    test('displayTitle handles null title', () {
      final article = Article();
      expect(article.displayTitle, '');
    });

    test('imageUrl returns empty string for null imagePath', () {
      final article = Article();
      expect(article.imageUrl, '');
    });

    test('publishedAtFormatted returns empty string for null date', () {
      final article = Article();
      expect(article.publishedAtFormatted, '');
    });

    test('toMap and fromMap roundtrip', () {
      final article = Article(
        id: 'id',
        name: 'name',
        author: 'author',
        title: 'title',
        content: 'content',
        imagePath: 'url',
        publishedAt: '2024-01-01T00:00:00Z',
      );
      final map = article.toMap();
      expect(map['id'], 'id');
      expect(map['urlToImage'], 'url');
    });
  });

  group('Source', () {
    test('fromMap parses correctly', () {
      final map = {
        'id': 'test-id',
        'name': 'Test Source',
        'category': 'technology',
        'country': 'us',
      };

      final source = Source.fromMap(map);
      expect(source.id, 'test-id');
      expect(source.name, 'Test Source');
      expect(source.category, 'technology');
      expect(source.country, 'us');
    });

    test('toJson and fromJson roundtrip', () {
      final source = Source(id: 'id', name: 'name', category: 'cat', country: 'us');
      final json = source.toJson();
      final restored = Source.fromJson(json);
      expect(restored.id, 'id');
      expect(restored.name, 'name');
    });
  });
}
