import 'package:canton_design_system/canton_design_system.dart';
import 'package:flutter/material.dart';

class CantonTextInput extends StatelessWidget {
  final TextInputType textInputType;
  final String hintText, labelText;
  final Widget prefixIcon, suffixIcon;
  final FocusNode focusNode;
  final bool obscureText, isTextFormField, isTextInputTwo, custom, autoFocus;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final TextCapitalization textCapitalization;
  final double containerWidth, containerHeight;
  final int maxLines;
  final EdgeInsets containerPadding;
  final BorderRadius radius;
  final BorderSide border;
  final Color containerColor,
      enabledBorderColor,
      errorBorderColor,
      focusedBorderColor,
      focusedErrorBorderColor,
      cursorColor,
      borderColor;

  const CantonTextInput({
    Key key,
    this.textInputType,
    this.containerColor,
    this.hintText,
    this.isTextFormField,
    this.enabledBorderColor,
    this.cursorColor,
    this.errorBorderColor,
    this.focusedBorderColor,
    this.custom = false,
    this.focusedErrorBorderColor,
    this.borderColor,
    this.labelText,
    this.isTextInputTwo,
    this.autoFocus = false,
    this.prefixIcon,
    this.maxLines,
    this.border,
    this.radius,
    this.suffixIcon,
    this.focusNode,
    this.onChanged,
    this.obscureText,
    this.controller,
    this.textCapitalization,
    this.containerWidth,
    this.containerHeight,
    this.containerPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Widget labelTextWidget() {
      if (labelText != null) {
        return Column(
          children: [
            Text(
              labelText,
              style: Theme.of(context).inputDecorationTheme.labelStyle,
            ),
            SizedBox(height: 7.0),
          ],
        );
      } else {
        return Container();
      }
    }

    Widget prefixIconWidget() {
      if (prefixIcon != null) {
        return Padding(
          padding: containerPadding ?? const EdgeInsets.all(19),
          child: prefixIcon,
        );
      } else {
        return null;
      }
    }

    Widget suffixIconWidget() {
      if (suffixIcon != null) {
        return Padding(
          padding: containerPadding ?? const EdgeInsets.all(19),
          child: suffixIcon,
        );
      } else {
        return null;
      }
    }

    Widget textInputFieldOne() {
      if (isTextFormField == true) {
        return Material(
          color: containerColor,
          shape: SquircleBorder(
            radius: 40,
            side: border ??
                BorderSide(
                  color: borderColor ?? cantonGrey[400],
                  width: 2,
                ),
          ),
          child: TextFormField(
            obscureText: obscureText,
            controller: controller,
            autofocus: autoFocus,
            maxLines: maxLines ?? 1,
            decoration: InputDecoration(
              /// To change height of Text Field, add contentPadding,
              /// Use EdgeInsets.all,
              /// and change it from 23 to something else.
              /// 23 for height 65, 18 for height 50.
              contentPadding: containerPadding ?? EdgeInsets.all(18),
              hintText: hintText,
              prefixIcon: prefixIconWidget(),
              suffixIcon: suffixIconWidget(),
            ),
          ),
        );
      } else {
        return Material(
          color: containerColor,
          shape: SquircleBorder(
            radius: 40,
            side: border ??
                BorderSide(
                  color: borderColor ?? cantonGrey[400],
                  width: 2,
                ),
          ),
          child: TextField(
            obscureText: false,
            onChanged: onChanged,
            autofocus: autoFocus,
            maxLines: maxLines ?? 1,
            decoration: InputDecoration(
              /// To change height of Text Field, add contentPadding,
              /// Use EdgeInsets.all,
              /// and change it from 23 to something else.
              /// 23 for height 65, 18 for height 50.
              contentPadding: containerPadding ?? EdgeInsets.all(18),
              hintText: hintText,
              prefixIcon: prefixIconWidget(),
              suffixIcon: suffixIconWidget(),
            ),
          ),
        );
      }
    }

    Widget textInputFieldTwo() {
      if (isTextFormField == true) {
        return TextFormField(
          obscureText: obscureText,
          controller: controller,
          onChanged: onChanged,
          autofocus: autoFocus,
          maxLines: maxLines ?? 1,
          cursorColor: cursorColor ?? cantonGrey[900],
          decoration: InputDecoration(
            /// To change height of Text Field, add contentPadding,
            /// Use EdgeInsets.all,
            /// and change it from 23 to something else.
            /// 23 for height 65, 18 for height 50.
            contentPadding: containerPadding ?? EdgeInsets.all(18),
            hintText: hintText,
            prefixIcon: prefixIconWidget(),
            suffixIcon: suffixIconWidget(),
            fillColor: containerColor ?? cantonGrey[200],
            enabledBorder: custom
                ? OutlineInputBorder(
                    borderRadius: radius ?? BorderRadius.circular(17),
                    borderSide: BorderSide(
                      color: enabledBorderColor ?? cantonInvisible,
                      width: 1.5,
                    ),
                  )
                : SquircleInputBorder(
                    radius: 45,
                    side: BorderSide(
                      color: enabledBorderColor ?? cantonInvisible,
                      width: 1.5,
                    ),
                  ),
            errorBorder: custom
                ? OutlineInputBorder(
                    borderRadius: radius ?? BorderRadius.circular(17),
                    borderSide: BorderSide(
                      color: errorBorderColor ?? cantonDanger,
                      width: 1.5,
                    ),
                  )
                : SquircleInputBorder(
                    radius: 45,
                    side: BorderSide(
                      color: errorBorderColor ?? cantonDanger,
                      width: 1.5,
                    ),
                  ),
            focusedBorder: custom
                ? OutlineInputBorder(
                    borderRadius: radius ?? BorderRadius.circular(17),
                    borderSide: BorderSide(
                      color: focusedBorderColor ?? cantonInvisible,
                      width: 1.5,
                    ),
                  )
                : SquircleInputBorder(
                    radius: 45,
                    side: BorderSide(
                      color: focusedBorderColor ?? cantonInvisible,
                      width: 1.5,
                    ),
                  ),
            focusedErrorBorder: custom
                ? OutlineInputBorder(
                    borderRadius: radius ?? BorderRadius.circular(17),
                    borderSide: BorderSide(
                      color: focusedErrorBorderColor ?? cantonDanger,
                      width: 1.5,
                    ),
                  )
                : SquircleInputBorder(
                    radius: 45,
                    side: BorderSide(
                      color: focusedErrorBorderColor ?? cantonDanger,
                      width: 1.5,
                    ),
                  ),
          ),
        );
      } else {
        return Material(
          // shape: SquircleBorder(
          //   radius: 40,
          //   side: border ??
          //       BorderSide(
          //         color: borderColor ?? cantonGrey[400],
          //         width: 2,
          //       ),
          // ),
          child: TextField(
            obscureText: false,
            onChanged: onChanged,
            maxLines: maxLines ?? 1,
            autofocus: autoFocus,
            cursorColor: cursorColor ?? cantonGrey[900],
            decoration: InputDecoration(
              /// To change height of Text Field, add contentPadding,
              /// Use EdgeInsets.all,
              /// and change it from 23 to something else.
              /// 23 for height 65, 18 for height 50. WARNING: This can change if you have prefix Icon
              fillColor: containerColor ?? cantonGrey[200],
              contentPadding: containerPadding ?? EdgeInsets.all(18),
              hintText: hintText,
              prefixIcon: prefixIconWidget(),
              suffixIcon: suffixIconWidget(),
              enabledBorder: SquircleInputBorder(
                radius: 45,
                side: BorderSide(
                  color: enabledBorderColor ?? cantonInvisible,
                  width: 1.5,
                ),
              ),
              errorBorder: SquircleInputBorder(
                radius: 45,
                side: BorderSide(
                  color: errorBorderColor ?? cantonDanger,
                  width: 1.5,
                ),
              ),
              focusedBorder: SquircleInputBorder(
                radius: 45,
                side: BorderSide(
                  color: focusedBorderColor ?? cantonInvisible,
                  width: 1.5,
                ),
              ),
              focusedErrorBorder: SquircleInputBorder(
                radius: 45,
                side: BorderSide(
                  color: focusedErrorBorderColor ?? cantonDanger,
                  width: 1.5,
                ),
              ),
            ),
          ),
        );
      }
    }

    Widget textInput() {
      if (isTextInputTwo == true) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: textInputFieldTwo(),
        );
      } else {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: textInputFieldOne(),
        );
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelTextWidget(),
        Container(
          width: containerWidth ?? size.width,
          child: textInput(),
        ),
      ],
    );
  }
}
