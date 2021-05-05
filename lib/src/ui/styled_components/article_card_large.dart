import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/models/article.dart';
import 'package:canton_news_app/src/ui/views/article_view.dart';

class ArticleCardLarge extends StatelessWidget {
  const ArticleCardLarge(this.article);
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
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              child: Text(
                article.name,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(color: CantonColors.green),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                article.title.substring(0, article.title.indexOf(' - ')),
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: CantonColors.textPrimary),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  child: Text(
                    article.getPublishedAtFormattedTime,
                    style: Theme.of(context).textTheme.caption.copyWith(
                          color: CantonColors.iconSecondary,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ),
                Spacer(),
                CantonActionButton(
                  icon: IconlyIcon(
                    IconlyLine.Bookmark,
                    color: CantonColors.iconSecondary,
                  ),
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
}
