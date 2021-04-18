import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/models/article.dart';
import 'package:canton_news_app/src/ui/views/article_view.dart';

class ArticleCardMedium extends StatelessWidget {
  const ArticleCardMedium(this.article);

  @required
  final Article article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => viewTransition(context, ArticleView(article)),
      child: Card(
        shape: const SquircleBorder(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          child: Row(
            children: [
              Flexible(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.name,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(color: cantonSuccess[600]),
                      ),
                      SizedBox(height: 7),
                      Container(
                        width: MediaQuery.of(context).size.width - 64,
                        child: Text(
                          article.title
                              .substring(0, article.title.indexOf(' - ')),
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                color: cantonGrey[900],
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      SizedBox(height: 7),
                      Container(
                        width: MediaQuery.of(context).size.width - 164,
                        child: Text(
                          article.getPublishedAtFormattedTime,
                          style: textTheme(context).caption.copyWith(
                                color: cantonGrey[600],
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ClipSquircleBorder(
                      radius: 40,
                      child: Image.network(
                        article.getImageUrl,
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                    ),
                    CantonActionButton(
                      icon: FeatherIcons.bookmark,
                      iconColor: cantonGrey[600],
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
