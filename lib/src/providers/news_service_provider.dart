import 'package:canton_news_app/src/services/news_service.dart';
import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

final newsServiceProvider = Provider<NewsService>((ref) {
  return NewsService(Dio());
});
