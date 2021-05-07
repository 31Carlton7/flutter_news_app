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
      onTap: () => CantonMethods.viewTransition(context, ArticleView(article)),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.name,
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                          color: CantonColors.green,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Text(
                    shortenLengthenOfTitle(article.title),
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                          color: CantonColors.textPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                article.getPublishedAtFormattedTime,
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: CantonColors.textTertiary,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Adds '...' to end of string if string word length is greater than 15
  String shortenLengthenOfTitle(String string) {
    string = string.substring(0, string.indexOf(' - '));
    if (string.split(' ').length >= 15) {
      return CantonMethods.addDotsToString(string, 15);
    } else {
      return string;
    }
  }
}
