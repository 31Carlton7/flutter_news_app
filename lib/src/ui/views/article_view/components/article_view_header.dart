import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/models/article.dart';

class ArticleViewHeader extends StatelessWidget {
  const ArticleViewHeader({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: ViewHeaderTwo(
        title: article.name,
        backButton: true,
      ),
    );
  }
}
