import 'package:canton_news_app/src/config/news_exceptions.dart';
import 'package:canton_news_app/src/models/article.dart';
import 'package:canton_news_app/src/models/source.dart';
import 'package:dio/dio.dart';

class NewsService {
  NewsService(this._dio);
  final Dio _dio;

  Future<List<Article>> getArticles({required String path}) async {
    try {
      final response = await _dio.get(
        path,
      );

      final results = List<Map<String, dynamic>>.from(
        response.data['articles'],
      );

      final List<Article> articles = results
          .map((articleData) => Article.fromMap(articleData))
          .toList(growable: false);

      return articles;
    } on DioError catch (e) {
      throw NewsExceptions.fromDioError(e);
    }
  }

  Future<List<Source>> getSources(String path) async {
    try {
      final response = await _dio.get(path);

      final results = List<Map<String, dynamic>>.from(
        response.data['sources'],
      );

      final List<Source> sources = results
          .map((sourceData) => Source.fromMap(sourceData))
          .toList(growable: false);

      return sources;
    } on DioError catch (e) {
      throw NewsExceptions.fromDioError(e);
    }
  }
}
