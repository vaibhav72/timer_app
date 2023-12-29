import 'package:flutter/material.dart';

class MetaColors {
  //Light Mode
  static const Color gradientColorOne = Color(0xFF0C1D4D);
  static const Color gradientColorTwo = Color(0xFF214ECC);

  static ColorScheme getColorScheme() {
    const primaryColor = Color(0xFFFFFFFF);
    const secondaryColor = Color(0xFFFFFFFF);
    const tertiaryColor = Color(0xFFFFFFFF);
    const error = Color(0xFFCC3C21);
    const onPrimary = Colors.black;
    const onSecondary = Colors.white;
    const onTertiary = Colors.black;
    const onError = Colors.white;
    const onBackground = Colors.white;
    const onSurface = Colors.black;

    const onPrimaryContainer = Colors.black;
    const onSecondaryContainer = Colors.white;
    const onTertiaryContainer = Colors.black;
    const onErrorContainer = Color(0xFFCC3C21);

    const primaryContainer = Colors.white;
    const secondaryContainer = Colors.white;
    const tertiaryContainer = Colors.white;
    const errorContainer = Color(0xFFCC3C21);

    return ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor.withOpacity(0.16),
      tertiary: tertiaryColor.withOpacity(0.32),
      error: error,
      onPrimary: onPrimary,
      onSecondary: onSecondary,
      onTertiary: onTertiary,
      onBackground: onBackground,
      onError: onError,
      onSurface: onSurface,
      primaryContainer: primaryContainer,
      secondaryContainer: secondaryContainer.withOpacity(0.16),
      tertiaryContainer: tertiaryContainer.withOpacity(0.32),
      errorContainer: errorContainer.withOpacity(0.32),
      onPrimaryContainer: onPrimaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      onErrorContainer: onErrorContainer,
      brightness: Brightness.light,
    );
  }
}
