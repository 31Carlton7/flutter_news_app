import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/models/article.dart';
import 'package:canton_news_app/src/ui/views/article_view.dart';

class ArticleCardSmall extends StatelessWidget {
  const ArticleCardSmall(this.article);

  @required
  final Article article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => viewTransition(context, ArticleView(article)),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipSquircleBorder(
              radius: 45,
              child: Image.network(
                article.getImageUrl,
                fit: BoxFit.cover,
                height: 125,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Text(
                article.title,
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                      color: cantonGrey[900],
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                article.getPublishedAtFormattedTime,
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: cantonGrey[600],
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
