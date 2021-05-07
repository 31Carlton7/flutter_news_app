import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/config/news_exceptions.dart';
import 'package:canton_news_app/src/ui/providers/news_covid19_provider.dart';
import 'package:canton_news_app/src/ui/styled_components/article_grid.dart';
import 'package:canton_news_app/src/ui/styled_components/article_list.dart';
import 'package:canton_news_app/src/ui/styled_components/error_body.dart';
import 'package:canton_news_app/src/ui/styled_components/unexpected_error.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class COVID19View extends StatefulWidget {
  @override
  _COVID19ViewState createState() => _COVID19ViewState();
}

class _COVID19ViewState extends State<COVID19View> {
  @override
  void initState() {
    super.initState();
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
        return watch(newsCOVID19Provider).when(
          loading: () => Loading(),
          error: (e, s) {
            if (e is NewsExceptions) {
              return ErrorBody(e.message, newsCOVID19Provider);
            }
            return UnexpectedError(newsCOVID19Provider);
          },
          data: (articles) {
            return CustomScrollView(
              slivers: [
                _header(context),
                CupertinoSliverRefreshControl(
                  onRefresh: () async =>
                      await context.refresh(newsCOVID19Provider),
                ),
                ArticleList(articles, false),
                ArticleGrid(articles),
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
      title: Text(
        'Coronavirus',
        style: Theme.of(context)
            .textTheme
            .headline5
            .copyWith(color: CantonColors.green),
      ),
      leading: CantonBackButton(isClear: true),
      centerTitle: true,
    );
  }
}
