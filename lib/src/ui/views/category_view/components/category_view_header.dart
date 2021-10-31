import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/models/source.dart';

class CategoryViewHeader extends StatelessWidget {
  const CategoryViewHeader({Key? key, required this.source}) : super(key: key);

  final Source source;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      elevation: 0,
      backgroundColor: CantonMethods.alternateCanvasColor(context),
      title: Text(
        source.category!,
        style: Theme.of(context).textTheme.headline5,
      ),
      leading: CantonBackButton(isClear: true),
      centerTitle: true,
    );
  }
}
