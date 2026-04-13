import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/models/article.dart';
import 'package:canton_news_app/src/ui/components/article_card_small.dart';

class ArticleGrid extends StatelessWidget {
  const ArticleGrid(this.articles, {this.isSourceView = false});

  final List<Article> articles;
  final bool isSourceView;

  static const _listOffset = 6;
  static const _maxGridItems = 14;

  @override
  Widget build(BuildContext context) {
    if (articles.length <= _listOffset) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    final gridArticles = articles.skip(_listOffset).take(_maxGridItems).toList();

    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return ArticleCardSmall(gridArticles[index], isSourceView: isSourceView);
        },
        childCount: gridArticles.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 260,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
    );
  }
}
