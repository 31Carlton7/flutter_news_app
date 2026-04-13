import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/config/news_exceptions.dart';
import 'package:canton_news_app/src/models/source.dart';
import 'package:canton_news_app/src/providers/news_source_provider.dart';
import 'package:canton_news_app/src/ui/components/article_grid.dart';
import 'package:canton_news_app/src/ui/components/article_list.dart';
import 'package:canton_news_app/src/ui/components/error_body.dart';
import 'package:canton_news_app/src/ui/components/unexpected_error.dart';
import 'package:canton_news_app/src/ui/views/source_view/components/source_view_header.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SourceView extends StatelessWidget {
  const SourceView(this.source);
  final Source source;

  String get _sourceId => source.name!.replaceAll(' ', '-');

  @override
  Widget build(BuildContext context) {
    return CantonScaffold(
      backgroundColor: CantonMethods.alternateCanvasColor(context),
      body: Consumer(
        builder: (context, watch, child) {
          return watch(newsSourceProvider(_sourceId)).when(
            loading: () => Loading(),
            error: (e, s) {
              if (e is NewsExceptions) {
                return ErrorBody(e.message, newsSourceProvider(_sourceId));
              }
              return UnexpectedError(newsSourceProvider(_sourceId));
            },
            data: (articles) {
              return CustomScrollView(
                slivers: <Widget>[
                  SourceViewHeader(source: source),
                  ArticleList(articles, showCovid19Card: false, isSourceView: true),
                  ArticleGrid(articles, isSourceView: true),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
