import 'package:canton_news_app/src/config/environment_config.dart';
import 'package:canton_news_app/src/models/article.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'news_service_provider.dart';

final _environmentConfig = EnvironmentConfig();
String sourcePath = '';

final newsSourceProvider = FutureProvider.autoDispose<List<Article>>((ref) async {
  ref.maintainState = true;

  final newsService = ref.read(newsServiceProvider);
  final articles = newsService.getArticles(
    path: 'https://newsapi.org/v2/top-headlines?sources=$sourcePath&apiKey=${_environmentConfig.newsApiKey}',
  );
  return articles;
});
