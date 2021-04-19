import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/models/article.dart';
import 'article_card_medium.dart';
import 'covid19_card.dart';

import 'article_card_large.dart';

class ArticleList extends StatelessWidget {
  const ArticleList(this.articles);
  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (articles.length != 0 && index <= 5) {
            switch (index) {
              case 0:
                return COVID19Card();
              case 1:
                return ArticleCardLarge(articles[index]);
              default:
                return ArticleCardMedium(articles[index]);
            }
          } else {
            Center(
              child: Text(
                'No Articles :(',
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: cantonGrey[600]),
              ),
            );
          }
          return Container();
        },

        /// Sets ChildCount to one incase of error and needs to display on Item in the list
        /// This also allows the use of the [RefreshList] widget, to refresh the feed.
        childCount: articles.length != 0 ? articles.length - 1 : 1,
      ),
    );
  }
}