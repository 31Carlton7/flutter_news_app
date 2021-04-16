import 'package:canton_news_app/src/models/article.dart';
import 'package:canton_news_app/src/ui/providers/news_service_provider.dart';
import 'package:riverpod/riverpod.dart';

final newsFutureProvider =
    FutureProvider.autoDispose<List<Article>>((ref) async {
  ref.maintainState = true;

  final newsService = ref.read(newsServiceProvider);
  final articles = newsService.getArticles();
  return articles;
});
