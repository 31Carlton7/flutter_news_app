import 'package:canton_news_app/src/models/article.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'news_service_provider.dart';

String path = '';

final newsSearchFutureProvider =
    FutureProvider.autoDispose<List<Article>>((ref) async {
  ref.maintainState = true;

  final newsService = ref.read(newsServiceProvider);
  final articles = newsService.getSearchArticles(path: path);
  return articles;
});
