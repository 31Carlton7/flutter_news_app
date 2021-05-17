import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/config/news_exceptions.dart';
import 'package:canton_news_app/src/models/source.dart';
import 'package:canton_news_app/src/ui/providers/news_category_provider.dart';
import 'package:canton_news_app/src/ui/styled_components/article_grid.dart';
import 'package:canton_news_app/src/ui/styled_components/article_list.dart';
import 'package:canton_news_app/src/ui/styled_components/error_body.dart';
import 'package:canton_news_app/src/ui/styled_components/unexpected_error.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryView extends StatefulWidget {
  const CategoryView(this.source);
  @required
  final Source source;
  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  void initState() {
    super.initState();
    categoryPath = widget.source.category;
    context.refresh(newsCategoryProvider);
  }

  @override
  Widget build(BuildContext context) {
    return CantonScaffold(
      body: _content(context),
    );
  }

  Widget _content(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        return watch(newsCategoryProvider).when(
          loading: () => Loading(),
          error: (e, s) {
            if (e is NewsExceptions) {
              return ErrorBody(e.message, newsCategoryProvider);
            }
            return UnexpectedError(newsCategoryProvider);
          },
          data: (articles) {
            return CustomScrollView(
              slivers: <Widget>[
                _header(context),
                CupertinoSliverRefreshControl(
                  onRefresh: () async =>
                      await context.refresh(newsCategoryProvider),
                ),
                ArticleList(articles, false, true),
                ArticleGrid(articles, true),
              ],
            );
          },
        );
      },
    );
  }

  Widget _header(BuildContext context) {
    return SliverAppBar(
      floating: true,
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: Text(
        widget.source.category,
        style: Theme.of(context)
            .textTheme
            .headline5
            .copyWith(color: Theme.of(context).primaryColor),
      ),
      leading: CantonBackButton(isClear: true),
      centerTitle: true,
    );
  }
}
