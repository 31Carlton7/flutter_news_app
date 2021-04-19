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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.name,
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                          color: cantonSuccess[600],
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Text(
                    shortenLengthenOfTitle(article.title),
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                          color: cantonGrey[900],
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              children: [
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
                Spacer(),
                CantonActionButton(
                  icon: FeatherIcons.bookmark,
                  iconColor: cantonGrey[600],
                  onPressed: () {},
                ),
              ],
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
      return addDotsToString(
        string,
        15,
      );
    } else {
      return string;
    }
  }
}
