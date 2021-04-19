import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/config/environment_config.dart';
import 'package:canton_news_app/src/config/news_exceptions.dart';
import 'package:canton_news_app/src/models/article.dart';
import 'package:canton_news_app/src/models/source.dart';
import 'package:canton_news_app/src/ui/providers/news_future_provider.dart';
import 'package:canton_news_app/src/ui/providers/news_sources_future_provider.dart';
import 'package:canton_news_app/src/ui/styled_components/article_card_large.dart';
import 'package:canton_news_app/src/ui/styled_components/article_card_medium.dart';
import 'package:canton_news_app/src/ui/styled_components/article_grid.dart';
import 'package:canton_news_app/src/ui/styled_components/article_list.dart';
import 'package:canton_news_app/src/ui/styled_components/error_body.dart';
import 'package:canton_news_app/src/ui/styled_components/unexpected_error.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SourceView extends ConsumerWidget {
  const SourceView(this.source);
  @required
  final Source source;
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return CantonScaffold(
      body: _content(context, watch),
    );
  }

  Widget _content(BuildContext context, ScopedReader watch) {
    final _environmentConfig = EnvironmentConfig();
    // path =
    //     'https://newsapi.org/v2/sources?category=${source.name}&apiKey=${_environmentConfig.newsApiKey}';
    return watch(newsSourcesFutureProvider).when(
      loading: () => Loading(),
      error: (e, s) {
        if (e is NewsExceptions) {
          return ErrorBody(e.message);
        }
        return UnexpectedError(newsSourcesFutureProvider);
      },
      data: (articles) {
        return CustomScrollView(
          slivers: <Widget>[
            _header(context),
            // ArticleList(articles),
            // ArticleGrid(articles),
            // _articleList(context, articles),
          ],
        );
      },
    );
  }

  Widget _header(BuildContext context) {
    return SliverAppBar(
      floating: true,
      elevation: 0,
      backgroundColor: cantonGrey[100],
      flexibleSpace: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CantonBackButton(
            isClear: true,
          ),
          Text(
            source.name,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: cantonSuccess[600]),
          ),
          Container(width: 60),
        ],
      ),
    );
  }

  Widget _articleList(BuildContext context, List<Article> articles) {
    return Expanded(
      child: RefreshList(
        color: cantonSuccess[600],
        onRefresh: () => context.refresh(newsFutureProvider),
        child: ListView.separated(
          /// Sets ItemCount to one incase of error and needs to display on Item in the list
          /// This also allows the use of the [LiquidPullToRefresh] widget, to refresh the feed.
          itemCount: articles.length != 0 ? articles.length : 1,
          separatorBuilder: (context, index) {
            return SizedBox(height: 5);
          },
          itemBuilder: (context, index) {
            return articles.length != 0
                ? (index == 0 || index == 4 || index == 9)
                    ? ArticleCardLarge(articles[index])
                    : ArticleCardMedium(
                        articles[index],
                      )
                : Center(
                    child: Text(
                      'No Articles :(',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(color: cantonGrey[600]),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
