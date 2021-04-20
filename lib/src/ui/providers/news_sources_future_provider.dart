import 'package:canton_news_app/src/config/environment_config.dart';
import 'package:canton_news_app/src/models/source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'news_service_provider.dart';

String path;
final _environmentConfig = EnvironmentConfig();

final newsSourcesFutureProvider =
    FutureProvider.autoDispose<List<Source>>((ref) async {
  ref.maintainState = true;

  final newsService = ref.read(newsServiceProvider);
  final sources = newsService.getSources(
    path ??
        'https://newsapi.org/v2/sources?country=us&apiKey=${_environmentConfig.newsApiKey}',
  );
  return sources;
});
