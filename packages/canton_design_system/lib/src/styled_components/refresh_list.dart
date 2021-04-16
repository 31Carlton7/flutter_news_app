import 'package:canton_design_system/canton_design_system.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class RefreshList extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;
  final Color color;

  const RefreshList({this.child, this.color, this.onRefresh});
  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      color: color ?? Theme.of(context).primaryColor,
      showChildOpacityTransition: false,
      onRefresh: () => onRefresh(),
      child: child,
    );
  }
}
