import 'package:canton_design_system/canton_design_system.dart';
import 'package:flutter/material.dart';

class CantonPrimaryButton extends StatelessWidget {
  final String buttonText;
  final MainAxisAlignment alignment;
  final EdgeInsets containerPadding;
  final bool enabled;
  final void Function() onPressed;
  final double iconSize, iconPadding, containerWidth, containerHeight, radius;
  final BorderSide border;
  final BorderRadius customBorderRadius;
  final IconData prefixIcon, suffixIcon;
  final Color containerColor, textColor, iconColor;

  const CantonPrimaryButton({
    this.buttonText,
    @required this.onPressed,
    this.alignment,
    this.border,
    this.containerPadding,
    this.radius,
    this.enabled = true,
    this.iconSize,
    this.iconPadding,
    this.containerWidth,
    this.customBorderRadius,
    this.containerHeight,
    this.prefixIcon,
    this.suffixIcon,
    this.containerColor,
    this.textColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    Widget prefixIconWidget() {
      if (prefixIcon != null) {
        return Icon(
          prefixIcon,
          color: iconColor ?? cantonGrey[100],
          size: iconSize ?? 27.0,
        );
      } else {
        return Container();
      }
    }

    Widget suffixIconWidget() {
      if (suffixIcon != null) {
        return Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Icon(
            suffixIcon,
            color: iconColor ?? cantonGrey[100],
            size: iconSize ?? 27.0,
          ),
        );
      } else {
        return Container();
      }
    }

    Widget textWidget() {
      if (buttonText != null) {
        return Text(
          buttonText,
          style: Theme.of(context).textTheme.button.copyWith(
                color: enabled ? textColor : cantonGrey[500],
              ),
        );
      } else {
        return Container();
      }
    }

    return GestureDetector(
      onTap: enabled ? onPressed : null,
      child: Material(
        color: enabled ? containerColor : cantonGrey[300],
        borderRadius: customBorderRadius ?? null,
        shape: customBorderRadius == null
            ? SquircleBorder(
                radius: radius ?? 45,
                side: border ?? BorderSide.none,
              )
            : null,
        child: Container(
          height: containerHeight ?? 65.0,
          width: containerWidth ?? size.width,
          padding:
              containerPadding ?? const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            borderRadius: customBorderRadius ?? null,
          ),
          child: Row(
            mainAxisAlignment: alignment ?? MainAxisAlignment.spaceBetween,
            children: [
              prefixIconWidget(),
              textWidget(),
              suffixIconWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
