import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/models/article.dart';
import 'package:intl/intl.dart';

class ArticleDescription extends StatelessWidget {
  const ArticleDescription({
    Key? key,
    required this.isSourceView,
    required this.article,
  }) : super(key: key);

  final bool isSourceView;
  final Article article;

  @override
  Widget build(BuildContext context) {
    final title = isSourceView ? (article.title ?? '') : article.displayTitle;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27),
          child: Text(title, style: Theme.of(context).textTheme.headline4),
        ),
        const SizedBox(height: 12),
        if (article.imagePath != null)
          Image.network(
            article.imageUrl,
            width: double.infinity,
          ),
        const SizedBox(height: 7),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            children: [
              Text(_formatAuthorName(), style: Theme.of(context).textTheme.button),
              if (article.publishedAt != null)
                Text(
                  DateFormat.yMMMd().format(DateTime.parse(article.publishedAt!)),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatAuthorName() {
    final author = article.author;
    if (author == null || author.isEmpty || author.startsWith('http') || author.startsWith('HTTP')) {
      return 'BY UNKNOWN';
    }

    final upperAuthor = author.toUpperCase();
    if (upperAuthor.startsWith('BY ')) {
      return upperAuthor;
    }

    final commaIndex = upperAuthor.indexOf(',');
    if (commaIndex != -1) {
      return upperAuthor.substring(0, commaIndex);
    }

    return 'BY $upperAuthor';
  }
}
