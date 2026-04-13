import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/models/article.dart';
import 'package:canton_news_app/src/ui/views/article_view/article_view.dart';

class ArticleCardLarge extends StatelessWidget {
  const ArticleCardLarge(this.article, {this.isSourceView = false});

  final Article article;
  final bool isSourceView;

  @override
  Widget build(BuildContext context) {
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
                  height: 200,
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              child: Text(
                article.name ?? '',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                isSourceView ? (article.title ?? '') : article.displayTitle,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
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
}
