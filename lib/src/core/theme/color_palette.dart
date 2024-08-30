import 'package:flutter/material.dart';

class ColorPalette extends ThemeExtension<ColorPalette> {
  const ColorPalette({
    required this.background,
    required this.onBackground,
  });

  final Color background;
  final Color onBackground;

  @override
  ThemeExtension<ColorPalette> copyWith({
    Color? background,
    Color? onBackground,
  }) {
    return ColorPalette(
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
    );
  }

  @override
  ThemeExtension<ColorPalette> lerp(
    covariant ThemeExtension<ColorPalette>? other,
    double t,
  ) {
    if (other == null || other is! ColorPalette) {
      return this;
    }

    return ColorPalette(
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
    );
  }
}
