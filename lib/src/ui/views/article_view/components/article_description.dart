import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/models/article.dart';
import 'package:intl/intl.dart';

class ArticleDescription extends StatelessWidget {
  const ArticleDescription({Key? key, required this.source, required this.article}) : super(key: key);

  final bool source;
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 27),
          child: Text(!source ? article.title!.substring(0, article.title!.indexOf(' - ')) : article.title!,
              style: Theme.of(context).textTheme.headline4),
        ),
        SizedBox(height: 12),
        Image.network(
          article.getImageUrl,
          width: double.infinity,
        ),
        SizedBox(height: 7),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            children: [
              Text(authorName(), style: Theme.of(context).textTheme.button),
              Text(DateFormat.yMMMd().format(DateTime.parse(article.publishedAt!)),
                  style: Theme.of(context).textTheme.bodyText1)
            ],
          ),
        ),
      ],
    );
  }

  String authorName() {
    return [null, '', 'http', 'HTTP'].contains(article.author)
        ? 'BY UNKNOWN'
        : article.author!.toUpperCase().contains('BY ')
            ? article.author!.toUpperCase()
            : article.author!.contains(',')
                ? article.author!.toUpperCase().substring(0, article.author!.indexOf(','))
                : 'BY ' + article.author!.toUpperCase();
  }
}
