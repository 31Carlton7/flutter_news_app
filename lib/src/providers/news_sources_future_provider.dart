import 'package:canton_news_app/src/config/environment_config.dart';
import 'package:canton_news_app/src/models/source.dart';
import 'package:canton_news_app/src/providers/news_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newsSourcesProvider = FutureProvider.autoDispose<List<Source>>((ref) async {
  ref.maintainState = true;
  final newsService = ref.read(newsServiceProvider);
  return newsService.getSources(
    '${EnvironmentConfig.baseUrl}/sources?country=us&apiKey=${EnvironmentConfig.newsApiKey}',
  );
});
