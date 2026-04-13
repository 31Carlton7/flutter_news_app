import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/models/article.dart';
import 'package:canton_news_app/src/ui/views/article_view/components/article_description.dart';
import 'package:canton_news_app/src/ui/views/article_view/components/article_view_header.dart';

class ArticleView extends StatelessWidget {
  const ArticleView(this.article, {this.isSourceView = false});
  final Article article;
  final bool isSourceView;

  @override
  Widget build(BuildContext context) {
    return CantonScaffold(
      backgroundColor: CantonMethods.alternateCanvasColor(context),
      padding: EdgeInsets.zero,
      body: Column(
        children: [
          ArticleViewHeader(article: article),
          const SizedBox(height: 12),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ArticleDescription(isSourceView: isSourceView, article: article),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 27),
                    child: Text(
                      article.content ?? 'No Content',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
