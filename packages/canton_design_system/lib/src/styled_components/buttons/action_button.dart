import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_design_system/src/styled_components/buttons/primary_button.dart';
import 'package:flutter/material.dart';

class CantonActionButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final double iconSize, containerWidth, containerHeight;
  final void Function() onPressed;

  const CantonActionButton({
    @required this.icon,
    @required this.onPressed,
    this.iconColor,
    this.containerWidth,
    this.containerHeight,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return CantonPrimaryButton(
      prefixIcon: icon,
      radius: 0,
      containerColor: cantonInvisible,
      alignment: MainAxisAlignment.center,
      containerWidth: containerWidth ?? 40,
      containerHeight: containerHeight ?? 40,
      iconColor: iconColor ?? cantonGrey[900],
      iconSize: iconSize ?? 21,
      containerPadding: const EdgeInsets.all(5),
      onPressed: onPressed,
    );
  }
}
