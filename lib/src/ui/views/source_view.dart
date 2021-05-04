import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/config/environment_config.dart';
import 'package:canton_news_app/src/config/news_exceptions.dart';
import 'package:canton_news_app/src/models/source.dart';
import 'package:canton_news_app/src/ui/providers/news_future_provider.dart';
import 'package:canton_news_app/src/ui/styled_components/article_grid.dart';
import 'package:canton_news_app/src/ui/styled_components/article_list.dart';
import 'package:canton_news_app/src/ui/styled_components/error_body.dart';
import 'package:canton_news_app/src/ui/styled_components/unexpected_error.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SourceView extends StatefulWidget {
  const SourceView(this.source);
  @required
  final Source source;
  @override
  _SourceViewState createState() => _SourceViewState();
}

class _SourceViewState extends State<SourceView> {
  @override
  void initState() {
    super.initState();
    final _environmentConfig = EnvironmentConfig();
    final now = DateTime.now();

    /// Only allows articles from the last week to be returned.
    futurePath =
        'https://newsapi.org/v2/everything?qInTitle=${widget.source.name}&language=en&from=${DateTime(now.year, now.month, now.day - 7)}&apiKey=${_environmentConfig.newsApiKey}';
    context.refresh(newsFutureProvider);
  }

  @override
  void dispose() {
    futurePath = null;
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
    return Consumer(builder: (context, watch, child) {
      return watch(newsFutureProvider).when(
        loading: () => Loading(),
        error: (e, s) {
          if (e is NewsExceptions) {
            return ErrorBody(e.message);
          }
          return UnexpectedError(newsFutureProvider);
        },
        data: (articles) {
          return CustomScrollView(
            slivers: <Widget>[
              _header(context),
              ArticleList(articles, false),
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
          CantonBackButton(isClear: true),
          Text(
            widget.source.name,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: CantonColors.green),
          ),
          Container(width: 60),
        ],
      ),
    );
  }
}
