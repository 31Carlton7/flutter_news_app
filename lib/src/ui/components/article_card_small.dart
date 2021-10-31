import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/models/article.dart';
import 'package:canton_news_app/src/ui/views/article_view/article_view.dart';

class ArticleCardSmall extends StatelessWidget {
  const ArticleCardSmall(this.article, this.source);

  @required
  final Article article;
  final bool source;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CantonMethods.viewTransition(context, ArticleView(article, source));
      },
      child: Card(
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius.vertical(
            top: SmoothRadius(
              cornerRadius: kDefaultBorderRadius,
              cornerSmoothing: 1,
            ),
          ),
          side: BorderSide.none,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipSquircleBorder(
              radius: BorderRadius.circular(27),
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
                    article.name!,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Text(
                    shortenLengthenOfTitle(article.title)!,
                    maxLines: 3,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                article.getPublishedAtFormattedTime,
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Theme.of(context).colorScheme.secondaryVariant,
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
  String? shortenLengthenOfTitle(String? string) {
    string = !source ? string!.substring(0, string.indexOf(' - ')) : string;
    if (string!.split(' ').length >= 10) {
      return CantonMethods.addDotsToString(string, 10);
    } else {
      return string;
    }
  }
}
