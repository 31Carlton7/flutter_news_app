import 'package:canton_design_system/canton_design_system.dart';

class COVID19ViewHeader extends StatelessWidget {
  const COVID19ViewHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      elevation: 0,
      backgroundColor: CantonMethods.alternateCanvasColor(context),
      title: Text(
        'Coronavirus',
        style: Theme.of(context).textTheme.headline5,
      ),
      leading: CantonBackButton(isClear: true),
      centerTitle: true,
    );
  }
}
