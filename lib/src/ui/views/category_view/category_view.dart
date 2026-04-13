import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/config/news_exceptions.dart';
import 'package:canton_news_app/src/models/source.dart';
import 'package:canton_news_app/src/providers/news_category_provider.dart';
import 'package:canton_news_app/src/ui/components/article_grid.dart';
import 'package:canton_news_app/src/ui/components/article_list.dart';
import 'package:canton_news_app/src/ui/components/error_body.dart';
import 'package:canton_news_app/src/ui/components/unexpected_error.dart';
import 'package:canton_news_app/src/ui/views/category_view/components/category_view_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryView extends StatelessWidget {
  const CategoryView(this.source);
  final Source source;

  String get _category => source.category ?? '';

  @override
  Widget build(BuildContext context) {
    return CantonScaffold(
      backgroundColor: CantonMethods.alternateCanvasColor(context),
      body: Consumer(
        builder: (context, watch, child) {
          return watch(newsCategoryProvider(_category)).when(
            error: (e, s) {
              if (e is NewsExceptions) {
                return ErrorBody(e.message, newsCategoryProvider(_category));
              }
              return UnexpectedError(newsCategoryProvider(_category));
            },
            loading: () => Loading(),
            data: (articles) {
              return EasyRefresh(
                header: ClassicalHeader(
                  bgColor: CantonMethods.alternateCanvasColor(context),
                  textColor: Theme.of(context).primaryColor,
                  infoColor: Theme.of(context).primaryColor,
                  enableHapticFeedback: true,
                  float: false,
                ),
                onRefresh: () async {
                  return await context.refresh(newsCategoryProvider(_category));
                },
                child: CustomScrollView(
                  slivers: <Widget>[
                    CategoryViewHeader(source: source),
                    ArticleList(articles, showCovid19Card: false, isSourceView: false),
                    ArticleGrid(articles, isSourceView: false),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
