import 'package:canton_news_app/src/config/environment_config.dart';
import 'package:riverpod/riverpod.dart';

final environmentConfigProvider = Provider<String>((ref) {
  return EnvironmentConfig.newsApiKey;
});
