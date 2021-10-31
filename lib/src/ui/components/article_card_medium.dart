import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/models/article.dart';
import 'package:canton_news_app/src/ui/views/article_view/article_view.dart';

class ArticleCardMedium extends StatelessWidget {
  const ArticleCardMedium(this.article, this.source);

  @required
  final Article article;
  final bool source;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CantonMethods.viewTransition(context, ArticleView(article, source)),
      child: Card(
        shape: const SquircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(7),
          child: Row(
            children: [
              Flexible(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        article.name!,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Theme.of(context).primaryColor),
                      ),
                      SizedBox(height: 7),
                      Container(
                        width: MediaQuery.of(context).size.width - 64,
                        child: Text(
                          !source ? article.title!.substring(0, article.title!.indexOf(' - ')) : article.title!,
                          style: Theme.of(context).textTheme.headline6!.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      SizedBox(height: 7),
                      Container(
                        width: MediaQuery.of(context).size.width - 164,
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
              ),
              Flexible(
                flex: 1,
                child: ClipSquircleBorder(
                  radius: BorderRadius.circular(27),
                  child: Image.network(
                    article.getImageUrl,
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
