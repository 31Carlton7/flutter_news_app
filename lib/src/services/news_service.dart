import 'package:canton_news_app/src/config/news_exceptions.dart';
import 'package:canton_news_app/src/models/article.dart';
import 'package:canton_news_app/src/models/source.dart';
import 'package:dio/dio.dart';

class NewsService {
  final Dio _dio;

  NewsService(this._dio);

  Future<List<Article>> getArticles({required String path}) async {
    try {
      final response = await _dio.get(path);
      final results = List<Map<String, dynamic>>.from(response.data['articles']);
      return results.map((data) => Article.fromMap(data)).toList(growable: false);
    } on DioError catch (e) {
      throw NewsExceptions.fromDioError(e);
    }
  }

  Future<List<Source>> getSources(String path) async {
    try {
      final response = await _dio.get(path);
      final results = List<Map<String, dynamic>>.from(response.data['sources']);
      return results.map((data) => Source.fromMap(data)).toList(growable: false);
    } on DioError catch (e) {
      throw NewsExceptions.fromDioError(e);
    }
  }
}
