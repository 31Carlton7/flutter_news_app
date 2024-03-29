import 'package:canton_design_system/canton_design_system.dart';

class TopStoriesViewHeader extends StatelessWidget {
  const TopStoriesViewHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      elevation: 0,
      backgroundColor: CantonMethods.alternateCanvasColor(context),
      title: Text(
        'Top Stories',
        style: Theme.of(context).textTheme.headline5,
      ),
      centerTitle: true,
    );
  }
}
