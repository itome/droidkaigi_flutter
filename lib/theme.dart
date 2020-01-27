import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData get lightTheme {
  const colorScheme = ColorScheme(
    primary: Color(0xFF041E42),
    primaryVariant: Color(0xFF041E42),
    secondary: Color(0xFF00B5E2),
    secondaryVariant: Color(0xFF0097DC),
    surface: Color(0xFFFFFFFF),
    background: Color(0xFFFFFFFF),
    error: Color(0xFFB00020),
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFF000000),
    onSurface: Color(0xFF000000),
    onBackground: Color(0xFF000000),
    onError: Color(0xFFFFFFFF),
    brightness: Brightness.light,
  );

  return ThemeData.light().copyWith(
    colorScheme: colorScheme,
    primaryColor: colorScheme.primary,
    primaryColorDark: colorScheme.primaryVariant,
    backgroundColor: colorScheme.background,
    errorColor: colorScheme.error,
    tabBarTheme: TabBarTheme(
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 2,
            color: colorScheme.onPrimary,
          ),
        ),
      ),
    ),
    textTheme: GoogleFonts.notoSansJPTextTheme(
      TextTheme(
        // headline1
        display4: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 96,
          color: colorScheme.onBackground,
        ),
        // headline2
        display3: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 60,
          color: colorScheme.onBackground,
        ),
        // headline3
        display2: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 48,
          color: colorScheme.onBackground,
        ),
        // headline4
        display1: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 34,
          color: colorScheme.onBackground,
        ),
        // headline5
        headline: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 24,
          color: colorScheme.onBackground,
        ),
        // headline6
        title: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: colorScheme.onBackground,
        ),
        // subtitle1
        subhead: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: colorScheme.onBackground,
        ),
        // subtitle2
        subtitle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: colorScheme.onBackground,
        ),
        // body1
        body1: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: colorScheme.onBackground,
        ),
        // body2
        body2: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: colorScheme.onBackground,
        ),
        // button
        button: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: colorScheme.onBackground,
        ),
        // caption
        caption: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: colorScheme.onBackground,
        ),
        // overline
        overline: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 10,
          color: colorScheme.onBackground,
        ),
      ),
    ),
  );
}
