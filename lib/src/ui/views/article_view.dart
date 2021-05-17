import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/models/article.dart';
import 'package:intl/intl.dart';

class ArticleView extends StatelessWidget {
  const ArticleView(this.article, this.source) : super();
  final Article article;
  final bool source;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _content(context),
      ),
    );
  }

  Widget _content(BuildContext context) {
    return Column(
      children: [
        _header(context),
        SizedBox(height: 12),
        Expanded(
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  _description(context),
                  SizedBox(height: 12),
                  _body(context),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _header(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CantonBackButton(),
          Text(
            article.name,
            style: Theme.of(context).textTheme.headline6.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
          CantonHeaderButton(
            icon: Icon(
              FeatherIcons.moreVertical,
              color: Theme.of(context).colorScheme.secondaryVariant,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _description(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 27),
          child: Text(
              !source
                  ? article.title.substring(0, article.title.indexOf(' - '))
                  : article.title,
              style: Theme.of(context).textTheme.headline4),
        ),
        article.getImageUrl != null ? SizedBox(height: 12) : Container(),
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
              Text(
                  DateFormat.yMMMd()
                      .format(DateTime.parse(article.publishedAt)),
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
        : article.author.toUpperCase().contains('BY ')
            ? article.author.toUpperCase()
            : article.author.contains(',')
                ? article.author
                    .toUpperCase()
                    .substring(0, article.author.indexOf(','))
                : 'BY ' + article.author.toUpperCase();
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 27),
      child: Text(article.content ?? 'No Content',
          style: Theme.of(context).textTheme.bodyText1),
    );
  }
}
