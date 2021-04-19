import 'package:canton_news_app/src/config/environment_config.dart';
import 'package:canton_news_app/src/models/source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'news_service_provider.dart';

final _environmentConfig = EnvironmentConfig();
String path = '';

final newsSourcesFutureProvider =
    FutureProvider.autoDispose<List<Source>>((ref) async {
  ref.maintainState = true;

  final newsService = ref.read(newsServiceProvider);
  final sources = newsService.getSources(
    // ['', null].contains(path)
    //     ?
    'https://newsapi.org/v2/sources?country=us&apiKey=${_environmentConfig.newsApiKey}',
    // :
    // path,
  );
  return sources;
});
