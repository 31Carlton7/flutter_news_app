import 'package:canton_design_system/canton_design_system.dart';

class ClipSquircleBorder extends StatelessWidget {
  const ClipSquircleBorder({Key key, this.radius, this.child})
      : super(key: key);
  final Widget child;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ShapeBorderClipper(
        shape: SquircleBorder(radius: radius),
      ),
      child: child,
    );
  }
}
