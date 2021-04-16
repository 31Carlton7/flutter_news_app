import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/models/article.dart';
import 'package:canton_news_app/src/ui/views/article_view.dart';

class ArticleCardSmall extends StatelessWidget {
  const ArticleCardSmall({Key key, this.firstArticle, this.secondArticle})
      : super(key: key);
  final Article firstArticle, secondArticle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Flexible(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArticleView(firstArticle),
                  ),
                );
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipSquircleBorder(
                      radius: 45,
                      child: Image.network(
                        firstArticle.getImageUrl,
                        fit: BoxFit.cover,
                        height: 125,
                        // width: 125,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      child: Text(
                        firstArticle.title,
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                              color: cantonGrey[900],
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        firstArticle.getPublishedAtFormattedTime,
                        style: Theme.of(context).textTheme.caption.copyWith(
                              color: cantonGrey[600],
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArticleView(secondArticle),
                  ),
                );
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipSquircleBorder(
                      radius: 45,
                      child: Image.network(
                        secondArticle.getImageUrl,
                        fit: BoxFit.cover,
                        height: 125,
                        // width: 125,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      child: Text(
                        secondArticle.title,
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                              color: cantonGrey[900],
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        secondArticle.getPublishedAtFormattedTime.toString() +
                            'h ago',
                        style: Theme.of(context).textTheme.caption.copyWith(
                              color: cantonGrey[600],
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
