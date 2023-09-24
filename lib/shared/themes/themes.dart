import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors.dart';

class AppTheme {

  static ThemeData lightTheme = ThemeData(
    primaryColor: primary,
    canvasColor: canvas,
    focusColor: const Color(0xffEF9E28).withOpacity(0.1),
    dividerColor: const Color(0xffBBBBBB),
    hintColor: Colors.white,
    splashColor: Colors.white,
    colorScheme: ColorScheme.light(
      background: Colors.white,
      primary: primary,
      secondary: canvas,
      shadow: Colors.black,
      error: Colors.red,
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.roboto(textStyle: const TextStyle(color: Colors.black)),
      displayMedium: GoogleFonts.roboto(textStyle: const TextStyle(color: Colors.black87)),
      displaySmall: GoogleFonts.roboto(textStyle: const TextStyle(color: Colors.black54)),
      titleLarge: GoogleFonts.roboto(textStyle: const TextStyle(color: Colors.black)),
      titleMedium: GoogleFonts.roboto(textStyle: const TextStyle(color: Colors.black87)),
      titleSmall: GoogleFonts.roboto(textStyle: const TextStyle(color: Colors.black54)),
      bodyLarge: GoogleFonts.roboto(textStyle: const TextStyle(color: Colors.black)),
      bodyMedium: GoogleFonts.roboto(textStyle: const TextStyle(color: Colors.black87)),
      bodySmall: GoogleFonts.roboto(textStyle: const TextStyle(color: Colors.black54)),
      labelLarge: GoogleFonts.roboto(textStyle: const TextStyle(color: Colors.black)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 8,
        shadowColor: const Color(0xffEF9E28),
        backgroundColor: const Color(0xffEF9E28),
        textStyle: GoogleFonts.roboto(textStyle: const TextStyle(color: Colors.white)),
      )
    ),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 1,
      shadowColor: Colors.black,
      color: Colors.white,
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 10,
      backgroundColor: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.white,
    disabledColor: const Color(0xff909090),
    shadowColor: Colors.black54,
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: primary,
    canvasColor: canvas,
    focusColor: const Color(0xffEF9E28).withOpacity(0.1),
    dividerColor: const Color(0xffBBBBBB),
    hintColor: const Color(0xff35383F),
    splashColor: const Color(0xff181A20),
    colorScheme: ColorScheme.dark(
      background: const Color(0xff181A20),
      primary: primary,
      secondary: canvas,
      shadow: Colors.white60,
      error: Colors.red,
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.roboto(textStyle: const TextStyle(color: Colors.white)),
      displayMedium: GoogleFonts.roboto(textStyle: const TextStyle(color: Colors.white70)),
      displaySmall: GoogleFonts.roboto(textStyle: const TextStyle(color: Colors.white60)),
      titleLarge: GoogleFonts.roboto(textStyle: const TextStyle(color: Colors.white)),
      titleMedium: GoogleFonts.roboto(textStyle: const TextStyle(color: Colors.white70)),
      titleSmall: GoogleFonts.roboto(textStyle: const TextStyle(color: Colors.white60)),
      bodyLarge: GoogleFonts.roboto(textStyle: const TextStyle(color: Colors.white)),
      bodyMedium: GoogleFonts.roboto(textStyle: const TextStyle(color: Colors.white70)),
      bodySmall: GoogleFonts.roboto(textStyle: const TextStyle(color: Colors.white60)),
      labelLarge: GoogleFonts.roboto(textStyle: const TextStyle(color: Colors.white)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 8,
          shadowColor: primary,
          backgroundColor: primary,
          textStyle: GoogleFonts.roboto(textStyle: const TextStyle(color: Colors.white)),
        )
    ),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 1,
      shadowColor: Colors.white60,
      color: const Color(0xff35383F),
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 10,
      backgroundColor: const Color(0xff35383F),
    ),
    scaffoldBackgroundColor: const Color(0xff181A20),
    disabledColor: const Color(0xff828282),
    shadowColor: Colors.white70,
  );

}