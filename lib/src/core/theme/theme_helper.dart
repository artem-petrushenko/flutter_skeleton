import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/core/theme/color_palette.dart';
import 'package:flutter_skeleton/src/core/theme/typography.dart';

final lightColorPalette = generatePaletteForBrightness(Brightness.light);
final darkColorPalette = generatePaletteForBrightness(Brightness.dark);

const DefaultTypography defaultTypography = DefaultTypography(
  displayLarge: TextStyle(),
  displayMedium: TextStyle(),
  displaySmall: TextStyle(),
  headlineLarge: TextStyle(),
  headlineMedium: TextStyle(),
  headlineSmall: TextStyle(),
  titleLarge: TextStyle(),
  titleMedium: TextStyle(),
  titleSmall: TextStyle(),
  bodyLarge: TextStyle(),
  bodyMedium: TextStyle(),
  bodySmall: TextStyle(),
  labelLarge: TextStyle(),
  labelMedium: TextStyle(),
  labelSmall: TextStyle(),
);

ThemeData createThemeData({
  required ColorPalette palette,
  required DefaultTypography typography,
  required Brightness brightness,
}) =>
    ThemeData(
      brightness: brightness,
      extensions: {palette, typography},
      useMaterial3: true,
    );

ColorPalette generatePaletteForBrightness(Brightness brightness) {
  final materialPalette = ColorScheme.fromSeed(
    seedColor: Colors.transparent,
    dynamicSchemeVariant: DynamicSchemeVariant.monochrome,
    brightness: brightness,
  );

  // TODO: Inject custom colors here
  return ColorPalette(
    background: materialPalette.surface,
    onBackground: materialPalette.onSurface,
  );
}
