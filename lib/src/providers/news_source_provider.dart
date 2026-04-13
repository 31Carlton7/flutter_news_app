import 'package:canton_news_app/src/config/environment_config.dart';
import 'package:canton_news_app/src/models/article.dart';
import 'package:canton_news_app/src/providers/news_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newsSourceProvider =
    FutureProvider.autoDispose.family<List<Article>, String>((ref, source) async {
  ref.maintainState = true;
  final newsService = ref.read(newsServiceProvider);
  return newsService.getArticles(
    path: '${EnvironmentConfig.baseUrl}/top-headlines?sources=$source&apiKey=${EnvironmentConfig.newsApiKey}',
  );
});
