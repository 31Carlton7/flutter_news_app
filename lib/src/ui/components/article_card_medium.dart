import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/models/article.dart';
import 'package:canton_news_app/src/ui/views/article_view/article_view.dart';

class ArticleCardMedium extends StatelessWidget {
  const ArticleCardMedium(this.article, {this.isSourceView = false});

  final Article article;
  final bool isSourceView;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CantonMethods.viewTransition(context, ArticleView(article, isSourceView: isSourceView)),
      child: Card(
        shape: const SquircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(7),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.name ?? '',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        isSourceView ? (article.title ?? '') : article.displayTitle,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        article.publishedAtFormatted,
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Theme.of(context).colorScheme.secondaryVariant,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              if (article.imagePath != null)
                Flexible(
                  flex: 1,
                  child: ClipSquircleBorder(
                    radius: BorderRadius.circular(27),
                    child: Image.network(
                      article.imageUrl,
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
