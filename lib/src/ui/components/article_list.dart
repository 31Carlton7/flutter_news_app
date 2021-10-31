import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/models/article.dart';
import 'article_card_medium.dart';
import '../views/top_stories_view/components/covid19_card.dart';

import 'article_card_large.dart';

class ArticleList extends StatelessWidget {
  const ArticleList(this.articles, this.showCovid19Card, this.source);
  final List<Article> articles;
  final bool showCovid19Card, source;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (articles.length != 0 && index <= 5) {
            switch (index) {
              case 0:
                return showCovid19Card ? COVID19Card() : Container();

              case 1:
                return showCovid19Card ? const SizedBox(height: 10) : ArticleCardLarge(articles[index], source);
              case 2:
                return showCovid19Card
                    ? ArticleCardLarge(articles[index], source)
                    : ArticleCardMedium(articles[index], source);
              default:
                return ArticleCardMedium(articles[index], source);
            }
          } else {
            return Container();
          }
        },

        /// Sets ChildCount to one incase of error and needs to display on Item in the list
        /// This also allows the use of the [RefreshList] widget, to refresh the feed.
        childCount: articles.length != 0 ? articles.length - 1 : 1,
      ),
    );
  }
}
