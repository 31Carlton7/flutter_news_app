import 'package:canton_news_app/src/config/environment_config.dart';
import 'package:canton_news_app/src/config/news_exceptions.dart';
import 'package:canton_news_app/src/models/article.dart';
import 'package:dio/dio.dart';

class NewsService {
  NewsService(this._environmentConfig, this._dio);
  final EnvironmentConfig _environmentConfig;
  final Dio _dio;

  Future<List<Article>> getArticles() async {
    try {
      final response = await _dio.get(
          'https://newsapi.org/v2/top-headlines?language=en&apiKey=${_environmentConfig.newsApiKey}');

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

  Future<List<Article>> getSearchArticles({String path}) async {
    try {
      final response = await _dio.get(
        [null, ''].contains(path)
            ? 'https://newsapi.org/v2/top-headlines?language=en&apiKey=${_environmentConfig.newsApiKey}'
            : path,
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
}
