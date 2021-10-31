import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/config/news_exceptions.dart';
import 'package:canton_news_app/src/providers/news_future_provider.dart';
import 'package:canton_news_app/src/ui/components/article_grid.dart';
import 'package:canton_news_app/src/ui/components/article_list.dart';
import 'package:canton_news_app/src/ui/components/error_body.dart';
import 'package:canton_news_app/src/ui/components/unexpected_error.dart';
import 'package:canton_news_app/src/ui/views/top_stories_view/components/top_stories_view_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopStoriesView extends StatefulWidget {
  @override
  _TopStoriesViewState createState() => _TopStoriesViewState();
}

class _TopStoriesViewState extends State<TopStoriesView> {
  @override
  void initState() {
    super.initState();
    context.refresh(newsFutureProvider);
  }

  @override
  Widget build(BuildContext context) {
    return _content(context);
  }

  Widget _content(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        return watch(newsFutureProvider).when(
          error: (e, s) {
            if (e is NewsExceptions) {
              return ErrorBody(e.message, newsFutureProvider);
            }
            return UnexpectedError(newsFutureProvider);
          },
          loading: () => Loading(),
          data: (articles) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: EasyRefresh(
                header: ClassicalHeader(
                  bgColor: CantonMethods.alternateCanvasColor(context),
                  textColor: Theme.of(context).primaryColor,
                  infoColor: Theme.of(context).primaryColor,
                  enableHapticFeedback: true,
                  float: false,
                ),
                onRefresh: () async {
                  return await context.refresh(newsFutureProvider);
                },
                child: CustomScrollView(
                  slivers: [
                    TopStoriesViewHeader(),
                    ArticleList(articles, true, false),
                    ArticleGrid(articles, false),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
