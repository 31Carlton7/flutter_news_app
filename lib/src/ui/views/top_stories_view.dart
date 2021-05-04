import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/config/news_exceptions.dart';
import 'package:canton_news_app/src/ui/providers/news_future_provider.dart';
import 'package:canton_news_app/src/ui/styled_components/article_grid.dart';
import 'package:canton_news_app/src/ui/styled_components/article_list.dart';
import 'package:canton_news_app/src/ui/styled_components/error_body.dart';
import 'package:canton_news_app/src/ui/styled_components/unexpected_error.dart';
import 'package:canton_news_app/src/ui/views/category_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopStoriesView extends StatefulWidget {
  @override
  _TopStoriesViewState createState() => _TopStoriesViewState();
}

class _TopStoriesViewState extends State<TopStoriesView> {
  @override
  void initState() {
    super.initState();
    futurePath = null;
    context.refresh(newsFutureProvider);
  }

  @override
  void dispose() {
    context.refresh(newsFutureProvider);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CantonScaffold(
      body: _content(context),
    );
  }

  Widget _content(BuildContext context) {
    futurePath = null;
    return Consumer(builder: (context, watch, child) {
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
                onRefresh: () async =>
                    await context.refresh(newsFutureProvider),
              ),
              ArticleList(articles, true),
              ArticleGrid(articles),
            ],
          );
        },
      );
    });
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
            icon: IconlyIcon(
              IconlyBold.Filter1,
              color: CantonColors.textSecondary,
            ),
            onPressed: () =>
                CantonMethods.viewTransition(context, CategoryListView()),
          ),
          Text(
            'Top Stories',
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: CantonColors.green),
          ),
          CantonActionButton(
            icon: IconlyIcon(
              IconlyBold.Bookmark,
              color: CantonColors.iconSecondary,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
