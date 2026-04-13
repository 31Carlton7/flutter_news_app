import 'package:canton_news_app/src/config/environment_config.dart';
import 'package:canton_news_app/src/models/article.dart';
import 'package:canton_news_app/src/providers/news_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newsCategoryProvider =
    FutureProvider.autoDispose.family<List<Article>, String>((ref, category) async {
  final newsService = ref.read(newsServiceProvider);
  return newsService.getArticles(
    path:
        '${EnvironmentConfig.baseUrl}/top-headlines?language=en&category=$category&country=us&apiKey=${EnvironmentConfig.newsApiKey}',
  );
});
