import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/models/article.dart';
import 'package:canton_news_app/src/ui/views/article_view/components/article_description.dart';
import 'package:canton_news_app/src/ui/views/article_view/components/article_view_header.dart';

class ArticleView extends StatelessWidget {
  const ArticleView(this.article, this.source) : super();
  final Article article;
  final bool source;

  @override
  Widget build(BuildContext context) {
    return CantonScaffold(
      backgroundColor: CantonMethods.alternateCanvasColor(context),
      padding: EdgeInsets.zero,
      body: _content(context),
    );
  }

  Widget _content(BuildContext context) {
    return Column(
      children: [
        ArticleViewHeader(article: article),
        SizedBox(height: 12),
        Expanded(
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ArticleDescription(source: source, article: article),
                  SizedBox(height: 12),
                  _body(context),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 27),
      child: Text(article.content ?? 'No Content', style: Theme.of(context).textTheme.bodyText1),
    );
  }
}
