import 'package:canton_design_system/canton_design_system.dart';

class CantonHeaderButton extends StatelessWidget {
  const CantonHeaderButton({
    Key key,
    this.backgroundColor,
    this.iconColor,
    this.icon,
    this.onPressed,
    this.radius,
    this.size,
  }) : super(key: key);
  final void Function() onPressed;
  final IconData icon;
  final Color backgroundColor, iconColor;
  final double radius, size;

  @override
  Widget build(BuildContext context) {
    return CantonPrimaryButton(
      containerColor: backgroundColor ?? cantonGrey[200],
      containerHeight: size ?? 60.0,
      containerWidth: size ?? 60.0,
      radius: radius ?? 50,
      containerPadding: const EdgeInsets.all(0),
      prefixIcon: icon,
      alignment: MainAxisAlignment.center,
      iconColor: cantonGrey[600],
      onPressed: onPressed ?? () => Navigator.of(context).pop(),
    );
  }
}
