import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MetaStyles {
  static TextTheme getTextTheme() {
    return TextTheme(
        displayLarge:
            GoogleFonts.inter(fontSize: 57, fontWeight: FontWeight.w600),
        displayMedium:
            GoogleFonts.inter(fontSize: 45, fontWeight: FontWeight.w400),
        displaySmall:
            GoogleFonts.inter(fontSize: 36, fontWeight: FontWeight.w600),
        headlineLarge:
            GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.w700),
        headlineMedium:
            GoogleFonts.inter(fontSize: 28, fontWeight: FontWeight.w700),
        headlineSmall:
            GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w700),
        titleLarge:
            GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w600),
        titleMedium: GoogleFonts.inter(
            fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0.15),
        titleSmall: GoogleFonts.inter(
          fontSize: 14,
          letterSpacing: 0.1,
          fontWeight: FontWeight.w500,
        ),
        labelLarge:
            GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500),
        labelMedium: GoogleFonts.inter(
            fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.5),
        labelSmall: GoogleFonts.roboto(
          fontSize: 11,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: GoogleFonts.roboto(
            letterSpacing: .15, fontSize: 16, fontWeight: FontWeight.w400),
        bodyMedium: GoogleFonts.inter(
            fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
        bodySmall: GoogleFonts.inter(
          fontSize: 12,
          letterSpacing: 0.4,
          fontWeight: FontWeight.w400,
        )).apply(displayColor: Colors.white, bodyColor: Colors.white);
  }

  static InputDecoration getInputDecoration(
      {required String label, required ThemeData theme, String? hint}) {
    var borderRadius8 = const BorderRadius.all(Radius.circular(8));
    return InputDecoration(
      labelStyle: theme.textTheme.bodyLarge,
      labelText: label,
      border: OutlineInputBorder(
          borderRadius: borderRadius8,
          borderSide: BorderSide(color: theme.colorScheme.secondary)),
      enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius8,
          borderSide: BorderSide(color: theme.colorScheme.secondary)),
      focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius8,
          borderSide: BorderSide(color: theme.colorScheme.primary)),
      errorBorder: OutlineInputBorder(
          borderRadius: borderRadius8,
          borderSide: BorderSide(color: theme.colorScheme.errorContainer)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: borderRadius8,
          borderSide: BorderSide(color: theme.colorScheme.error)),
      hintText: hint,
    );
  }
}
