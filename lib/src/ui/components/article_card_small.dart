import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/models/article.dart';
import 'package:canton_news_app/src/ui/views/article_view/article_view.dart';

class ArticleCardSmall extends StatelessWidget {
  const ArticleCardSmall(this.article, {this.isSourceView = false});

  final Article article;
  final bool isSourceView;

  @override
  Widget build(BuildContext context) {
    final title = isSourceView ? (article.title ?? '') : article.displayTitle;
    final shortenedTitle = _shortenTitle(title);

    return GestureDetector(
      onTap: () {
        CantonMethods.viewTransition(context, ArticleView(article, isSourceView: isSourceView));
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
            if (article.imagePath != null)
              ClipSquircleBorder(
                radius: BorderRadius.circular(27),
                child: Image.network(
                  article.imageUrl,
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
                    article.name ?? '',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Text(
                    shortenedTitle,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
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
                article.publishedAtFormatted,
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

  String _shortenTitle(String title) {
    final words = title.split(' ');
    if (words.length >= 10) {
      return CantonMethods.addDotsToString(title, 10);
    }
    return title;
  }
}
