import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/config/news_exceptions.dart';
import 'package:canton_news_app/src/ui/providers/news_future_provider.dart';
import 'package:canton_news_app/src/ui/styled_components/article_grid.dart';
import 'package:canton_news_app/src/ui/styled_components/article_list.dart';
import 'package:canton_news_app/src/ui/styled_components/error_body.dart';
import 'package:canton_news_app/src/ui/styled_components/unexpected_error.dart';
import 'package:canton_news_app/src/ui/views/category_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
        return UnexpectedError(newsFutureProvider);
      },
      loading: () => Loading(),
      data: (articles) {
        return CustomScrollView(
          slivers: [
            _header(context),
            CupertinoSliverRefreshControl(
              onRefresh: () async => await context.refresh(newsFutureProvider),
            ),
            ArticleList(articles),
            ArticleGrid(articles),
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
            icon: FeatherIcons.list,
            iconColor: cantonGrey[600],
            onPressed: () => viewTransition(context, CategoryView()),
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
        ],
      ),
    );
  }
}
