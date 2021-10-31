import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/config/news_exceptions.dart';
import 'package:canton_news_app/src/models/source.dart';
import 'package:canton_news_app/src/providers/news_source_provider.dart';
import 'package:canton_news_app/src/ui/components/article_grid.dart';
import 'package:canton_news_app/src/ui/components/article_list.dart';
import 'package:canton_news_app/src/ui/components/error_body.dart';
import 'package:canton_news_app/src/ui/components/unexpected_error.dart';
import 'package:canton_news_app/src/ui/views/source_view/components/source_view_header.dart';
import 'package:flutter/cupertino.dart';
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
    sourcePath = widget.source.name!.replaceAll(' ', '-');
    context.refresh(newsSourceProvider);
  }

  @override
  Widget build(BuildContext context) {
    return CantonScaffold(
      backgroundColor: CantonMethods.alternateCanvasColor(context),
      body: _content(context),
    );
  }

  Widget _content(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        return watch(newsSourceProvider).when(
          loading: () => Loading(),
          error: (e, s) {
            if (e is NewsExceptions) {
              return ErrorBody(e.message, newsSourceProvider);
            }
            return UnexpectedError(newsSourceProvider);
          },
          data: (articles) {
            return CustomScrollView(
              slivers: <Widget>[
                SourceViewHeader(source: widget.source),
                ArticleList(articles, false, true),
                ArticleGrid(articles, true),
              ],
            );
          },
        );
      },
    );
  }
}
