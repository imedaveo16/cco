import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SovereignTheme {
  // Core Palette
  static const Color sovereignBlue = Color(0xFF003366);
  static const Color operationalRed = Color(0xFFB71C1C);
  static const Color operationalDark = Color(0xFF0A0E14);
  static const Color panelBackground = Color(0xFF161B22);
  static const Color textPrimary = Color(0xFFE6EDF3);
  static const Color textSecondary = Color(0xFF8B949E);
  static const Color successGreen = Color(0xFF238636);
  static const Color alertOrange = Color(0xFFD27504);

  static ThemeData get themeData {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: operationalDark,
      primaryColor: sovereignBlue,
      cardColor: panelBackground,
      colorScheme: const ColorScheme.dark(
        primary: sovereignBlue,
        secondary: operationalRed,
        surface: panelBackground,
        background: operationalDark,
        error: operationalRed,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: textPrimary,
      ),
      textTheme: GoogleFonts.jetbrainsMonoTextTheme(
        ThemeData.dark().textTheme.apply(
          bodyColor: textPrimary,
          displayColor: textPrimary,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: operationalDark,
        elevation: 0,
        centerTitle: false,
      ),
      iconTheme: const IconThemeData(color: sovereignBlue),
      dividerTheme: const DividerThemeData(
        color: Color(0xFF30363D),
        thickness: 1,
      ),
    );
  }
}
