import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/core/theme/theme_data_extension.dart';

enum DefaultTextType {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall
}

class DefaultText extends StatelessWidget {
  const DefaultText.displayLarge(
      this.text, {
        super.key,
        this.color,
        this.fontSize,
        this.fontWeight,
        this.decoration,
        this.decorationColor,
        this.textAlign,
        this.maxLines,
        this.overflow,
        this.height,
        this.letterSpacing,
        this.fontFamily,
      }) : _type = DefaultTextType.displayLarge;

  const DefaultText.displayMedium(
      this.text, {
        super.key,
        this.color,
        this.fontSize,
        this.fontWeight,
        this.decoration,
        this.decorationColor,
        this.textAlign,
        this.maxLines,
        this.overflow,
        this.height,
        this.letterSpacing,
        this.fontFamily,
      }) : _type = DefaultTextType.displayMedium;

  const DefaultText.displaySmall(
      this.text, {
        super.key,
        this.color,
        this.fontSize,
        this.fontWeight,
        this.decoration,
        this.decorationColor,
        this.textAlign,
        this.maxLines,
        this.overflow,
        this.height,
        this.letterSpacing,
        this.fontFamily,
      }) : _type = DefaultTextType.displaySmall;

  const DefaultText.headlineLarge(
      this.text, {
        super.key,
        this.color,
        this.fontSize,
        this.fontWeight,
        this.decoration,
        this.decorationColor,
        this.textAlign,
        this.maxLines,
        this.overflow,
        this.height,
        this.letterSpacing,
        this.fontFamily,
      }) : _type = DefaultTextType.headlineLarge;

  const DefaultText.headlineMedium(
      this.text, {
        super.key,
        this.color,
        this.fontSize,
        this.fontWeight,
        this.decoration,
        this.decorationColor,
        this.textAlign,
        this.maxLines,
        this.overflow,
        this.height,
        this.letterSpacing,
        this.fontFamily,
      }) : _type = DefaultTextType.headlineMedium;

  const DefaultText.headlineSmall(
      this.text, {
        super.key,
        this.color,
        this.fontSize,
        this.fontWeight,
        this.decoration,
        this.decorationColor,
        this.textAlign,
        this.maxLines,
        this.overflow,
        this.height,
        this.letterSpacing,
        this.fontFamily,
      }) : _type = DefaultTextType.headlineSmall;

  const DefaultText.titleLarge(
      this.text, {
        super.key,
        this.color,
        this.fontSize,
        this.fontWeight,
        this.decoration,
        this.decorationColor,
        this.textAlign,
        this.maxLines,
        this.overflow,
        this.height,
        this.letterSpacing,
        this.fontFamily,
      }) : _type = DefaultTextType.titleLarge;

  const DefaultText.titleMedium(
      this.text, {
        super.key,
        this.color,
        this.fontSize,
        this.fontWeight,
        this.decoration,
        this.decorationColor,
        this.textAlign,
        this.maxLines,
        this.overflow,
        this.height,
        this.letterSpacing,
        this.fontFamily,
      }) : _type = DefaultTextType.titleMedium;

  const DefaultText.titleSmall(
      this.text, {
        super.key,
        this.color,
        this.fontSize,
        this.fontWeight,
        this.decoration,
        this.decorationColor,
        this.textAlign,
        this.maxLines,
        this.overflow,
        this.height,
        this.letterSpacing,
        this.fontFamily,
      }) : _type = DefaultTextType.titleSmall;

  const DefaultText.bodyLarge(
      this.text, {
        super.key,
        this.color,
        this.fontSize,
        this.fontWeight,
        this.decoration,
        this.decorationColor,
        this.textAlign,
        this.maxLines,
        this.overflow,
        this.height,
        this.letterSpacing,
        this.fontFamily,
      }) : _type = DefaultTextType.bodyLarge;

  const DefaultText.bodyMedium(
      this.text, {
        super.key,
        this.color,
        this.fontSize,
        this.fontWeight,
        this.decoration,
        this.decorationColor,
        this.textAlign,
        this.maxLines,
        this.overflow,
        this.height,
        this.letterSpacing,
        this.fontFamily,
      }) : _type = DefaultTextType.bodyMedium;

  const DefaultText.bodySmall(
      this.text, {
        super.key,
        this.color,
        this.fontSize,
        this.fontWeight,
        this.decoration,
        this.decorationColor,
        this.textAlign,
        this.maxLines,
        this.overflow,
        this.height,
        this.letterSpacing,
        this.fontFamily,
      }) : _type = DefaultTextType.bodySmall;

  const DefaultText.labelLarge(
      this.text, {
        super.key,
        this.color,
        this.fontSize,
        this.fontWeight,
        this.decoration,
        this.decorationColor,
        this.textAlign,
        this.maxLines,
        this.overflow,
        this.height,
        this.letterSpacing,
        this.fontFamily,
      }) : _type = DefaultTextType.labelLarge;

  const DefaultText.labelMedium(
      this.text, {
        super.key,
        this.color,
        this.fontSize,
        this.fontWeight,
        this.decoration,
        this.decorationColor,
        this.textAlign,
        this.maxLines,
        this.overflow,
        this.height,
        this.letterSpacing,
        this.fontFamily,
      }) : _type = DefaultTextType.labelMedium;

  const DefaultText.labelSmall(
      this.text, {
        super.key,
        this.color,
        this.fontSize,
        this.fontWeight,
        this.decoration,
        this.decorationColor,
        this.textAlign,
        this.maxLines,
        this.overflow,
        this.height,
        this.letterSpacing,
        this.fontFamily,
      }) : _type = DefaultTextType.labelSmall;

  final String text;
  final DefaultTextType _type;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? height;
  final double? letterSpacing;
  final String? fontFamily;
  final Color? decorationColor;

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: _getStyle(context)?.copyWith(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      decoration: decoration,
      decorationColor: decorationColor,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily,
    ),
    maxLines: maxLines,
    overflow: overflow,
    textAlign: textAlign,
  );

  TextStyle? _getStyle(BuildContext context) => switch (_type) {
    DefaultTextType.displaySmall => Theme.of(context).appTypography.displaySmall,
    DefaultTextType.displayMedium => Theme.of(context).appTypography.displayMedium,
    DefaultTextType.displayLarge => Theme.of(context).appTypography.displayLarge,
    DefaultTextType.headlineSmall => Theme.of(context).appTypography.headlineSmall,
    DefaultTextType.headlineMedium => Theme.of(context).appTypography.headlineMedium,
    DefaultTextType.headlineLarge => Theme.of(context).appTypography.headlineLarge,
    DefaultTextType.titleSmall => Theme.of(context).appTypography.titleSmall,
    DefaultTextType.titleMedium => Theme.of(context).appTypography.titleMedium,
    DefaultTextType.titleLarge => Theme.of(context).appTypography.titleLarge,
    DefaultTextType.bodySmall => Theme.of(context).appTypography.bodySmall,
    DefaultTextType.bodyMedium => Theme.of(context).appTypography.bodyMedium,
    DefaultTextType.bodyLarge => Theme.of(context).appTypography.bodyLarge,
    DefaultTextType.labelSmall => Theme.of(context).appTypography.labelSmall,
    DefaultTextType.labelMedium => Theme.of(context).appTypography.labelMedium,
    DefaultTextType.labelLarge => Theme.of(context).appTypography.labelLarge,
  };
}
