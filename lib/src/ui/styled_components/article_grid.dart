import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/models/article.dart';

import 'article_card_small.dart';

class ArticleGrid extends StatelessWidget {
  const ArticleGrid(this.articles);
  final List<Article> articles;
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (articles.length != 0) {
            if (index == -1) {
              return Text(
                'Error :(',
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: CantonColors.textTertiary),
              );
            } else {
              index -= 5;
              return ArticleCardSmall(articles[index + 5]);
            }
          } else {
            return Text(
              'No Articles :(',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: CantonColors.textTertiary),
            );
          }
        },

        /// Sets ChildCount to one incase of error and needs to display on Item in the list
        /// This also allows the use of the [RefreshList] widget, to refresh the feed.
        childCount: articles.length != 0 ? articles.length - 1 : 1,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 350,
      ),
    );
  }
}
