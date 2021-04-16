import 'package:canton_news_app/src/services/news_service.dart';
import 'package:canton_news_app/src/ui/providers/api_key_provider.dart';
import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

final newsServiceProvider = Provider<NewsService>((ref) {
  final _environmentConfig = ref.read(environmentConfigProvider);
  return NewsService(_environmentConfig, Dio());
});
