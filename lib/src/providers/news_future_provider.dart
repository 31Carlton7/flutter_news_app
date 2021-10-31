import 'package:canton_news_app/src/config/environment_config.dart';
import 'package:canton_news_app/src/models/article.dart';
import 'package:canton_news_app/src/providers/news_service_provider.dart';
import 'package:riverpod/riverpod.dart';

final _environmentConfig = EnvironmentConfig();

final newsFutureProvider = FutureProvider.autoDispose<List<Article>>((ref) async {
  ref.maintainState = true;
  final newsService = ref.read(newsServiceProvider);

  final articles = newsService.getArticles(
    path: 'https://newsapi.org/v2/top-headlines?language=en&apiKey=${_environmentConfig.newsApiKey}',
  );
  return articles;
});
