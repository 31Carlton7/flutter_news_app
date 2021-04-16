import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/config/news_exceptions.dart';
import 'package:canton_news_app/src/models/article.dart';
import 'package:canton_news_app/src/ui/providers/news_future_provider.dart';
import 'package:canton_news_app/src/ui/styled_components/article_card_large.dart';
import 'package:canton_news_app/src/ui/styled_components/article_card_medium.dart';
import 'package:canton_news_app/src/ui/styled_components/covid19_card.dart';
import 'package:canton_news_app/src/ui/styled_components/error_body.dart';
import 'package:canton_news_app/src/ui/styled_components/unexpected_error.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod/riverpod.dart';

class TopStoriesView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return CantonScaffold(
      body: _content(context, watch),
    );
  }

  Widget _content(BuildContext context, ScopedReader watch) {
    return watch(newsFutureProvider).when(
      error: (e, s) {
        if (e is NewsExceptions) {
          return ErrorBody(e.message);
        }
        return UnexpectedError();
      },
      loading: () => Loading(),
      data: (articles) {
        return CustomScrollView(
          slivers: [
            _header(context),
            _articleList(context, articles),
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
          CantonActionButton(
            icon: FeatherIcons.search,
            iconColor: cantonGrey[600],
            onPressed: () {},
          ),
          Text(
            'Top Stories',
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: cantonSuccess[600]),
          ),
          CantonActionButton(
            icon: FeatherIcons.bookmark,
            iconColor: cantonGrey[600],
            onPressed: () {},
          ),
          // Text(
          //   DateFormat.yMMMMd().format(DateTime.now().toLocal()),
          //   style:
          //       textTheme(context).bodyText1.copyWith(color: cantonGrey[600]),
          // ),
        ],
      ),
    );
  }

  Widget _articleList(BuildContext context, List<Article> articles) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (articles.length != 0) {
            switch (index) {
              case 0:
                return COVID19Card();
              case 1:
              case 5:
              case 10:
                return ArticleCardLarge(article: articles[index]);
              default:
                return ArticleCardMedium(article: articles[index]);
            }
          } else {
            Center(
              child: Text(
                'No Articles :(',
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: cantonGrey[600]),
              ),
            );
          }
          return Container();
        },

        /// Sets ChildCount to one incase of error and needs to display on Item in the list
        /// This also allows the use of the [RefreshList] widget, to refresh the feed.
        childCount: articles.length != 0 ? articles.length - 1 : 1,
      ),
    );
  }
}
