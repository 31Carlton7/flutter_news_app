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
            switch (index) {
              case 14:
              case 15:
              case 16:
              case 17:
              case 18:
              case 19:
              case 20:
                return Container();

              default:
                ArticleCardSmall(articles[index + 6]);
            }
            return ArticleCardSmall(articles[index + 6]);
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
