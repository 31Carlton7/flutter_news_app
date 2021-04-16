import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/config/news_exceptions.dart';
import 'package:canton_news_app/src/models/article.dart';
import 'package:canton_news_app/src/ui/providers/news_future_provider.dart';
import 'package:canton_news_app/src/ui/providers/news_search_future_provider.dart';
import 'package:canton_news_app/src/ui/styled_components/article_card_large.dart';
import 'package:canton_news_app/src/ui/styled_components/article_card_medium.dart';
import 'package:canton_news_app/src/ui/styled_components/error_body.dart';
import 'package:canton_news_app/src/ui/styled_components/unexpected_error.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SourceView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return CantonScaffold(
      body: _content(context, watch),
    );
  }

  Widget _content(BuildContext context, ScopedReader watch) {
    return watch(newsSearchFutureProvider).when(
      loading: () => Loading(),
      error: (e, s) {
        if (e is NewsExceptions) {
          return ErrorBody(e.message);
        }
        return UnexpectedError();
      },
      data: (articles) {
        return Column(children: <Widget>[
          _header(context),
          SizedBox(height: 10),
          _articleList(context, articles),
        ]);
      },
    );
  }

  Widget _header(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CantonBackButton(),
          Text(
            'SOURCE NAME',
            style: textTheme(context).headline6.copyWith(
                  color: cantonSuccess[600],
                ),
          ),
          CantonHeaderButton(
            iconColor: cantonGrey[600],
            icon: FeatherIcons.moreVertical,
            onPressed: () {},
          ),
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
                    ? ArticleCardLarge(article: articles[index])
                    : ArticleCardMedium(
                        article: articles[index],
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
