import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_design_system/config/palette.dart';
import 'package:flutter/material.dart';

ThemeData cantonLightTheme() {
  TextTheme _mainTextTheme(TextTheme base) {
    return base.copyWith(
      headline1: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w800,
        fontSize: 60.0,
        height: 1.3,
        letterSpacing: 0.0,
        color: cantonGrey[900],
      ),
      headline2: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w800,
        fontSize: 48.0,
        height: 1.3,
        letterSpacing: 0.0,
        color: cantonGrey[900],
      ),
      headline3: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w800,
        fontSize: 40.0,
        height: 1.3,
        letterSpacing: 0.0,
        color: cantonGrey[900],
      ),
      headline4: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        fontSize: 34.0,
        height: 1.3,
        letterSpacing: 0.0,
        color: cantonGrey[900],
      ),
      headline5: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        fontSize: 24.0,
        height: 1.5,
        letterSpacing: 0.0,
        color: cantonGrey[900],
      ),
      headline6: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        fontSize: 20.0,
        height: 1.5,
        letterSpacing: 0.0,
        color: cantonGrey[900],
      ),
      bodyText1: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontSize: 17.0,
        height: 1.5,
        letterSpacing: 0.0,
        color: cantonGrey[900],
      ),
      bodyText2: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontSize: 15.0,
        height: 1.5,
        letterSpacing: 0.0,
        color: cantonGrey[900],
      ),
      button: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        fontSize: 17.0,
        height: 1.5,
        letterSpacing: 0.0,
        color: cantonGrey[900],
      ),
      caption: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontSize: 12.0,
        height: 1.5,
        letterSpacing: 0.0,
        color: cantonGrey[900],
      ),
      overline: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontSize: 10.0,
        height: 1.5,
        letterSpacing: 0.0,
        color: cantonGrey[900],
      ),
    );
  }

  final ThemeData base = ThemeData.light();
  return base.copyWith(
    textTheme: _mainTextTheme(base.textTheme),
    dividerTheme: DividerThemeData(
      space: 0,
      thickness: 1,
      color: cantonGrey[300],
    ),
    iconTheme: const IconThemeData(
      color: cantonGrey,
      size: 27.0,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: cantonGrey[300],
      actionTextColor: cantonPrimary,
      contentTextStyle: TextStyle(
        color: cantonGrey[900],
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
        letterSpacing: 0.0,
        height: 1.5,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      // 23 for height 65, 18 for height 50
      contentPadding: const EdgeInsets.all(23),
      filled: true,
      isCollapsed: true,
      fillColor: cantonGrey[100],
      hoverColor: cantonGrey[300],
      enabledBorder: SquircleInputBorder(
        radius: 45,
        side: BorderSide(
          color: cantonGrey[400],
          width: 1.5,
        ),
      ),
      errorBorder: const SquircleInputBorder(
        radius: 45,
        side: BorderSide(
          color: cantonDanger,
          width: 1.5,
        ),
      ),
      focusedBorder: const SquircleInputBorder(
        radius: 45,
        side: BorderSide(
          color: cantonPrimary,
          width: 1.5,
        ),
      ),
      focusedErrorBorder: const SquircleInputBorder(
        radius: 45,
        side: BorderSide(
          color: cantonDanger,
          width: 1.5,
        ),
      ),
      helperStyle: const TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w400,
        color: cantonGrey,
        height: 1.5,
      ),
      hintStyle: TextStyle(
        fontSize: 15.0,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w600,
        color: cantonGrey[600],
        height: 1.5,
      ),
      labelStyle: const TextStyle(
        fontSize: 17.0,
        fontWeight: FontWeight.w400,
        color: cantonGrey,
        height: 1.5,
      ),
      prefixStyle: const TextStyle(
        fontSize: 17.0,
        fontWeight: FontWeight.w400,
        color: cantonGrey,
        height: 1.5,
      ),
      suffixStyle: const TextStyle(
        fontSize: 17.0,
        fontWeight: FontWeight.w400,
        color: cantonGrey,
        height: 1.5,
      ),
    ),
    cardTheme: CardTheme(
      shape: SquircleBorder(
        radius: 40,
        side: BorderSide(width: 1.5, color: cantonGrey[200]),
      ),
      elevation: 0.0,
      color: cantonGrey[100],
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: cantonGrey[100],
      modalBackgroundColor: cantonGrey[100],
      modalElevation: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17),
      ),
    ),
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: cantonPrimary),
    primaryColor: cantonGrey[600],
    errorColor: cantonDanger,
    appBarTheme: const AppBarTheme(color: cantonInvisible, elevation: 0.0),
    indicatorColor: cantonPrimary,
    focusColor: cantonPrimary,
    hintColor: cantonGrey[600],
    canvasColor: cantonGrey[100],
    backgroundColor: cantonGrey[100],
    scaffoldBackgroundColor: cantonGrey[100],
    toggleableActiveColor: cantonPrimary,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: cantonInvisible,
      elevation: 0.0,
      selectedItemColor: cantonGrey[900],
      unselectedItemColor: cantonGrey[500],
    ),
  );
}
