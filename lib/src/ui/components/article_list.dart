import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/models/article.dart';
import 'package:canton_news_app/src/ui/components/article_card_medium.dart';
import 'package:canton_news_app/src/ui/views/top_stories_view/components/covid19_card.dart';
import 'package:canton_news_app/src/ui/components/article_card_large.dart';

class ArticleList extends StatelessWidget {
  const ArticleList(
    this.articles, {
    this.showCovid19Card = false,
    this.isSourceView = false,
  });

  final List<Article> articles;
  final bool showCovid19Card;
  final bool isSourceView;

  @override
  Widget build(BuildContext context) {
    if (articles.isEmpty) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    final maxItems = articles.length.clamp(0, 6);
    final offset = showCovid19Card ? 2 : 0;

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (showCovid19Card) {
            if (index == 0) return COVID19Card();
            if (index == 1) return const SizedBox(height: 10);
            final articleIndex = index - offset;
            if (articleIndex >= articles.length) return const SizedBox.shrink();
            if (index == 2) return ArticleCardLarge(articles[articleIndex], isSourceView: isSourceView);
            return ArticleCardMedium(articles[articleIndex], isSourceView: isSourceView);
          }

          if (index >= articles.length) return const SizedBox.shrink();
          if (index == 0) return ArticleCardLarge(articles[index], isSourceView: isSourceView);
          return ArticleCardMedium(articles[index], isSourceView: isSourceView);
        },
        childCount: showCovid19Card ? maxItems + offset : maxItems,
      ),
    );
  }
}
