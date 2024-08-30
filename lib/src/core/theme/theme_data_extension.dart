import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/core/theme/color_palette.dart';
import 'package:flutter_skeleton/src/core/theme/theme_helper.dart';
import 'package:flutter_skeleton/src/core/theme/typography.dart';

/// An extension for theme to get color palette and typography from [BuildContext].
extension ThemeDataExtensions on ThemeData {
  /// The color palette set for the app.
  ColorPalette get colorPalette => extension<ColorPalette>() ?? lightColorPalette;

  /// The typography set for the app.
  DefaultTypography get appTypography => extension<DefaultTypography>() ?? defaultTypography;
}
