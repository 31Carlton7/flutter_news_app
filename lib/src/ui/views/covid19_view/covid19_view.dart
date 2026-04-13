import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/config/news_exceptions.dart';
import 'package:canton_news_app/src/providers/news_covid19_provider.dart';
import 'package:canton_news_app/src/ui/components/article_grid.dart';
import 'package:canton_news_app/src/ui/components/article_list.dart';
import 'package:canton_news_app/src/ui/components/error_body.dart';
import 'package:canton_news_app/src/ui/components/unexpected_error.dart';
import 'package:canton_news_app/src/ui/views/covid19_view/components/covid19_view_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class COVID19View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CantonScaffold(
      backgroundColor: CantonMethods.alternateCanvasColor(context),
      body: Consumer(
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
              return EasyRefresh(
                header: ClassicalHeader(
                  bgColor: CantonMethods.alternateCanvasColor(context),
                  textColor: Theme.of(context).primaryColor,
                  infoColor: Theme.of(context).primaryColor,
                  enableHapticFeedback: true,
                  float: false,
                ),
                onRefresh: () async {
                  return await context.refresh(newsCOVID19Provider);
                },
                child: CustomScrollView(
                  slivers: [
                    COVID19ViewHeader(),
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
